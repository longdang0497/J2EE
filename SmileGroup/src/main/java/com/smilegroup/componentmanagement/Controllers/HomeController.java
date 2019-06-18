package com.smilegroup.componentmanagement.Controllers;

import com.smilegroup.componentmanagement.DAO.LogInRepository;
import com.smilegroup.componentmanagement.Models.LogIn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
public class HomeController {

    @Autowired
    LogInRepository logInRepository;

    LogIn logIn = new LogIn();

    @RequestMapping(value = "/", produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doHome() {
        ModelAndView mv = new ModelAndView("login");
        return mv;
    }

    @RequestMapping(value = "/index", produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doReturnHome() {
        ModelAndView mv = new ModelAndView("index");
        return mv;
    }
}