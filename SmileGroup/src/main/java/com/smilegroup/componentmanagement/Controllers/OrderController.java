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
public class OrderController {

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    ProviderRepository providerRepository;

    @Autowired
    EmployeeRepository employeeRepository;

    @RequestMapping(value = "/order", produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doOrder() {
        ModelAndView mv = new ModelAndView("order");
        mv.addObject("employeeLists", employeeRepository.findAll());
        mv.addObject("providerLists", providerRepository.findAll());
        mv.addObject("orderLists", orderRepository.findAll());
        return mv;
    }

    @RequestMapping(value = "/order&save", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doSave(String tenNCC, String tenNV, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date ngayLap) {
        ModelAndView mv = new ModelAndView("redirect:/order");
        Order obj = new Order();
        Provider providerObj = new Provider();
        Employee employeeObj = new Employee();

        if (tenNV != "")
        {
            Optional<Employee> employeeObjOpt = employeeRepository.findByName(tenNV);
            if (employeeObjOpt.isPresent()) employeeObj = employeeObjOpt.get();
        }

        if (tenNCC != "")
        {
            Optional<Provider> providerObjOpt = providerRepository.findByName(tenNCC);
            if (providerObjOpt.isPresent()) providerObj = providerObjOpt.get();
        }

        obj.setEmployee(employeeObj);
        obj.setProvider(providerObj);
        obj.setNgayLap(ngayLap);
        orderRepository.save(obj);
        return mv;
    }

    @RequestMapping(value = "/order&edit", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doUpdate(@RequestParam("maDDH") int maDDH, String tenNCC, String tenNV, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date ngayLap) {
        ModelAndView mv = new ModelAndView("redirect:/order");
        Order obj = new Order();
        Provider providerObj = new Provider();
        Employee employeeObj = new Employee();

        if (tenNV != "")
        {
            Optional<Employee> employeeObjOpt = employeeRepository.findByName(tenNV);
            if (employeeObjOpt.isPresent()) employeeObj = employeeObjOpt.get();
        }

        if (tenNCC != "")
        {
            Optional<Provider> providerObjOpt = providerRepository.findByName(tenNCC);
            if (providerObjOpt.isPresent()) providerObj = providerObjOpt.get();
        }

        if (maDDH != 0)
        {
            Optional<Order> objOpt = orderRepository.findById(maDDH);
            if (objOpt.isPresent()) obj = objOpt.get();
        }

        obj.setEmployee(employeeObj);
        obj.setProvider(providerObj);
        obj.setNgayLap(ngayLap);
        orderRepository.save(obj);
        return mv;
    }

    @RequestMapping(value = "/viewOrder/{maDDH}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doEdit(@PathVariable("maDDH") int maDDH) {
        ModelAndView mv = new ModelAndView("viewOrder");
        mv.addObject("empLists", employeeRepository.findAll());
        mv.addObject("providerLists", providerRepository.findAll());
        Optional<Order> objOpt  = this.orderRepository.findById(maDDH);
        Order obj = null;
        if(objOpt.isPresent()){
            obj = objOpt.get();
        }
        if(obj == null){
            // Tu tao them class Exception cho Controller
        }
        mv.addObject("orderEditList", obj);
        return mv;
    }

    @RequestMapping(value = "/order/delete/{maDDH}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doDelete(@PathVariable("maDDH") int maDDH) {
        ModelAndView mv = new ModelAndView("redirect:/order");
        orderRepository.deleteById(maDDH);
        return mv;
    }
}
