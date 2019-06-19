package com.smilegroup.componentmanagement.Controllers;

import com.smilegroup.componentmanagement.DAO.*;
import com.smilegroup.componentmanagement.Models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.EntityManager;
import java.io.Console;
import java.util.Date;
import java.util.Optional;

import static java.lang.Math.abs;

@Controller
public class BillInfoController {

    @Autowired
    BillInfoRepository billInfoRepository;

    @Autowired
    ImportProductInfoRepository importProductInfoRepository;

    @Autowired
    BillRepository billRepository;

    @Autowired
    ProductRepository productRepository;

    @RequestMapping(value = "/bill/details/{maHD}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doBillInfo(@PathVariable("maHD") int maHD) {
        ModelAndView mv = new ModelAndView("billinfo");
        mv.addObject("productLists", productRepository.findAll());
        mv.addObject("ipLists", importProductInfoRepository.findAll());
        mv.addObject("billInfoList", this.billInfoRepository.findByBillID(maHD));
        return mv;
    }

    @RequestMapping(value = "/bill-info&save/{maHD}", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doSave(@RequestParam("donGia") Long donGia, Long soLuong, int maHD, @RequestParam("tenMH") String tenMH) {
        ModelAndView mv = new ModelAndView("redirect:/bill/details/{maHD}");
        BillInfo obj = new BillInfo();
        Bill bill = new Bill();
        Product product = new Product();
        Long tienThanhToan = null;

        if (tenMH != "")
        {
            Optional<Product> productOptional = productRepository.findByName(tenMH);
            if (productOptional.isPresent()) product = productOptional.get();
        }

        if (maHD != 0)
        {
            Optional<Bill> billOptional = billRepository.findById(maHD);
            if (billOptional.isPresent()) bill = billOptional.get();
        }

        if (soLuong != 0 && donGia != 0)
            tienThanhToan = soLuong * donGia;

        if (tenMH != "")
        {
            Optional<Product> productOptional = productRepository.findByName(tenMH);
            if (productOptional.isPresent()){
                product.setMaMH(productOptional.get().getMaMH());
                product.setUnit(productOptional.get().getUnit());
                product.setStore(productOptional.get().getStore());
                product.setType(productOptional.get().getType());
                product.setTenMH(productOptional.get().getTenMH());
                product.setHangSX(productOptional.get().getHangSX());
                product.setCauHinh(productOptional.get().getCauHinh());
                product.setSoLuong(abs(productOptional.get().getSoLuong() - soLuong.intValue()));
                productRepository.save(product);
            }
        }

        obj.setProduct(product);
        obj.setDonGia(donGia);
        obj.setSoLuong(soLuong);
        obj.setTienThanhToan(tienThanhToan);
        obj.setBill(bill);
        billInfoRepository.save(obj);

        Long tongTien = billInfoRepository.calculateSumSell(maHD);
        bill.setTongTien(tongTien);
        billRepository.save(bill);
        return mv;
    }

    @RequestMapping(value = "/bill-info&edit/{maHD}", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doUpdate (@RequestParam("maCTHD") int maCTHD, @RequestParam("donGia") Long donGia, Long soLuong, @PathVariable("maHD") int maHD, @RequestParam("tenMH") String tenMH, Long tienThanhToan) {
        ModelAndView mv = new ModelAndView("redirect:/bill/details/{maHD}");
        try {
            BillInfo obj = null;
            Bill bill = new Bill();
            Product product = new Product();

            if (maCTHD != 0)
            {
                Optional<BillInfo> billInfo = billInfoRepository.findById(maCTHD);
                if (billInfo.isPresent()) obj = billInfo.get();
            }

            if (tenMH != "")
            {
                Optional<Product> productOptional = productRepository.findByName(tenMH);
                if (productOptional.isPresent()) product = productOptional.get();
            }

            if (maHD != 0)
            {
                Optional<Bill> billOptional = billRepository.findById(maHD);
                if (billOptional.isPresent()) bill = billOptional.get();
            }
            obj.setProduct(product);
            obj.setDonGia(donGia);
            obj.setSoLuong(soLuong);
            obj.setTienThanhToan(tienThanhToan);
            obj.setBill(bill);
            billInfoRepository.save(obj);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return mv;
    }

    @RequestMapping(value = "/viewBillInfo/{maCTHD}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doEdit(@PathVariable("maCTHD") int maCTHD) {
        ModelAndView mv = new ModelAndView("viewBillInfo");
        mv.addObject("productLists", productRepository.findAll());
        Optional<BillInfo> objOpt  = this.billInfoRepository.findById(maCTHD);
        BillInfo obj = null;
        if(objOpt.isPresent()){
            obj = objOpt.get();
        }
        if(obj == null){
            // Tu tao them class Exception cho Controller
        }
        mv.addObject("billInfoList", obj);
        return mv;
    }

    @RequestMapping(value = "/bill/details/{maHD}/delete/{maCTHD}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doDelete(@PathVariable("maCTHD") int maCTHD) {
        ModelAndView mv = new ModelAndView("redirect:/bill/details/{maHD}");
        billInfoRepository.deleteById(maCTHD);
        return mv;
    }
}