package com.smilegroup.componentmanagement.Controllers;

import com.smilegroup.componentmanagement.DAO.AuthorityRepository;
import com.smilegroup.componentmanagement.DAO.LogInRepository;
import com.smilegroup.componentmanagement.Models.Authority;
import com.smilegroup.componentmanagement.Models.Customer;
import com.smilegroup.componentmanagement.DAO.CustomerRepository;
import com.smilegroup.componentmanagement.Models.LogIn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
public class CustomerController {

    @Autowired
    CustomerRepository customerRepo;

    @Autowired
    LogInRepository logInRepository;

    LogIn logIn = new LogIn();

    @RequestMapping(value = "role={maPQ}/nv={maNV}/customer", produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doCustomer(@PathVariable("maPQ") int maPQ, @PathVariable("maNV") int maNV) {
        ModelAndView mv = null;
        if (maPQ != 0 && maNV != 0)
        {
            Optional<LogIn> logInOptional = logInRepository.findByUserByID(maNV, maPQ);
            if (logInOptional.isPresent())
            {
                logIn = logInOptional.get();
                if (logIn.getAuthority().getMaPQ() == 1 || logIn.getAuthority().getMaPQ() == 2 || logIn.getAuthority().getMaPQ() == 3)
                {
                    mv = new ModelAndView("customer");
                    mv.addObject("customerLists", customerRepo.findAll());
                    mv.addObject("authorityObject", logIn);
                }
            }
        }
        return mv;
    }

    @RequestMapping(value = "role={maPQ}/nv={maNV}/customer&save", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
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

    @RequestMapping(value = "role={maPQ}/customer&edit", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
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

    @RequestMapping(value = "role={maPQ}/viewCustomer/{maKH}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
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

    @RequestMapping(value = "role={maPQ}/customer/delete/{maKH}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doDelete(@PathVariable("maKH") int maKH) {
        ModelAndView mv = new ModelAndView("redirect:/customer");
        customerRepo.deleteById(maKH);
        return mv;
    }
}
