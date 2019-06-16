package com.smilegroup.componentmanagement.Controllers;

import com.smilegroup.componentmanagement.DAO.*;
import com.smilegroup.componentmanagement.Models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.EntityManager;
import java.util.Date;
import java.util.Optional;

@Controller
public class ProductReportController {

    @Autowired
    ProductReportRepository productReportRepository;

    @Autowired
    ProductReportInfoRepository productReportInfoRepository;

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired
    LogInRepository logInRepository;

    LogIn logIn = new LogIn();

    @RequestMapping(value = "role={maPQ}/nv={maNV}/productReport", produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doProductReport(@PathVariable("maPQ") int maPQ, @PathVariable("maNV") int maNV) {
        ModelAndView mv = null;
        if (maPQ != 0 && maNV != 0)
        {
            Optional<LogIn> logInOptional = logInRepository.findByUserByID(maNV, maPQ);
            if (logInOptional.isPresent())
            {
                logIn = logInOptional.get();
                if (logIn.getAuthority().getMaPQ() == 1 || logIn.getAuthority().getMaPQ() == 2 || logIn.getAuthority().getMaPQ() == 3)
                {
                    mv = new ModelAndView("productreport");
                    mv.addObject("employeeLists", employeeRepository.findAll());
                    mv.addObject("productReportLists", productReportRepository.findAll());
                    mv.addObject("authorityObject", logIn);
                }
            }
        }
        return mv;
    }

    @RequestMapping(value = "/productReport&save", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doSave(int thang, String tenNV, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date ngayLap) {
        ModelAndView mv = new ModelAndView("redirect:/productReport");
        ProductReport obj = new ProductReport();
        Employee employeeObj = new Employee();

        if (tenNV != "")
        {
            Optional<Employee> employeeObjOpt = employeeRepository.findByName(tenNV);
            if (employeeObjOpt.isPresent()) employeeObj = employeeObjOpt.get();
        }

        obj.setTongNhap(Long.parseLong("0"));
        obj.setTongTon(Long.parseLong("0"));
        obj.setTongBan(Long.parseLong("0"));
        obj.setEmployee(employeeObj);
        obj.setNgayLap(ngayLap);
        obj.setThang(thang);
        productReportRepository.save(obj);
        return mv;
    }

    @RequestMapping(value = "/productReport/delete/{maBCHT}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doDelete(@PathVariable("maBCHT") int maBCHT) {
        ModelAndView mv = new ModelAndView("redirect:/productReport");
        productReportInfoRepository.deleteAll();
        productReportRepository.deleteById(maBCHT);
        return mv;
    }
}
