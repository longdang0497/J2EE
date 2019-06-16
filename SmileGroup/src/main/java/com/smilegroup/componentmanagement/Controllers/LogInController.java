package com.smilegroup.componentmanagement.Controllers;

import com.smilegroup.componentmanagement.DAO.*;
import com.smilegroup.componentmanagement.Models.LogIn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
public class LogInController {
    @Autowired
    LogInRepository logInRepository;

    @RequestMapping(value = "/home", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doLogIn(@RequestParam("username") String username, @RequestParam("password") String password) {
        boolean isSuccess = true;
        LogIn obj = null;

        if (username != "" && password != "")
        {
            Optional<LogIn> logInOptional = logInRepository.findByUser(username, password);
            if (logInOptional.isPresent())
            {
                obj = logInOptional.get();
                isSuccess = true;
            }
            else
                isSuccess = false;
        }

        //int maPQ = obj.getAuthority().getMaPQ();

        ModelAndView mv = new ModelAndView("index");
        ModelAndView mvError = new ModelAndView("redirect:/");

        if (isSuccess == true)
        {
            mv.addObject("authorityObject", obj);
            return mv;
        }
        else
            return mvError;
    }

//    @RequestMapping(value = "/index/{maPQ}", produces = "application/x-www-form-urlencoded;charset=utf-8")
//    public ModelAndView doHomeWithPQ(@PathVariable("maPQ") int maPQ) {
//        ModelAndView mv = new ModelAndView("index");
//        return mv;
//    }
}
