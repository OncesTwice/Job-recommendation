/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.SpringDemo.controllers;

//import com.SpringDemo.pojo.User;
import com.SpringDemo.pojo.User;
import com.cloudinary.Cloudinary;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author billg
 */
@RestController
public class SystemController {

//    @Autowired
    private EntityManager entityManager;

    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    private JdbcTemplate jdbcTemplate;

    public static HashMap<Integer, User> mapUser = new HashMap<Integer, User>();

//  Session session = sessionFactory.getObject().openSession();
//  Query queryFindByName = session.createNamedQuery("User.findById");
//  queryFindByName.setParameter("id", 3);
//  List<User> listCustomer2 = queryFindByName.getResultList();
//    Query q = session.createNativeQuery("SELECT * FROM User");
    /* ---------------- CREATE NEW USER ------------------------ */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ResponseEntity<Map<String, String>> createUser(@RequestBody User user) {
        System.out.println("123 " + user.getFirstname());
        System.out.println("123 " + user.getLastname());
        System.out.println("123 " + user.getPhone());
        System.out.println("123 " + user.getAge());
        System.out.println("123 " + user.getEmail());
        System.out.println("123 " + user.getPassword());

        Map<String, String> res = new HashMap<>();
        // check input
//        String a = user.getFirstname();
//        if (a.length() < 5) {
//            return new ResponseEntity<String>("firstname  not valid!" + a, HttpStatus.CONFLICT);
//        }
//        if (user.getLastname() == null) {
//            return new ResponseEntity<String>("firstname not valid!", HttpStatus.CONFLICT);
//        }
//        if (user.getEmail() == null || user.getEmail().length() < 5) {
//            return new ResponseEntity<String>("firstname not valid!", HttpStatus.CONFLICT);
//        }
//        if (user.getPassword() == null || user.getPassword().length() < 5) {
//            return new ResponseEntity<String>("firstname not valid!", HttpStatus.CONFLICT);
//        }

        // check db
        Session session = sessionFactory.getObject().openSession();

        Query qEmail = session.createNamedQuery("User.findByEmail");
        qEmail.setParameter("email", user.getEmail());
        List<User> qEmailResult = qEmail.getResultList();

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
            User u = new User();
            u.setFirstname(user.getFirstname());
            u.setLastname(user.getLastname());
            u.setPhone(user.getPhone());
            u.setAge(user.getAge());
            u.setEmail(user.getEmail());
            u.setPassword(user.getPassword());
            u.setRole(2);
            u.setCreatedAt(date);
            u.setUpdatedAt(date);
            session.save(u);
            System.out.println("Successfully data insert in database");
            tx.commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            res.put("message", e.getMessage());
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

    /* ---------------- Login ------------------------ */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ResponseEntity<Map<String, List<User>>> login(@RequestBody User user) {
        System.out.println("123" + user.getEmail());
        System.out.println("123" + user.getPassword());

        Map<String, List<User>> res1 = new HashMap<>();

        // checkdb
        Session session = sessionFactory.getObject().openSession();

        Query qEmail = session.createNamedQuery("User.findByEmail");
        qEmail.setParameter("email", user.getEmail());
        List<User> qEmailResult = qEmail.getResultList();

        if (qEmailResult.size() == 0) {
//            res.put("message", "Email not Found");
//            return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
        }

        for (User obj : qEmailResult) {
            if (!obj.getPassword().equals(user.getPassword())) {
//                res1.put("message", "Password not match");
//                return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
            }
        }
        // check main
        for (User obj : qEmailResult) {
            obj.setPassword("");
        }
        // res
//        mapUser.put(user.getId(), user);
        res1.put("data", qEmailResult);
        return new ResponseEntity<Map<String, List<User>>>(res1, HttpStatus.OK);
    }


    /* ---------------- UPDATE USER ------------------------ */
//    @RequestMapping(value = "/forgot", method = RequestMethod.PUT)
//    public ResponseEntity<Map<String, String>> updateUser(@RequestBody User user) {
//        Map<String, String> res = new HashMap<>();
//        User oldUser = mapUser.get(user.getId());
//        if (oldUser == null) {
//
//            res.put("message", "fail");
//            return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
//        }
//
//        // replace old user by new user.
////        mapUser.put(user.getId(), user);
//        res.put("message", "success");
//        return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
//    }
}

//        Query qEmailPwd = session.createNamedQuery("User.findByEmail");
//        qEmailPwd.setParameter("id", 3);
//        List<User> qEmailPwdResult = qEmailPwd.getResultList();
//        System.out.println("qEmailResult: " + qEmailResult.size());
//        for (User obj : qEmailResult) {
//            System.out.println("xxx: " + obj.getEmail() + " " + obj.getPassword());
//        }
//        System.out.println("qEmailResult" + qEmailPwdResult);
