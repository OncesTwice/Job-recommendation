/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.SpringDemo.controllers;

//import com.SpringDemo.pojo.User;
import static com.SpringDemo.controllers.BusController.res;
import com.SpringDemo.pojo.Buses;
import com.SpringDemo.pojo.Trips;
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
public class TripController {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    public static Map<String, List<Trips>> res = new HashMap<>();

    /* ---------------- GET ALL Trip ------------------------ */
    @RequestMapping(value = "/trips/all", method = RequestMethod.GET)
    public ResponseEntity<Map<String, List<Trips>>> getAllTrip() {

        Session session = sessionFactory.getObject().openSession();
        Query q = session.createNamedQuery("Trips.findAll");
        List<Trips> listTrip = q.getResultList();

//        session.close();
//        res.put("", "success");
        res.put("data", listTrip);

        return new ResponseEntity<Map<String, List<Trips>>>(res, HttpStatus.OK);
    }

    /* ---------------- GET USER BY ID ------------------------ */
    @RequestMapping(value = "/trips/{id}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, List<Trips>>> getTripById(@PathVariable int id) {
        Session session = sessionFactory.getObject().openSession();
        Query q = session.createNamedQuery("Trips.findById");
        q.setParameter("id", id);
        List<Trips> listTrip = q.getResultList();

//        session.close();
//        res.put("", "success");
        res.put("data", listTrip);

        return new ResponseEntity<Map<String, List<Trips>>>(res, HttpStatus.OK);
    }

//    /* ---------------- CREATE NEW USER ------------------------ */
    @RequestMapping(value = "/trips/create", method = RequestMethod.POST)
    public ResponseEntity<Map<String, String>> createTrip(@RequestBody Trips trip) {
        System.out.println("123 " + trip.getName());
        System.out.println("123 " + trip.getPrice());
        System.out.println("123 " + trip.getStartLocation());
        System.out.println("123 " + trip.getEndLocation());

        Map<String, String> res = new HashMap<>();

        // check db
        Session session = sessionFactory.getObject().openSession();

        Query qEmail = session.createNamedQuery("Trips.findByName");
        qEmail.setParameter("name", trip.getName());
        List<Trips> qEmailResult = qEmail.getResultList();

        if (qEmailResult.size() > 0) {
            res.put("message", "Trips exist");
            return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
        }

        // check main
        Date date = new Date();
        try {
            Transaction tx = session.beginTransaction();
            Trips u = new Trips();
            u.setName(trip.getName());
            u.setPrice(trip.getPrice());
            u.setImg("https://www.smartdatajob.com/images/joomlart/demo/default.jpg");
            u.setStartLocation(trip.getStartLocation());
            u.setEndLocation(trip.getEndLocation());
            u.setCreatedAt(date);
            u.setUpdatedAt(date);

            session.save(u);
            System.out.println("Successfully data insert in database");
            tx.commit();
        } catch (Exception e) {
            res.put("message", e.getMessage());
            return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
        } finally {
            session.close();
        }

        // res
        res.put("message", "success");
        return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
    }
//
//    /* ---------------- DELETE USER ------------------------ */

    @RequestMapping(value = "/trips/delete/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Map<String, String>> deleteUserById(@PathVariable int id) {
        System.out.println(id);
        Session session = sessionFactory.getObject().openSession();
        Transaction tx = session.beginTransaction();
        session.createNativeQuery("DELETE FROM trips WHERE id = ?")
                .setParameter(1, id)
                .executeUpdate();

        tx.commit();

        Map<String, String> res = new HashMap<>();
        res.put("message", "success");
        return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
    }

//    /* ---------------- UPDATE USER ------------------------ */
    @RequestMapping(value = "/trips/update", method = RequestMethod.PUT)
    public ResponseEntity<Map<String, String>> updateUser(@RequestBody Trips trip) {
        System.out.println(trip.getId());
        Date date = new Date();
        Session session = sessionFactory.getObject().openSession();
        Transaction tx = session.beginTransaction();
        session.createNativeQuery("UPDATE trips SET name=?,start_location = ?, end_location=?,updated_at=? WHERE id = ?")
                .setParameter(1, trip.getName())
                .setParameter(2, trip.getStartLocation())
                .setParameter(3, trip.getEndLocation())
                .setParameter(4, date)
                .setParameter(5, trip.getId())
                .executeUpdate();

        tx.commit();

        Map<String, String> res = new HashMap<>();
        res.put("message", "success");
        return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
    }
}


//    @RequestMapping(value = "/users", method = RequestMethod.GET)
//    public ResponseEntity<List<Users>> getAllUser() {
////        List<Users> listUser = new ArrayList<Users>(mapUser.values());
//        Session session = sessionFactory.getObject().openSession();
////        Query q = session.createQuery("FROM Users");
////        List<Users> users = q.getResultList();
//        Query q = session.createNativeQuery("SELECT * FROM Users");
//        List<Users> users = q.getResultList();
//
//        Query queryFindByName = session.createNamedQuery("Users.findById");
////        queryFindByName.setParameter(1, "name");
//        queryFindByName.setParameter("id", 3);
//        List<Users> listCustomer2 = queryFindByName.getResultList();
//        return new ResponseEntity<List<Users>>(listCustomer2, HttpStatus.OK);
//    }

