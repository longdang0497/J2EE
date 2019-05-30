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
public class UnitController {

    @Autowired
    UnitRepository unitRepo;

    @RequestMapping(value = "/unit", produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doUnit() {
        ModelAndView mv = new ModelAndView("unit");
        mv.addObject("unitLists", unitRepo.findAll());
        return mv;
    }

    @RequestMapping(value = "/unit&save", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doSave(@RequestParam("tenDV") String tenDV) {
        ModelAndView mv = new ModelAndView("redirect:/unit");
        Unit obj = new Unit();
        obj.setTenDV(tenDV);
        unitRepo.save(obj);
        return mv;
    }

    @RequestMapping(value = "/unit&edit", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doUpdate(@RequestParam("maDV") int maDV, @RequestParam("tenDV") String tenDV) {
        ModelAndView mv = new ModelAndView("redirect:/unit");
        Unit obj = null;
        if (maDV != 0)
        {
            Optional<Unit> objOpt = unitRepo.findById(maDV);
            if (objOpt.isPresent()) obj = objOpt.get();
        }
        obj.setTenDV(tenDV);
        unitRepo.save(obj);

        return mv;
    }

    @RequestMapping(value = "/viewUnit/{maDV}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doEdit(@PathVariable("maDV") int maDV) {
        ModelAndView mv = new ModelAndView("viewUnit");
        Optional<Unit> objOpt  = this.unitRepo.findById(maDV);
        Unit obj = null;
        if(objOpt.isPresent()){
            obj = objOpt.get();
        }
        if(obj == null){
            // Tu tao them class Exception cho Controller
        }
        mv.addObject("unitEditList", obj);
        return mv;
    }

    @RequestMapping(value = "/unit/delete/{maDV}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doDelete(@PathVariable("maDV") int maDV) {
        ModelAndView mv = new ModelAndView("redirect:/unit");
        unitRepo.deleteById(maDV);
        return mv;
    }
}
