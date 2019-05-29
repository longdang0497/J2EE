package com.smilegroup.componentmanagement.Controllers;

import com.smilegroup.componentmanagement.DAO.*;
import com.smilegroup.componentmanagement.Models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.EntityManager;
import java.util.Optional;

@Controller
public class ProductController {

    @Autowired
    ProductRepository productRepository;

    @Autowired
    StoreRepository storeRepository;

    @Autowired
    TypeOfComponentRepository tocRepository;

    @Autowired
    UnitRepository unitRepository;

    @RequestMapping("/product")
    public ModelAndView doProduct() {
        ModelAndView mv = new ModelAndView("product");
        mv.addObject("storeLists", storeRepository.findAll());
        mv.addObject("tocLists", tocRepository.findAll());
        mv.addObject("unitLists", unitRepository.findAll());
        mv.addObject("productLists", productRepository.findAll());
        return mv;
    }

    @RequestMapping(value = "/product&save", method = RequestMethod.POST)
    public ModelAndView doSave(@RequestParam("tenMH") String tenMH, String cauHinh, String hangSX,
                               int soLuong, String tenLoai, String tenDV, String tenKhu) {
        ModelAndView mv = new ModelAndView("redirect:/product");
        Product obj = new Product();
        Unit unitObj = new Unit();
        Store storeObj = new Store();
        TypeOfComponent tocObj = new TypeOfComponent();

        if (tenKhu != "")
        {
            Optional<Store> storeObjOpt = storeRepository.findByName(tenKhu);
            if (storeObjOpt.isPresent()) storeObj = storeObjOpt.get();
        }

        if (tenDV != "")
        {
            Optional<Unit> unitObjOpt = unitRepository.findByName(tenDV);
            if (unitObjOpt.isPresent()) unitObj = unitObjOpt.get();
        }

        if (tenLoai != "")
        {
            Optional<TypeOfComponent> tocObjOpt = tocRepository.findByName(tenLoai);
            if (tocObjOpt.isPresent()) tocObj = tocObjOpt.get();
        }

        obj.setTenMH(tenMH);
        obj.setCauHinh(cauHinh);
        obj.setType(tocObj);
        obj.setHangSX(hangSX);
        obj.setSoLuong(soLuong);
        obj.setStore(storeObj);
        obj.setUnit(unitObj);
        productRepository.save(obj);
        return mv;
    }

    @RequestMapping(value = "/product&edit", method = RequestMethod.POST)
    public ModelAndView doUpdate(@RequestParam("maMH") int maMH, @RequestParam("tenMH") String tenMH, String cauHinh, String hangSX,
                                 int soLuong, String tenLoai, String tenDV, String tenKhu) {
        ModelAndView mv = new ModelAndView("redirect:/product");
        Product obj = null;
        Unit unitObj = new Unit();
        Store storeObj = new Store();
        TypeOfComponent tocObj = new TypeOfComponent();

        if (maMH != 0)
        {
            Optional<Product> objOpt = productRepository.findById(maMH);
            if (objOpt.isPresent()) obj = objOpt.get();
        }

        if (tenKhu != "")
        {
            Optional<Store> storeObjOpt = storeRepository.findByName(tenKhu);
            if (storeObjOpt.isPresent()) storeObj = storeObjOpt.get();
        }

        if (tenDV != "")
        {
            Optional<Unit> unitObjOpt = unitRepository.findByName(tenDV);
            if (unitObjOpt.isPresent()) unitObj = unitObjOpt.get();
        }

        if (tenLoai != "")
        {
            Optional<TypeOfComponent> tocObjOpt = tocRepository.findByName(tenLoai);
            if (tocObjOpt.isPresent()) tocObj = tocObjOpt.get();
        }

        obj.setTenMH(tenMH);
        obj.setCauHinh(cauHinh);
        obj.setType(tocObj);
        obj.setHangSX(hangSX);
        obj.setSoLuong(soLuong);
        obj.setStore(storeObj);
        obj.setUnit(unitObj);
        productRepository.save(obj);

        return mv;
    }

    @RequestMapping(value = "/viewProduct/{maMH}", method = RequestMethod.GET)
    public ModelAndView doEdit(@PathVariable("maMH") int maMH) {
        ModelAndView mv = new ModelAndView("viewProduct");
        mv.addObject("storeLists", storeRepository.findAll());
        mv.addObject("tocLists", tocRepository.findAll());
        mv.addObject("unitLists", unitRepository.findAll());
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

    @RequestMapping(value = "/product/delete/{maMH}", method = RequestMethod.GET)
    public ModelAndView doDelete(@PathVariable("maMH") int maMH) {
        ModelAndView mv = new ModelAndView("redirect:/product");
        productRepository.deleteById(maMH);
        return mv;
    }
}
