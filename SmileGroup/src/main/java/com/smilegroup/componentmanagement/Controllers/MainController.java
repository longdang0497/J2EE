package com.smilegroup.componentmanagement.Controllers;

import com.smilegroup.componentmanagement.Models.Customer;
import com.smilegroup.componentmanagement.DAO.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
public class MainController {

    @Autowired
    CustomerRepository customerRepo;

    @RequestMapping("/")
    public ModelAndView doHome() {
        ModelAndView mv = new ModelAndView("index");
        return mv;
    }

    @RequestMapping("/customer")
    public ModelAndView doCustomer() {
        ModelAndView mv = new ModelAndView("customer");
        mv.addObject("customerLists", customerRepo.findAll());
        return mv;
    }

    @RequestMapping(value = "/customer&save", method = RequestMethod.POST)
    public ModelAndView doSave(@RequestParam("tenKH") String tenKH, String diaChi, String email,
                               @RequestParam("soDT") String soDT) {
        ModelAndView mv = new ModelAndView("redirect:/customer");
        Customer customer = new Customer();
        customer.setTenKH(tenKH);
        customer.setDiaChi(diaChi);
        customer.setEmail(email);
        customer.setSoDT(soDT);
        customerRepo.save(customer);
        return mv;
    }

    @RequestMapping(value = "/customer&edit", method = RequestMethod.POST)
    public ModelAndView doUpdate(@RequestParam("maKH") int maKH, @RequestParam("tenKH") String tenKH, String diaChi, String email,
                                 @RequestParam("soDT") String soDT) {
        ModelAndView mv = new ModelAndView("redirect:/customer");
        Customer customer = null;
        if (maKH != 0)
        {
            Optional<Customer> cusOpt = customerRepo.findById(maKH);
            if (cusOpt.isPresent()) customer = cusOpt.get();
        }
        customer.setTenKH(tenKH);
        customer.setDiaChi(diaChi);
        customer.setEmail(email);
        customer.setSoDT(soDT);
        customerRepo.save(customer);

        return mv;
    }

    @RequestMapping(value = "/viewCustomer/{maKH}", method = RequestMethod.GET)
    public ModelAndView doEdit(@PathVariable("maKH") int maKH) {
        ModelAndView mv = new ModelAndView("viewCustomer");
        Optional<Customer> cusOpt  = this.customerRepo.findById(maKH);
        Customer cus = null;
        if(cusOpt.isPresent()){
            cus = cusOpt.get();
        }
        if(cus == null){
            // Tu tao them class Exception cho Controller
        }
        mv.addObject("customerEditList", cus);
        return mv;
    }

    @RequestMapping(value = "/customer/delete/{maKH}", method = RequestMethod.GET)
    public ModelAndView doDelete(@PathVariable("maKH") int maKH) {
        ModelAndView mv = new ModelAndView("redirect:/customer");
        customerRepo.deleteById(maKH);
        return mv;
    }
}
