/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.SpringDemo.controllers;

//import com.SpringDemo.pojo.User;
import static com.SpringDemo.controllers.UserController.mapUser;
import com.SpringDemo.pojo.Buses;
import com.SpringDemo.pojo.Users;
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
public class BusController {

    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    public static HashMap<Integer, Users> mapUser = new HashMap<Integer, Users>();
    public static Map<String, List<Buses>> res = new HashMap<>();

    @RequestMapping(value = "buses/all", method = RequestMethod.GET)
    public ResponseEntity<Map<String, List<Buses>>> getAllBus() {

        Session session = sessionFactory.getObject().openSession();
        Query q = session.createNamedQuery("Trips.findAll");
        List<Buses> listTrip = q.getResultList();

//        session.close();
//        res.put("", "success");
        res.put("data", listTrip);

        return new ResponseEntity<Map<String, List<Buses>>>(res, HttpStatus.OK);
    }

//    @RequestMapping(value = "/novopost/{id}", method = RequestMethod.POST)
// public String savePost(@Valid Post post, @PathVariable("id") long id){
//    @RequestMapping(value = "/bus/location/{id}", method = RequestMethod.GET)
//    public ResponseEntity<Map<String, List<Buses>>> getUserById(@PathVariable("id") Integer id) {
//        System.out.println("location: " + id);
//
//        Session session = sessionFactory.getObject().openSession();
//        Query q = session.createNamedQuery("Buses.findById");
//        q.setParameter("id", id);
//        List<Buses> listBus = q.getResultList();
//
////        session.close();
//        res.put("data", listBus);
//
//        return new ResponseEntity<Map<String, List<Buses>>>(res, HttpStatus.OK);
//
//    }
}

//        Query qEmailPwd = session.createNamedQuery("Users.findByEmail");
//        qEmailPwd.setParameter("id", 3);
//        List<Users> qEmailPwdResult = qEmailPwd.getResultList();
//        System.out.println("qEmailResult: " + qEmailResult.size());
//        for (Users obj : qEmailResult) {
//            System.out.println("xxx: " + obj.getEmail() + " " + obj.getPassword());
//        }
//        System.out.println("qEmailResult" + qEmailPwdResult);

