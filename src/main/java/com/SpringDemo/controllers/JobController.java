/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.SpringDemo.controllers;

//import com.SpringDemo.pojo.User;


import com.SpringDemo.pojo.Job;
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


@RestController
public class JobController {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    public static Map<String, List<Job>> res = new HashMap<>();

    @RequestMapping(value = "/job/all", method = RequestMethod.GET)
    public ResponseEntity<Map<String, List<Job>>> getAll() {

        Session session = sessionFactory.getObject().openSession();
        Query q = session.createNamedQuery("Job.findAll");
        List<Job> listJob = q.getResultList();

        res.put("data", listJob);

        return new ResponseEntity<Map<String, List<Job>>>(res, HttpStatus.OK);
    }

    @RequestMapping(value = "/job/{id}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, List<Job>>> getById(@PathVariable int id) {
        Session session = sessionFactory.getObject().openSession();
        Query q = session.createNamedQuery("Job.findById");
        q.setParameter("id", id);
        List<Job> listJob = q.getResultList();


        res.put("data", listJob);

        return new ResponseEntity<Map<String, List<Job>>>(res, HttpStatus.OK);
    }

    @RequestMapping(value = "/job/search/{position}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, List<Job>>> getJobByName(@PathVariable String position) {
        Session session = sessionFactory.getObject().openSession();
        Query q = session.createNamedQuery("Job.findByPosition");
        q.setParameter("position", '%' + position + '%');
        List<Job> listJob = q.getResultList();

        res.put("data", listJob);

        return new ResponseEntity<Map<String, List<Job>>>(res, HttpStatus.OK);
    }
//
//    @RequestMapping(value = "/job/create", method = RequestMethod.POST)
//    public ResponseEntity<Map<String, String>> createJob(@RequestBody Job job) {
//        System.out.println("123 " + job.getName());
//        System.out.println("123 " + job.getPrice());
//        System.out.println("123 " + job.getStartLocation());
//        System.out.println("123 " + job.getEndLocation());
//
//        Map<String, String> res = new HashMap<>();
//
//        // check db
//        Session session = sessionFactory.getObject().openSession();
//
//        Query qEmail = session.createNamedQuery("Job.findByName");
//        qEmail.setParameter("name", job.getName());
//        List<Job> qEmailResult = qEmail.getResultList();
//
//        if (qEmailResult.size() > 0) {
//            res.put("message", "job exist");
//            return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
//        }
//
//        // check main
//        Date date = new Date();
//        try {
//            Transaction tx = session.beginTransaction();
//            Job u = new Job();
//            u.setName(job.getName());
//            u.setPrice(job.getPrice());
//            u.setImg("default.png");
//            u.setStartLocation(job.getStartLocation());
//            u.setEndLocation(job.getEndLocation());
//            u.setCreatedAt(date);
//            u.setUpdatedAt(date);
//
//            session.save(u);
//            System.out.println("Successfully data insert in database");
//            tx.commit();
//        } catch (Exception e) {
//            res.put("message", e.getMessage());
//            return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
//        } finally {
//            session.close();
//        }
//
//        // res
//        res.put("message", "success");
//        return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
//    }
//
//    @RequestMapping(value = "/job/delete/{id}", method = RequestMethod.DELETE)
//    public ResponseEntity<Map<String, String>> deleteUserById(@PathVariable int id) {
//        System.out.println(id);
//        Session session = sessionFactory.getObject().openSession();
//        Transaction tx = session.beginTransaction();
//        session.createNativeQuery("DELETE FROM job WHERE id = ?")
//                .setParameter(1, id)
//                .executeUpdate();
//
//        tx.commit();
//
//        Map<String, String> res = new HashMap<>();
//        res.put("message", "success");
//        return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
//    }
//
//    @RequestMapping(value = "/job/update", method = RequestMethod.PUT)
//    public ResponseEntity<Map<String, String>> updateUser(@RequestBody Job job) {
//        System.out.println(job.getId());
//        Date date = new Date();
//        Session session = sessionFactory.getObject().openSession();
//        Transaction tx = session.beginTransaction();
//        session.createNativeQuery("UPDATE job SET name=?,price=?,start_location = ?, end_location=?,updated_at=? WHERE id = ?")
//                .setParameter(1, job.getName())
//                .setParameter(2, job.getPrice())
//                .setParameter(3, job.getStartLocation())
//                .setParameter(4, job.getEndLocation())
//                .setParameter(5, date)
//                .setParameter(6, job.getId())
//                .executeUpdate();
//
//        tx.commit();
//
//        Map<String, String> res = new HashMap<>();
//        res.put("message", "success");
//        return new ResponseEntity<Map<String, String>>(res, HttpStatus.OK);
//    }
}
