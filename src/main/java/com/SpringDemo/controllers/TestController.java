/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.SpringDemo.controllers;

import com.SpringDemo.pojo.Category;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Kien Mason
 */
@RestController
@RequestMapping("/api")
public class TestController {

    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @GetMapping("/test")
    public ResponseEntity<Map<String, String>> getTest() {
        System.out.println("In GET MOTHOD");
        Map<String, String> res = new HashMap<>();
        res.put("message", "123");
        return new ResponseEntity<Map<String, String>>(res, HttpStatus.CREATED);
    }

//    @PostMapping("/c")
//    public ResponseEntity<Category> createEmployee(@RequestBody Category category) {
//        HttpHeaders headers = new HttpHeaders();
//        if (category == null) {
//            return new ResponseEntity<Category>(HttpStatus.BAD_REQUEST);
//        }
//        Session session = sessionFactory.getObject().openSession();
//        Query q = session.createQuery("SELECT name FROM Customer c WHERE c.name LIKE 'MOBILE'");
//        List<Category> cates = q.getResultList();
////  employeeService.createEmployee(employee);
//        headers.add("Employee Created  - ", String.valueOf(cates));
//        return new ResponseEntity<Category>(category, headers, HttpStatus.CREATED);
//    }

}
