/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.SpringDemo.controllers;

//import com.SpringDemo.pojo.User;
import com.SpringDemo.pojo.Users;
import com.cloudinary.Cloudinary;
import java.util.HashMap;
import java.util.List;

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

    public static HashMap<Integer, Users> mapUser = new HashMap<Integer, Users>();

//  Session session = sessionFactory.getObject().openSession();
//  Query queryFindByName = session.createNamedQuery("Users.findById");
//  queryFindByName.setParameter("id", 3);
//  List<Users> listCustomer2 = queryFindByName.getResultList();
//    Query q = session.createNativeQuery("SELECT * FROM Users");
    /* ---------------- CREATE NEW USER ------------------------ */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ResponseEntity<String> createUser(@RequestBody Users user) {
        System.out.println("123 " + user.getFirstname());
        System.out.println("123 " + user.getLastname());
        System.out.println("123 " + user.getEmail());
        System.out.println("123 " + user.getPassword());
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

        Query qEmail = session.createNamedQuery("Users.findByEmail");
        qEmail.setParameter("email", user.getEmail());
        List<Users> qEmailResult = qEmail.getResultList();

        if (qEmailResult.size() > 0) {
            return new ResponseEntity<String>("Email registered", HttpStatus.CONFLICT);
        }

        // check main
        try {
            Transaction tx = session.beginTransaction();
            Users u = new Users();
            u.setFirstname(user.getFirstname());
            u.setLastname(user.getFirstname());
            u.setEmail(user.getFirstname());
            u.setPassword(user.getFirstname());
            session.save(u);
            System.out.println("Successfully data insert in database");
            tx.commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            session.close();
        }

        // res
//        if (mapUser.containsKey(user.getId())) {
//            return new ResponseEntity<String>("User Already Exist!", HttpStatus.CONFLICT);
//        }
        mapUser.put(user.getId(), user);
        return new ResponseEntity<String>("Created!", HttpStatus.CREATED);
    }

    /* ---------------- Login ------------------------ */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ResponseEntity<String> login(@RequestBody Users user) {
        System.out.println("123" + user.getFirstname());
        if (mapUser.containsKey(user.getId())) {
            return new ResponseEntity<String>("User Already Exist!", HttpStatus.CONFLICT);
        }
        mapUser.put(user.getId(), user);
        return new ResponseEntity<String>("Created!", HttpStatus.CREATED);
    }


    /* ---------------- UPDATE USER ------------------------ */
    @RequestMapping(value = "/forgot", method = RequestMethod.PUT)
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

//        Query qEmailPwd = session.createNamedQuery("Users.findByEmail");
//        qEmailPwd.setParameter("id", 3);
//        List<Users> qEmailPwdResult = qEmailPwd.getResultList();
//        System.out.println("qEmailResult: " + qEmailResult.size());
//        for (Users obj : qEmailResult) {
//            System.out.println("xxx: " + obj.getEmail() + " " + obj.getPassword());
//        }
//        System.out.println("qEmailResult" + qEmailPwdResult);
