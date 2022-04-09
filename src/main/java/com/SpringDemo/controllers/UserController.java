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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.hibernate.Session;
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

    public static HashMap<Integer, Users> mapUser = new HashMap<Integer, Users>();

    static {
//        mapUser.put(1, new Users(1, "Nam","hoang",));
//        mapUser.put(2, new Users(2, "Darius"));
//        mapUser.put(3, new Users(3, "Rooney"));
//        mapUser.put(4, new Users(4, "Kagawa"));
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public ResponseEntity<List<Users>> getAllUser() {
//        List<Users> listUser = new ArrayList<Users>(mapUser.values());
        Session session = sessionFactory.getObject().openSession();
//        Query q = session.createQuery("FROM Users");
//        List<Users> users = q.getResultList();
        Query q = session.createNativeQuery("SELECT * FROM Users");
        List<Users> users = q.getResultList();

        Query queryFindByName = session.createNamedQuery("Users.findById");
//        queryFindByName.setParameter(1, "name");
        queryFindByName.setParameter("id", 3);
        List<Users> listCustomer2 = queryFindByName.getResultList();
        return new ResponseEntity<List<Users>>(listCustomer2, HttpStatus.OK);
    }

    /* ---------------- GET ALL USER ------------------------ */
//  @RequestMapping(value = "/users", method = RequestMethod.GET)
//  public ResponseEntity<List<Users>> getAllUser() {
//    List<Users> listUser = new ArrayList<Users>(mapUser.values());
//    return new ResponseEntity<List<Users>>(listUser, HttpStatus.OK);
//  }
    /* ---------------- GET USER BY ID ------------------------ */
    @RequestMapping(value = "/users/{id}", method = RequestMethod.GET)
    public ResponseEntity<Object> getUserById(@PathVariable int id) {
        Users user = mapUser.get(id);
        if (user != null) {
            return new ResponseEntity<Object>(user, HttpStatus.OK);
        }

        return new ResponseEntity<Object>("Not Found User", HttpStatus.NO_CONTENT);
    }

    /* ---------------- CREATE NEW USER ------------------------ */
    @RequestMapping(value = "/users", method = RequestMethod.POST)
    public ResponseEntity<String> createUser(@RequestBody Users user) {
        System.out.println("123" + user.getFirstname());
        if (mapUser.containsKey(user.getId())) {
            return new ResponseEntity<String>("User Already Exist!", HttpStatus.CONFLICT);
        }
        mapUser.put(user.getId(), user);
        return new ResponseEntity<String>("Created!", HttpStatus.CREATED);
    }

    /* ---------------- DELETE USER ------------------------ */
    @RequestMapping(value = "/users/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<String> deleteUserById(@PathVariable int id) {
        Users user = mapUser.get(id);
        if (user == null) {
            return new ResponseEntity<String>("Not Found User", HttpStatus.OK);
        }

        mapUser.remove(id);
        return new ResponseEntity<String>("Deleted!", HttpStatus.OK);
    }

    /* ---------------- UPDATE USER ------------------------ */
    @RequestMapping(value = "/users", method = RequestMethod.PUT)
    public ResponseEntity<String> updateUser(@RequestBody Users user) {
        Users oldUser = mapUser.get(user.getId());
        if (oldUser == null) {
            return new ResponseEntity<String>("Not Found User", HttpStatus.NO_CONTENT);
        }

        // replace old user by new user.
        mapUser.put(user.getId(), user);
        return new ResponseEntity<String>("Updated!", HttpStatus.OK);
    }
}
