/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.SpringDemo.controllers;

import static com.SpringDemo.controllers.BusController.res;
import com.SpringDemo.pojo.Buses;
import com.SpringDemo.pojo.Orders;
import com.SpringDemo.pojo.Trips;
import com.cloudinary.Cloudinary;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Kien Mason
 */
@RestController
public class OrderController {

    private EntityManager entityManager;

    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    public static Map<String, List<Orders>> res = new HashMap<>();

    @RequestMapping(value = "orders/all", method = RequestMethod.GET)
    public ResponseEntity<Map<String, List<Orders>>> getAllOrder() {
        System.out.println("11111111");
        Session session = sessionFactory.getObject().openSession();

        Query queryFindByName = session.createNamedQuery("Orders.findAll");
        List<Orders> lisdOrder = queryFindByName.getResultList();

        res.put("data", lisdOrder);
        return new ResponseEntity<Map<String, List<Orders>>>(res, HttpStatus.OK);
    }

    @RequestMapping(value = "/orders/create", method = RequestMethod.POST)
    public ResponseEntity<Map<String, String>> createTrip(@RequestBody Orders order) {
        System.out.println("123 " + order.getPrice());
        System.out.println("123 " + order.getUserId());
        System.out.println("123 " + order.getTripId());
        System.out.println("123 " + order.getBusId());

        Map<String, String> res = new HashMap<>();

        // check db
        Session session = sessionFactory.getObject().openSession();

//        Query qEmail = session.createNamedQuery("Orders.findByName");
//        qEmail.setParameter("name", order.getName());
//        List<Orders> qEmailResult = qEmail.getResultList();
//
//        if (qEmailResult.size() > 0) {
//            res.put("message", "orders exist");
//            return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
//        }
        // check main
        Date date = new Date();
        try {
            Transaction tx = session.beginTransaction();
            Orders u = new Orders();
            u.setPrice(order.getPrice());
            u.setUserId(order.getUserId());
            u.setTripId(order.getTripId());
            u.setBusId(order.getBusId());
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

//    @RequestMapping(value = "/buses/all1", method = RequestMethod.GET)
//    public ResponseEntity<Map<String, List<Buses>>> getAllBus() {
//
//        Session session = sessionFactory.getObject().openSession();
//        Query q = session.createNamedQuery("Users.findAll");
//        List<Buses> listBus = q.getResultList();
//
////        session.close();
////        res.put("", "success");
//        res.put("data", listBus);
//
//        return new ResponseEntity<Map<String, List<Buses>>>(res, HttpStatus.OK);
//    }
}
