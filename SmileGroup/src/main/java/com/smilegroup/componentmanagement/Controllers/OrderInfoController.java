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
public class OrderInfoController {

    @Autowired
    OrderInfoRepository orderInfoRepository;

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    ProductRepository productRepository;

    @RequestMapping(value = "/order/details/{maDDH}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doOrderInfo(@PathVariable("maDDH") int maDDH) {
        ModelAndView mv = new ModelAndView("orderinfo");
        mv.addObject("productLists", productRepository.findAll());
        mv.addObject("orderInfoList", this.orderInfoRepository.findByOrderID(maDDH));
        return mv;
    }

    @RequestMapping(value = "/order-info&save/{maDDH}", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doSave(Long soLuong, int maDDH, @RequestParam("tenMH") String tenMH) {
        ModelAndView mv = new ModelAndView("redirect:/order/details/{maDDH}");
        OrderInfo obj = new OrderInfo();
        Order order = new Order();
        Product product = new Product();

        if (tenMH != "")
        {
            Optional<Product> productOptional = productRepository.findByName(tenMH);
            if (productOptional.isPresent()) product = productOptional.get();
        }

        if (maDDH != 0)
        {
            Optional<Order> orderOptional = orderRepository.findById(maDDH);
            if (orderOptional.isPresent()) order = orderOptional.get();
        }
//        if (tienThanhToan != 0)
//        {
//            tienThanhToan = 0;
//            tienThanhToan = donGia * soLuong;
//        }

        obj.setProduct(product);
        obj.setSoLuong(soLuong);
        obj.setOrder(order);
        orderInfoRepository.save(obj);
        return mv;
    }

    @RequestMapping(value = "/order-info&edit/{maDDH}", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doUpdate (@RequestParam("maCTDDH") int maCTDDH, Long soLuong, @PathVariable("maDDH") int maDDH, @RequestParam("tenMH") String tenMH) {
        ModelAndView mv = new ModelAndView("redirect:/order/details/{maDDH}");
        try {
            OrderInfo obj = null;
            Order order = new Order();
            Product product = new Product();

            if (maCTDDH != 0)
            {
                Optional<OrderInfo> orderInfo = orderInfoRepository.findById(maCTDDH);
                if (orderInfo.isPresent()) obj = orderInfo.get();
            }

            if (tenMH != "")
            {
                Optional<Product> productOptional = productRepository.findByName(tenMH);
                if (productOptional.isPresent()) product = productOptional.get();
            }

            if (maDDH != 0)
            {
                Optional<Order> orderOptional = orderRepository.findById(maDDH);
                if (orderOptional.isPresent()) order = orderOptional.get();
            }
            obj.setProduct(product);
            obj.setSoLuong(soLuong);
            obj.setOrder(order);
            orderInfoRepository.save(obj);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        return mv;
    }

    @RequestMapping(value = "/viewOrderInfo/{maCTDDH}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doEdit(@PathVariable("maCTDDH") int maCTDDH) {
        ModelAndView mv = new ModelAndView("viewOrderInfo");
        mv.addObject("productLists", productRepository.findAll());
        Optional<OrderInfo> objOpt  = this.orderInfoRepository.findById(maCTDDH);
        OrderInfo obj = null;
        if(objOpt.isPresent()){
            obj = objOpt.get();
        }
        if(obj == null){
            // Tu tao them class Exception cho Controller
        }
        mv.addObject("orderInfoList", obj);
        return mv;
    }

    @RequestMapping(value = "/order/details/{maDDH}/delete/{maCTDDH}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doDelete(@PathVariable("maCTDDH") int maCTDDH) {
        ModelAndView mv = new ModelAndView("redirect:/order/details/{maDDH}");
        orderInfoRepository.deleteById(maCTDDH);
        return mv;
    }
}
