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
import java.util.ArrayList;
import java.util.Date;
import java.util.Optional;

@Controller
public class ImportProductController {

    @Autowired
    ImportProductRepository importProductRepository;

    @Autowired
    ImportProductInfoRepository importProductInfoRepository;

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    EmployeeRepository employeeRepository;

    @RequestMapping(value = "/importProduct", produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doImportProduct() {
        ModelAndView mv = new ModelAndView("importproduct");
        mv.addObject("employeeLists", employeeRepository.findAll());
        mv.addObject("orderLists", orderRepository.findAll());
        mv.addObject("importProductLists", importProductRepository.findAll());
        return mv;
    }

    @RequestMapping(value = "/importProduct&save", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doSave(int maDDH, String tenNV, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date ngayLapPhieu) {
        ModelAndView mv = new ModelAndView("redirect:/importProduct");
        ImportProduct obj = new ImportProduct();
        Order orderObj = new Order();
        Employee employeeObj = new Employee();

        if (tenNV != "")
        {
            Optional<Employee> employeeObjOpt = employeeRepository.findByName(tenNV);
            if (employeeObjOpt.isPresent()) employeeObj = employeeObjOpt.get();
        }

        if (maDDH != 0)
        {
            Optional<Order> orderObjOpt = orderRepository.findById(maDDH);
            if (orderObjOpt.isPresent()) orderObj = orderObjOpt.get();
        }

        obj.setEmployee(employeeObj);
        obj.setOrder(orderObj);
        obj.setTongTienPN(Long.parseLong("0"));
        obj.setNgayLapPhieu(ngayLapPhieu);
        importProductRepository.save(obj);
        return mv;
    }

    @RequestMapping(value = "/importProduct&edit", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doUpdate(@RequestParam("maPN") int maPN, int maDDH, String tenNV, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date ngayLapPhieu, Long tongTienPN) {
        ModelAndView mv = new ModelAndView("redirect:/importProduct");
        ImportProduct obj = new ImportProduct();
        Order orderObj = new Order();
        Employee employeeObj = new Employee();

        if (tenNV != "")
        {
            Optional<Employee> employeeObjOpt = employeeRepository.findByName(tenNV);
            if (employeeObjOpt.isPresent()) employeeObj = employeeObjOpt.get();
        }

        if (maDDH != 0)
        {
            Optional<Order> orderObjOpt = orderRepository.findById(maDDH);
            if (orderObjOpt.isPresent()) orderObj = orderObjOpt.get();
        }

        if (maPN != 0)
        {
            Optional<ImportProduct> objOpt = importProductRepository.findById(maPN);
            if (objOpt.isPresent()) obj = objOpt.get();
        }

        obj.setEmployee(employeeObj);
        obj.setOrder(orderObj);
        obj.setTongTienPN(tongTienPN);
        obj.setNgayLapPhieu(ngayLapPhieu);
        importProductRepository.save(obj);
        return mv;
    }

    @RequestMapping(value = "/viewImportProduct/{maPN}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doEdit(@PathVariable("maPN") int maPN) {
        ModelAndView mv = new ModelAndView("viewImportProduct");
        mv.addObject("empLists", employeeRepository.findAll());
        mv.addObject("orderLists", orderRepository.findAll());
        Optional<ImportProduct> objOpt  = this.importProductRepository.findById(maPN);
        ImportProduct obj = null;
        if(objOpt.isPresent()){
            obj = objOpt.get();
        }
        if(obj == null){
            // Tu tao them class Exception cho Controller
        }
        mv.addObject("importProductEditList", obj);
        return mv;
    }

    @RequestMapping(value = "/importProduct/delete/{maPN}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doDelete(@PathVariable("maPN") int maPN) {
        ModelAndView mv = new ModelAndView("redirect:/importProduct");
        Iterable<ImportProductInfo> arrDelete = importProductInfoRepository.findByImportProductID(maPN);
        for (ImportProductInfo obj : arrDelete)
            importProductInfoRepository.deleteById(obj.getMaCTPN());
        importProductRepository.deleteById(maPN);
        return mv;
    }
}
