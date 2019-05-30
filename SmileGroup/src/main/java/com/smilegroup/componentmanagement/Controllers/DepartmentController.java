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
public class DepartmentController {

    @Autowired
    DepartmentRepository depRepo;

    @RequestMapping("/department")
    public ModelAndView doDepartment() {
        ModelAndView mv = new ModelAndView("department");
        mv.addObject("depLists", depRepo.findAll());
        return mv;
    }

    @RequestMapping(value = "/department&save", method = RequestMethod.POST)
    public ModelAndView doSave(@RequestParam("tenPhong") String tenPhong) {
        ModelAndView mv = new ModelAndView("redirect:/department");
        Department obj = new Department();
        obj.setTenPhong(tenPhong);
        depRepo.save(obj);
        return mv;
    }

    @RequestMapping(value = "/department&edit", method = RequestMethod.POST)
    public ModelAndView doUpdate(@RequestParam("maPhong") int maPhong, @RequestParam("tenPhong") String tenPhong) {
        ModelAndView mv = new ModelAndView("redirect:/department");
        Department obj = null;
        if (maPhong != 0)
        {
            Optional<Department> objOpt = depRepo.findById(maPhong);
            if (objOpt.isPresent()) obj = objOpt.get();
        }
        obj.setTenPhong(tenPhong);
        depRepo.save(obj);

        return mv;
    }

    @RequestMapping(value = "/viewDepartment/{maPhong}", method = RequestMethod.GET)
    public ModelAndView doEdit(@PathVariable("maPhong") int maPhong) {
        ModelAndView mv = new ModelAndView("viewDepartment");
        Optional<Department> objOpt  = this.depRepo.findById(maPhong);
        Department obj = null;
        if(objOpt.isPresent()){
            obj = objOpt.get();
        }
        if(obj == null){
            // Tu tao them class Exception cho Controller
        }
        mv.addObject("depEditList", obj);
        return mv;
    }

    @RequestMapping(value = "/department/delete/{maPhong}", method = RequestMethod.GET)
    public ModelAndView doDelete(@PathVariable("maPhong") int maPhong) {
        ModelAndView mv = new ModelAndView("redirect:/department");
        depRepo.deleteById(maPhong);
        return mv;
    }
}
