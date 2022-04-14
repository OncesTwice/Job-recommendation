/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.SpringDemo.controllers;

//import com.SpringDemo.pojo.User;
import com.SpringDemo.pojo.Users;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.google.protobuf.TextFormat.ParseException;

import com.mysql.cj.xdevapi.SessionFactory;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author billg
 */
@RestController
public class UserController {

//    @Autowired
    private EntityManager entityManager;

    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    private JdbcTemplate jdbcTemplate;

    public static Map<String, List<Users>> res = new HashMap<>();

    static {
//        mapUser.put(1, new Users(1, "Nam","hoang",));
//        mapUser.put(2, new Users(2, "Darius"));
//        mapUser.put(3, new Users(3, "Rooney"));
//        mapUser.put(4, new Users(4, "Kagawa"));
    }

    @RequestMapping(value = "/users/all", method = RequestMethod.GET)
    public ResponseEntity<Map<String, List<Users>>> getAllUser() {

        Session session = sessionFactory.getObject().openSession();
        Query q = session.createNamedQuery("Users.findAll");
        List<Users> listUser = q.getResultList();

//        session.close();
//        res.put("", "success");
        for (Users obj : listUser) {
            obj.setPassword("");
        }
        res.put("data", listUser);

        return new ResponseEntity<Map<String, List<Users>>>(res, HttpStatus.OK);
    }

    /* ---------------- GET ALL USER ------------------------ */
//  @RequestMapping(value = "/users", method = RequestMethod.GET)
//  public ResponseEntity<List<Users>> getAllUser() {
//    List<Users> listUser = new ArrayList<Users>(mapUser.values());
//    return new ResponseEntity<List<Users>>(listUser, HttpStatus.OK);
//  }
    /* ---------------- GET USER BY ID ------------------------ */
//    @RequestMapping(value = "/users/{id}", method = RequestMethod.GET)
//    public ResponseEntity<Object> getUserById(@PathVariable int id) {
//        Users user = mapUser.get(id);
//        if (user != null) {
//            return new ResponseEntity<Object>(user, HttpStatus.OK);
//        }
//
//        return new ResponseEntity<Object>("Not Found User", HttpStatus.NO_CONTENT);
//    }
//
//    /* ---------------- Manager add NEW USER ------------------------ */
    @RequestMapping(value = "/users/create", method = RequestMethod.POST)
    public ResponseEntity<Map<String, String>> createUserByManager(@RequestBody Users user) {
        System.out.println("123 " + user.getFirstname());
        System.out.println("123 " + user.getLastname());
        System.out.println("123 " + user.getEmail());
        System.out.println("123 " + user.getPassword());
        System.out.println("123 " + user.getRole());

        Map<String, String> res = new HashMap<>();

        // check db
        Session session = sessionFactory.getObject().openSession();

        Query qEmail = session.createNamedQuery("Users.findByEmail");
        qEmail.setParameter("email", user.getEmail());
        List<Users> qEmailResult = qEmail.getResultList();

        if (qEmailResult.size() > 0) {
            res.put("message", "Email exist");
            return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
        }

        // check main
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        System.out.println(dtf.format(now));

        Date date = new Date();
        try {
            Transaction tx = session.beginTransaction();
            Users u = new Users();
            u.setFirstname(user.getFirstname());
            u.setLastname(user.getLastname());
            u.setEmail(user.getEmail());
            u.setPassword(user.getPassword());
            u.setRole(user.getRole());
            u.setCreatedAt(date);
            u.setUpdatedAt(date);

            session.save(u);
            System.out.println("Successfully data insert in database");
            tx.commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            res.put("message", "fail");
            return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
        } finally {
            session.close();
        }

        // res
//        if (mapUser.containsKey(user.getId())) {
//            return new ResponseEntity<String>("User Already Exist!", HttpStatus.CONFLICT);
//        }
//        mapUser.put(user.getId(), user);
        res.put("message", "success");
        return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
    }
//

    /* ---------------- DELETE USER ------------------------ */
    @RequestMapping(value = "/users/delete/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Map<String, String>> deleteUserById(@PathVariable int id) {
        System.out.println(id);
        Session session = sessionFactory.getObject().openSession();
        Transaction tx = session.beginTransaction();
        session.createNativeQuery("DELETE FROM Users WHERE id = ?")
                .setParameter(1, id)
                .executeUpdate();

        tx.commit();

        Map<String, String> res = new HashMap<>();
        res.put("message", "success");
        return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
    }
//
//    /* ---------------- UPDATE USER ------------------------ */

    @RequestMapping(value = "/users/update", method = RequestMethod.PUT)
    public ResponseEntity<Map<String, String>> updateUser(@RequestBody Users user) {
        System.out.println(user.getId());
        Date date = new Date();
        Session session = sessionFactory.getObject().openSession();
        Transaction tx = session.beginTransaction();
        session.createNativeQuery("UPDATE users SET firstname=?,lastname=?,password = ?,role=?,updated_at=? WHERE id = ?")
                .setParameter(1, user.getFirstname())
                .setParameter(2, user.getLastname())
                .setParameter(3, user.getPassword())
                .setParameter(4, user.getRole())
                .setParameter(5, date)
                .setParameter(6, user.getId())
                .executeUpdate();

        tx.commit();

        Map<String, String> res = new HashMap<>();
        res.put("message", "success");
        return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
    }
}
