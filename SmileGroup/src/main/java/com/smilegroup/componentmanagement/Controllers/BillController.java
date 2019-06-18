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
public class BillController {

    @Autowired
    BillRepository billRepository;

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired
    LogInRepository logInRepository;

    LogIn logIn = new LogIn();

    @RequestMapping(value = "/bill", produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doBill() {
        ModelAndView mv = new ModelAndView("bill");
        mv.addObject("employeeLists", employeeRepository.findAll());
        mv.addObject("customerLists", customerRepository.findAll());
        mv.addObject("billLists", billRepository.findAll());
        return mv;
    }

    @RequestMapping(value = "/bill&save", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doSave(String tenKH, String tenNV, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date ngayLap, Long tongTien, String maSoThue) {
        ModelAndView mv = new ModelAndView("redirect:/bill");
        Bill obj = new Bill();
        Customer customerObj = new Customer();
        Employee employeeObj = new Employee();

        if (tenNV != "")
        {
            Optional<Employee> employeeObjOpt = employeeRepository.findByName(tenNV);
            if (employeeObjOpt.isPresent()) employeeObj = employeeObjOpt.get();
        }

        if (tenKH != "")
        {
            Optional<Customer> customerObjOpt = customerRepository.findByName(tenKH);
            if (customerObjOpt.isPresent()) customerObj = customerObjOpt.get();
        }

        obj.setEmployee(employeeObj);
        obj.setCustomer(customerObj);
        obj.setMaSoThue(maSoThue);
        obj.setTongTien(tongTien);
        obj.setNgayLap(ngayLap);
        billRepository.save(obj);
        return mv;
    }

    @RequestMapping(value = "/bill&edit", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doUpdate(@RequestParam("maHD") int maHD, String tenKH, String tenNV, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date ngayLap, Long tongTien, String maSoThue) {
        ModelAndView mv = new ModelAndView("redirect:/bill");
        Bill obj = new Bill();
        Customer customerObj = new Customer();
        Employee employeeObj = new Employee();

        if (tenNV != "")
        {
            Optional<Employee> employeeObjOpt = employeeRepository.findByName(tenNV);
            if (employeeObjOpt.isPresent()) employeeObj = employeeObjOpt.get();
        }

        if (tenKH != "")
        {
            Optional<Customer> customerObjOpt = customerRepository.findByName(tenKH);
            if (customerObjOpt.isPresent()) customerObj = customerObjOpt.get();
        }

        if (maHD != 0)
        {
            Optional<Bill> objOpt = billRepository.findById(maHD);
            if (objOpt.isPresent()) obj = objOpt.get();
        }

        obj.setEmployee(employeeObj);
        obj.setCustomer(customerObj);
        obj.setMaSoThue(maSoThue);
        obj.setTongTien(tongTien);
        obj.setNgayLap(ngayLap);
        billRepository.save(obj);
        return mv;
    }

    @RequestMapping(value = "/viewBill/{maHD}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doEdit(@PathVariable("maHD") int maHD) {
        ModelAndView mv = new ModelAndView("viewBill");
        mv.addObject("empLists", employeeRepository.findAll());
        mv.addObject("customerLists", customerRepository.findAll());
        Optional<Bill> objOpt  = this.billRepository.findById(maHD);
        Bill obj = null;
        if(objOpt.isPresent()){
            obj = objOpt.get();
        }
        if(obj == null){
            // Tu tao them class Exception cho Controller
        }
        mv.addObject("billEditList", obj);
        return mv;
    }

    @RequestMapping(value = "/bill/delete/{maHD}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doDelete(@PathVariable("maHD") int maHD) {
        ModelAndView mv = new ModelAndView("redirect:/bill");
        billRepository.deleteById(maHD);
        return mv;
    }
}
