package com.smilegroup.componentmanagement.Controllers;

import com.smilegroup.componentmanagement.Models.*;
import com.smilegroup.componentmanagement.DAO.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
public class TypeOfComponentController {

    @Autowired
    TypeOfComponentRepository tocRepo;

    @RequestMapping(value = "/typeofcomponent", produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doTypeOfComponent() {
        ModelAndView mv = new ModelAndView("typeofcomponent");
        mv.addObject("tocLists", tocRepo.findAll());
        return mv;
    }

    @RequestMapping(value = "/typeofcomponent&save", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doSave(@RequestParam("tenLoai") String tenLoai) {
        ModelAndView mv = new ModelAndView("redirect:/typeofcomponent");
        TypeOfComponent obj = new TypeOfComponent();
        obj.setTenLoai(tenLoai);
        tocRepo.save(obj);
        return mv;
    }

    @RequestMapping(value = "/typeofcomponent&edit", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doUpdate(@RequestParam("maLoai") int maLoai, @RequestParam("tenLoai") String tenLoai) {
        ModelAndView mv = new ModelAndView("redirect:/typeofcomponent");
        TypeOfComponent obj = null;
        if (maLoai != 0)
        {
            Optional<TypeOfComponent> cusOpt = tocRepo.findById(maLoai);
            if (cusOpt.isPresent()) obj = cusOpt.get();
        }
        obj.setTenLoai(tenLoai);
        tocRepo.save(obj);

        return mv;
    }

    @RequestMapping(value = "/viewTypeOfComponent/{maLoai}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doEdit(@PathVariable("maLoai") int maLoai) {
        ModelAndView mv = new ModelAndView("viewTypeOfComponent");
        Optional<TypeOfComponent> objOpt  = this.tocRepo.findById(maLoai);
        TypeOfComponent obj = null;
        if(objOpt.isPresent()){
            obj = objOpt.get();
        }
        if(obj == null){
            // Tu tao them class Exception cho Controller
        }
        mv.addObject("tocEditList", obj);
        return mv;
    }

    @RequestMapping(value = "/typeofcomponent/delete/{maLoai}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doDelete(@PathVariable("maLoai") int maLoai) {
        ModelAndView mv = new ModelAndView("redirect:/typeofcomponent");
        tocRepo.deleteById(maLoai);
        return mv;
    }
}
