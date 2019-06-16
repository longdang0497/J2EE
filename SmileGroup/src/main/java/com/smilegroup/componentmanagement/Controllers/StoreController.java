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
public class StoreController {

    @Autowired
    StoreRepository storeRepo;

    @Autowired
    LogInRepository logInRepository;

    LogIn logIn = new LogIn();

    @RequestMapping(value = "role={maPQ}/nv={maNV}/store", produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doStore(@PathVariable("maPQ") int maPQ, @PathVariable("maNV") int maNV) {
        ModelAndView mv = null;
        if (maPQ != 0 && maNV != 0)
        {
            Optional<LogIn> logInOptional = logInRepository.findByUserByID(maNV, maPQ);
            if (logInOptional.isPresent())
            {
                logIn = logInOptional.get();
                if (logIn.getAuthority().getMaPQ() == 1 || logIn.getAuthority().getMaPQ() == 2 || logIn.getAuthority().getMaPQ() == 3)
                {
                    mv = new ModelAndView("store");
                    mv.addObject("storeLists", storeRepo.findAll());
                    mv.addObject("authorityObject", logIn);
                }
            }
        }
        return mv;
    }

    @RequestMapping(value = "/store&save", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doSave(@RequestParam("tenKhu") String tenKhu) {
        ModelAndView mv = new ModelAndView("redirect:/store");
        Store obj = new Store();
        obj.setTenKhu(tenKhu);
        storeRepo.save(obj);
        return mv;
    }

    @RequestMapping(value = "/store&edit", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doUpdate(@RequestParam("maKhu") int maKhu, @RequestParam("tenKhu") String tenKhu) {
        ModelAndView mv = new ModelAndView("redirect:/store");
        Store obj = null;
        if (maKhu != 0)
        {
            Optional<Store> objOpt = storeRepo.findById(maKhu);
            if (objOpt.isPresent()) obj = objOpt.get();
        }
        obj.setTenKhu(tenKhu);
        storeRepo.save(obj);

        return mv;
    }

    @RequestMapping(value = "/viewStore/{maKhu}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doEdit(@PathVariable("maKhu") int maKhu) {
        ModelAndView mv = new ModelAndView("viewStore");
        Optional<Store> objOpt  = this.storeRepo.findById(maKhu);
        Store obj = null;
        if(objOpt.isPresent()){
            obj = objOpt.get();
        }
        if(obj == null){
            // Tu tao them class Exception cho Controller
        }
        mv.addObject("storeEditList", obj);
        return mv;
    }

    @RequestMapping(value = "/store/delete/{maKhu}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doDelete(@PathVariable("maKhu") int maKhu) {
        ModelAndView mv = new ModelAndView("redirect:/store");
        storeRepo.deleteById(maKhu);
        return mv;
    }
}
