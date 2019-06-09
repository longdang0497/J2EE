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

@Controller
public class ImportProductInfoController {

    @Autowired
    ImportProductInfoRepository importProductInfoRepository;

    @Autowired
    ImportProductRepository importProductRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    OrderInfoRepository orderInfoRepository;

    @RequestMapping(value = "/importProduct/details/{maPN}", produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doImportProductInfo(@PathVariable("maPN") int maPN) throws NullPointerException {
        ModelAndView mv = new ModelAndView("importproductinfo");
        int maDDH = importProductRepository.findOrderID(maPN);
        mv.addObject("productLists", orderInfoRepository.findByOrderID(maDDH));
        mv.addObject("importProductInfoList", importProductInfoRepository.findByImportProductID(maPN));
        return mv;
    }

    @RequestMapping(value = "/importProduct-info&save/{maPN}", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doSave(Long donGiaBan, Long donGia, Long soLuong, int maPN, @RequestParam("tenMH") String tenMH, String ghiChu) throws NullPointerException {
        ModelAndView mv = new ModelAndView("redirect:/importProduct/details/{maPN}");
        ImportProductInfo obj = new ImportProductInfo();
        ImportProduct importProduct = new ImportProduct();
        Product product = new Product();
        Long tongTien = null;

        if (maPN != 0)
        {
            Optional<ImportProduct> importProductOptional = importProductRepository.findById(maPN);
            if (importProductOptional.isPresent()) importProduct = importProductOptional.get();
        }

        if (donGia != 0 && soLuong != 0)
            tongTien = donGia * soLuong;

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
                product.setSoLuong(productOptional.get().getSoLuong() + soLuong.intValue());
                productRepository.save(product);
            }
        }

        obj.setProduct(product);
        obj.setDonGia(donGia);
        obj.setDonGiaBan(donGiaBan);
        obj.setSoLuong(soLuong);
        obj.setTongTien(tongTien);
        obj.setImportProduct(importProduct);
        obj.setGhiChu(ghiChu);
        importProductInfoRepository.save(obj);

        Long tongTienPN = importProductInfoRepository.calculateSumImport(maPN);
        importProduct.setTongTienPN(tongTienPN);
        importProductRepository.save(importProduct);

        return mv;
    }

    @RequestMapping(value = "/importProduct-info&edit/{maPN}", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doUpdate (@RequestParam("maCTPN") int maCTPN, @PathVariable("maPN") int maPN, Long donGia, Long donGiaBan, Long soLuong,  @RequestParam("tenMH") String tenMH, Long tongTien, String ghiChu) {
        ModelAndView mv = new ModelAndView("redirect:/importProduct/details/{maPN}");
        try {
            ImportProductInfo obj = null;
            ImportProduct importProduct = new ImportProduct();
            Product product = new Product();

            if (maCTPN != 0)
            {
                Optional<ImportProductInfo> importProductInfo = importProductInfoRepository.findById(maCTPN);
                if (importProductInfo.isPresent()) obj = importProductInfo.get();
            }

            if (tenMH != "")
            {
                Optional<Product> productOptional = productRepository.findByName(tenMH);
                if (productOptional.isPresent()) product = productOptional.get();
            }

            if (maPN != 0)
            {
                Optional<ImportProduct> importProductOptional = importProductRepository.findById(maPN);
                if (importProductOptional.isPresent()) importProduct = importProductOptional.get();
            }
            obj.setProduct(product);
            obj.setDonGia(donGia);
            obj.setDonGiaBan(donGiaBan);
            obj.setSoLuong(soLuong);
            obj.setTongTien(tongTien);
            obj.setImportProduct(importProduct);
            obj.setGhiChu(ghiChu);
            importProductInfoRepository.save(obj);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return mv;
    }

    @RequestMapping(value = "/viewImportProductInfo/{maCTPN}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doEdit(@PathVariable("maCTPN") int maCTPN) {
        ModelAndView mv = new ModelAndView("viewImportProductInfo");
        mv.addObject("productLists", productRepository.findAll());
        Optional<ImportProductInfo> objOpt  = this.importProductInfoRepository.findById(maCTPN);
        ImportProductInfo obj = null;
        if(objOpt.isPresent()){
            obj = objOpt.get();
        }
        if(obj == null){
            // Tu tao them class Exception cho Controller
        }
        mv.addObject("importProductInfoList", obj);
        return mv;
    }

    @RequestMapping(value = "/importProduct/details/{maPN}/delete/{maCTPN}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doDelete(@PathVariable("maCTPN") int maCTPN) {
        ModelAndView mv = new ModelAndView("redirect:/importProduct/details/{maPN}");
        importProductInfoRepository.deleteById(maCTPN);
        return mv;
    }
}
