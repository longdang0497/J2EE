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

    @Autowired
    LogInRepository logInRepository;

    LogIn logIn = new LogIn();

    @RequestMapping(value = "role={maPQ}/nv={maNV}/unit", produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doUnit(@PathVariable("maPQ") int maPQ, @PathVariable("maNV") int maNV) {
        ModelAndView mv = null;
        if (maPQ != 0 && maNV != 0)
        {
            Optional<LogIn> logInOptional = logInRepository.findByUserByID(maNV, maPQ);
            if (logInOptional.isPresent())
            {
                logIn = logInOptional.get();
                if (logIn.getAuthority().getMaPQ() == 1 || logIn.getAuthority().getMaPQ() == 2 || logIn.getAuthority().getMaPQ() == 3)
                {
                    mv = new ModelAndView("unit");
                    mv.addObject("unitLists", unitRepo.findAll());
                    mv.addObject("authorityObject", logIn);
                }
            }
        }
        return mv;
    }

    @RequestMapping(value = "role={maPQ}/nv={maNV}/unit&save", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doSave(@RequestParam("tenDV") String tenDV) {
        ModelAndView mv = new ModelAndView("redirect:/unit");
        Unit obj = new Unit();
        obj.setTenDV(tenDV);
        unitRepo.save(obj);
        return mv;
    }

    @RequestMapping(value = "role={maPQ}/nv={maNV}/unit&edit", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
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

    @RequestMapping(value = "role={maPQ}/nv={maNV}/viewUnit/{maDV}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doEdit(@PathVariable("maPQ") int maPQ, @PathVariable("maNV") int maNV, @PathVariable("maDV") int maDV) {
        ModelAndView mv = null;
        if (maPQ != 0 && maNV != 0)
        {
            Optional<LogIn> logInOptional = logInRepository.findByUserByID(maNV, maPQ);
            if (logInOptional.isPresent())
            {
                logIn = logInOptional.get();
                if (logIn.getAuthority().getMaPQ() == 1 || logIn.getAuthority().getMaPQ() == 2 || logIn.getAuthority().getMaPQ() == 3)
                {
                    mv = new ModelAndView("viewUnit");
                    Optional<Unit> objOpt  = this.unitRepo.findById(maDV);
                    Unit obj = null;
                    if(objOpt.isPresent()){
                        obj = objOpt.get();
                    }
                    if(obj == null){
                        // Tu tao them class Exception cho Controller
                    }
                    mv.addObject("unitEditList", obj);
                }
            }
        }
        return mv;
    }

    @RequestMapping(value = "role={maPQ}/nv={maNV}/unit/delete/{maDV}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doDelete(@PathVariable("maDV") int maDV) {
        ModelAndView mv = new ModelAndView("unit");
        unitRepo.deleteById(maDV);
        mv.addObject("unitLists", unitRepo.findAll());
        mv.addObject("authorityObject", logIn);
        return mv;
    }
}
