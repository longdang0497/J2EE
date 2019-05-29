package com.smilegroup.componentmanagement.Controllers;

import com.smilegroup.componentmanagement.DAO.ProductRepository;
import com.smilegroup.componentmanagement.Models.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.EntityManager;
import java.util.Optional;

@Controller
public class ProductController {

    @Autowired
    ProductRepository productRepository;

    @RequestMapping("/product")
    public ModelAndView doProduct() {
        ModelAndView mv = new ModelAndView("product");
        mv.addObject("productLists", productRepository.findAll());
        return mv;
    }

    /*@RequestMapping(value = "/product&save", method = RequestMethod.POST)
    public ModelAndView doSave(@RequestParam("tenKhu") String tenKhu) {
        ModelAndView mv = new ModelAndView("redirect:/product");
        Store obj = new Store();
        obj.setTenKhu(tenKhu);
        productRepo.save(obj);
        return mv;
    }

    @RequestMapping(value = "/product&edit", method = RequestMethod.POST)
    public ModelAndView doUpdate(@RequestParam("maKhu") int maKhu, @RequestParam("tenKhu") String tenKhu) {
        ModelAndView mv = new ModelAndView("redirect:/product");
        Store obj = null;
        if (maKhu != 0)
        {
            Optional<Store> objOpt = productRepo.findById(maKhu);
            if (objOpt.isPresent()) obj = objOpt.get();
        }
        obj.setTenKhu(tenKhu);
        productRepo.save(obj);

        return mv;
    }*/

    @RequestMapping(value = "/viewProduct/{maMH}", method = RequestMethod.GET)
    public ModelAndView doEdit(@PathVariable("maMH") int maMH) {
        ModelAndView mv = new ModelAndView("viewProduct");
        Optional<Product> objOpt  = this.productRepository.findById(maMH);
        Product obj = null;
        if(objOpt.isPresent()){
            obj = objOpt.get();
        }
        if(obj == null){
            // Tu tao them class Exception cho Controller
        }
        mv.addObject("productEditList", obj);
        return mv;
    }

    /*@RequestMapping(value = "/product/delete/{maKhu}", method = RequestMethod.GET)
    public ModelAndView doDelete(@PathVariable("maKhu") int maKhu) {
        ModelAndView mv = new ModelAndView("redirect:/product");
        productRepo.deleteById(maKhu);
        return mv;
    }*/
}
