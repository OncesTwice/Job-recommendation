/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.SpringDemo.controllers;

//import com.SpringDemo.pojo.User;
import com.SpringDemo.pojo.Category;
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

/**
 *
 * @author billg
 */
@Controller
public class HomeController {
//

    public static HashMap<Integer, Category> mapUser = new HashMap<Integer, Category>();

    static {
        mapUser.put(1, new Category(1, "Nam"));
        mapUser.put(2, new Category(2, "Darius"));
        mapUser.put(3, new Category(3, "Rooney"));
        mapUser.put(4, new Category(4, "Kagawa"));
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public ResponseEntity<List<Category>> getAllUser() {
        List<Category> listUser = new ArrayList<Category>(mapUser.values());
        Session session = sessionFactory.getObject().openSession();
        Query q = session.createQuery("From Category");
        List<Category> cates = q.getResultList();
        return new ResponseEntity<List<Category>>(cates, HttpStatus.OK);
    }

    //
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    private JdbcTemplate jdbcTemplate;

    @RequestMapping("/")
    @Transactional
    public String index(Model model, @RequestParam(name = "kw", required = false) String kw,
            @RequestParam(name = "page", defaultValue = "1") Integer page) {
        model.addAttribute("name", "Nguyen Xuan Ha");

        Session session = sessionFactory.getObject().openSession();
        Query q = session.createQuery("From Category");
        List<Category> cates = q.getResultList();

        session.close();
//       model.addAttribute("weds", this.wedService.getWeds());
//        model.addAttribute("cates", cates);
        return "index";
    }

    @RequestMapping(value = "/a", method = RequestMethod.GET, produces = {"application/json"})
    @ResponseBody
    private Map<String, String> getListOfUsers() throws ParseException {
        Map<String, String> map = new HashMap<>();
        map.put("name", "Rohan");
        map.put("sname", "Kumar");

        return map;
    }

    @RequestMapping(value = "/b", method = RequestMethod.GET, produces = {"application/json"})
    @ResponseBody
    private Map<String, Object> getListOfUsers1() throws ParseException {
        Map<String, Object> rtn = new LinkedHashMap<>();

//    rtn.put("pic", image);
        Session session = sessionFactory.getObject().openSession();
        Query q = session.createQuery("From Category");
        List<Category> cates = q.getResultList();
        rtn.put("potato", "King Potato");
        rtn.put("potats", cates);

        return rtn;
    }

    //   @PostMapping("/upload")
    //  public String upload(@ModelAttribute(value="user")User user){
    //      try {
    //         Map res = this.cloudinary.uploader().upload(user.getAvatar().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
    //         System.err.println(res);
    //     } catch (IOException ex) {
    //         Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
    //     }
    //    return "redirect:/login?path=test";
    //  }
    @RequestMapping("/Hello/{name}")
    public String GetPath(Model model, @PathVariable(name = "name") String name) {
        model.addAttribute("name", name);
        return "index";
    }

    @RequestMapping("/Hello2")
    public String Hello2(Model model, @RequestParam(required = false) Map<String, String> params) {
        String fn = params.get("firstName");
        String ln = params.get("lastName");
        model.addAttribute("name", fn + " " + ln);
        return "index";
    }

    //  @GetMapping("/login")
    //  public String loginView(Model model){
    //      model.addAttribute("user", new User());
    //     return "login";
    //  }
    //  @PostMapping("/login")
    //  public String loginHandler(Model model, @ModelAttribute(value = "user")User user){
    //    if(user.getUsername().equals("admin") && user.getPassword().equals("123"))
    //     model.addAttribute("message", "successful");
    //   else
    //       model.addAttribute("message", "Failed");
    //    return "login";
    // }
    @Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource message = new ResourceBundleMessageSource();
        message.setBasenames("message");

        return message;
    }
}
