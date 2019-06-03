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
public class ProductReportInfoController {

    @Autowired
    ProductReportInfoRepository productReportInfoRepository;

    @Autowired
    ProductRepository productRepository;

    @RequestMapping(value = "/productReportInfo/details/{maBCHT}", produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doProductReportInfo(@PathVariable("maBCHT") int maBCHT) {
        ModelAndView mv = new ModelAndView("productreportinfo");
        mv.addObject("productLists", productRepository.findAll());
        mv.addObject("productReportInfoLists", productReportInfoRepository.findAll());
        return mv;
    }

//    @RequestMapping(value = "/productReport&save", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
//    public ModelAndView doSave(String tenKH, String tenNV, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date ngayLap, Long tongTien, String maSoThue) {
//        ModelAndView mv = new ModelAndView("redirect:/productReport");
//        ProductReportInfo obj = new ProductReportInfo();
//        Customer customerObj = new Customer();
//        Product productObj = new Product();
//
//        if (tenNV != "")
//        {
//            Optional<Product> productObjOpt = productRepository.findByName(tenNV);
//            if (productObjOpt.isPresent()) productObj = productObjOpt.get();
//        }
//
//        if (tenKH != "")
//        {
//            Optional<Customer> customerObjOpt = customerRepository.findByName(tenKH);
//            if (customerObjOpt.isPresent()) customerObj = customerObjOpt.get();
//        }
//
//        obj.setProduct(productObj);
//        obj.setCustomer(customerObj);
//        obj.setMaSoThue(maSoThue);
//        obj.setTongTien(tongTien);
//        obj.setNgayLap(ngayLap);
//        productReportRepository.save(obj);
//        return mv;
//    }
//
//    @RequestMapping(value = "/productReport&edit", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
//    public ModelAndView doUpdate(@RequestParam("maHD") int maHD, String tenKH, String tenNV, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date ngayLap, Long tongTien, String maSoThue) {
//        ModelAndView mv = new ModelAndView("redirect:/productReport");
//        ProductReportInfo obj = new ProductReportInfo();
//        Customer customerObj = new Customer();
//        Product productObj = new Product();
//
//        if (tenNV != "")
//        {
//            Optional<Product> productObjOpt = productRepository.findByName(tenNV);
//            if (productObjOpt.isPresent()) productObj = productObjOpt.get();
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
//            Optional<ProductReportInfo> objOpt = productReportRepository.findById(maHD);
//            if (objOpt.isPresent()) obj = objOpt.get();
//        }
//
//        obj.setProduct(productObj);
//        obj.setCustomer(customerObj);
//        obj.setMaSoThue(maSoThue);
//        obj.setTongTien(tongTien);
//        obj.setNgayLap(ngayLap);
//        productReportRepository.save(obj);
//        return mv;
//    }
//
//    @RequestMapping(value = "/viewProductReportInfo/{maHD}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
//    public ModelAndView doEdit(@PathVariable("maHD") int maHD) {
//        ModelAndView mv = new ModelAndView("viewProductReportInfo");
//        mv.addObject("empLists", productRepository.findAll());
//        mv.addObject("customerLists", customerRepository.findAll());
//        Optional<ProductReportInfo> objOpt  = this.productReportRepository.findById(maHD);
//        ProductReportInfo obj = null;
//        if(objOpt.isPresent()){
//            obj = objOpt.get();
//        }
//        if(obj == null){
//            // Tu tao them class Exception cho Controller
//        }
//        mv.addObject("productReportEditList", obj);
//        return mv;
//    }

    @RequestMapping(value = "/productReport/details/{maBCHT}/delete/{maCTBC}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doDelete(@PathVariable("maCTBC") int maCTBC) {
        ModelAndView mv = new ModelAndView("redirect:/productReport/details/{maBCHT}");
        productReportInfoRepository.deleteById(maCTBC);
        return mv;
    }
}
