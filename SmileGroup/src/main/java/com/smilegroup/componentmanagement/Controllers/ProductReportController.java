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
    EmployeeRepository employeeRepository;

    @RequestMapping(value = "/productReport", produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doProductReport() {
        ModelAndView mv = new ModelAndView("productreport");
        mv.addObject("employeeLists", employeeRepository.findAll());
        mv.addObject("productReportLists", productReportRepository.findAll());
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

        Optional<ProductReport> productReportOptional= productReportRepository.createReport(thang);
        if (productReportOptional.isPresent())
        {
            Long tongBan = productReportOptional.get().getTongBan();
            Long tongNhap = productReportOptional.get().getTongNhap();
            Long tongTon = productReportOptional.get().getTongTon();
            if (tongBan != 0)
                obj.setTongBan(tongBan);
            else
                obj.setTongBan(Long.parseLong("0"));

            if (tongNhap != 0)
                obj.setTongNhap(tongNhap);
            else
                obj.setTongNhap(Long.parseLong("0"));

            if (tongTon != 0)
                obj.setTongTon(tongTon);
            else
                obj.setTongTon(Long.parseLong("0"));
        }

        obj.setEmployee(employeeObj);
        obj.setNgayLap(ngayLap);
        obj.setThang(thang);
        productReportRepository.save(obj);
        return mv;
    }

//    @RequestMapping(value = "/productReport&edit", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
//    public ModelAndView doUpdate(@RequestParam("maHD") int maHD, String tenKH, String tenNV, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date ngayLap, Long tongTien, String maSoThue) {
//        ModelAndView mv = new ModelAndView("redirect:/productReport");
//        ProductReport obj = new ProductReport();
//        Customer customerObj = new Customer();
//        Employee employeeObj = new Employee();
//
//        if (tenNV != "")
//        {
//            Optional<Employee> employeeObjOpt = employeeRepository.findByName(tenNV);
//            if (employeeObjOpt.isPresent()) employeeObj = employeeObjOpt.get();
//        }
//
//        if (tenKH != "")
//        {
//            Optional<Customer> customerObjOpt = customerRepository.findByName(tenKH);
//            if (customerObjOpt.isPresent()) customerObj = customerObjOpt.get();
//        }
//
//        if (maHD != 0)
//        {
//            Optional<ProductReport> objOpt = productReportRepository.findById(maHD);
//            if (objOpt.isPresent()) obj = objOpt.get();
//        }
//
//        obj.setEmployee(employeeObj);
//        obj.setCustomer(customerObj);
//        obj.setMaSoThue(maSoThue);
//        obj.setTongTien(tongTien);
//        obj.setNgayLap(ngayLap);
//        productReportRepository.save(obj);
//        return mv;
//    }

    @RequestMapping(value = "/viewProductReport/{maBCHT}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doEdit(@PathVariable("maBCHT") int maBCHT) {
        ModelAndView mv = new ModelAndView("viewProductReport");
        mv.addObject("empLists", employeeRepository.findAll());
        Optional<ProductReport> objOpt  = this.productReportRepository.findById(maBCHT);
        ProductReport obj = null;
        if(objOpt.isPresent()){
            obj = objOpt.get();
        }
        if(obj == null){
            // Tu tao them class Exception cho Controller
        }
        mv.addObject("productReportEditList", obj);
        return mv;
    }

    @RequestMapping(value = "/productReport/delete/{maBCHT}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doDelete(@PathVariable("maBCHT") int maBCHT) {
        ModelAndView mv = new ModelAndView("redirect:/productReport");
        productReportRepository.deleteById(maBCHT);
        return mv;
    }
}
