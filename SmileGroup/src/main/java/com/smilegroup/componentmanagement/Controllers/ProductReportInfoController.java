package com.smilegroup.componentmanagement.Controllers;

import com.smilegroup.componentmanagement.DAO.*;
import com.smilegroup.componentmanagement.Models.*;
import jdk.nashorn.internal.runtime.options.Option;
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
import java.util.List;
import java.util.Optional;

@Controller
public class ProductReportInfoController {

    @Autowired
    ProductReportInfoRepository productReportInfoRepository;

    @Autowired
    ProductReportRepository productReportRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    BillRepository billRepository;

    @Autowired
    BillInfoRepository billInfoRepository;

    @Autowired
    ImportProductInfoRepository importProductInfoRepository;

    @Autowired
    ImportProductRepository importProductRepository;

    @RequestMapping(value = "/productReportInfo/create/details/{maBCHT}/{thang}", method = { RequestMethod.GET, RequestMethod.POST }, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doGetProductReportInfo(@PathVariable("maBCHT") int maBCHT, @PathVariable("thang") int thang) {
        ModelAndView mv = new ModelAndView("productreportinfo");
        ArrayList<ProductReportInfo> arrResult = CreateReport(maBCHT, thang);
        for (ProductReportInfo obj : arrResult)
        {
            if (obj.getProduct().getMaMH() != 0)
            {
                Optional<ProductReportInfo> prOptional = productReportInfoRepository.findAllByProductID(obj.getProduct().getMaMH());
                if (!prOptional.isPresent())
                    productReportInfoRepository.save(obj);
            }
        }
        mv.addObject("prInfoLists", arrResult);
        return mv;
    }

    public int[][] calculateSumSell(int thang) {
        int[][] luongBan = null;

        Iterable<BillInfo> billInfos = null;
        Iterable<Bill> billList = billRepository.findBillByThang(thang);
        int counter = 0;
        for (Bill obj : billList) {
            billInfos = billInfoRepository.findByBillID(obj.getMaHD());

            for (BillInfo info : billInfos) {
                counter++;
            }
        }
        int i = 0;
        luongBan = new int[counter][2];

        for (Bill obj : billList) {
            billInfos = billInfoRepository.findByBillID(obj.getMaHD());
            for (BillInfo info : billInfos)
            {
                if(billInfos.iterator().hasNext() && i < counter)
                {
                    luongBan[i][0] = info.getProduct().getMaMH();
                    luongBan[i][1] = Math.toIntExact(billInfoRepository.calculateSumSellByProductID(obj.getMaHD(), info.getProduct().getMaMH()));
                    i++;
                }
            }
        }
        return luongBan;
    }

    public int[][] calculateSumImport(int thang) {
        int[][] luongNhap = null;

        Iterable<ImportProductInfo> importProductInfos = null;
        Iterable<ImportProduct> importProducts = importProductRepository.findImportByThang(thang);
        int counter = 0;
        for (ImportProduct obj : importProducts) {
            importProductInfos = importProductInfoRepository.findByImportProductID(obj.getMaPN());

            for (ImportProductInfo info : importProductInfos) {
                counter++;
            }
        }

        luongNhap = new int[counter][2];
        int i = 0;
        for (ImportProduct obj : importProducts) {
            importProductInfos = importProductInfoRepository.findByImportProductID(obj.getMaPN());
            for (ImportProductInfo info : importProductInfos)
            {
                if(importProductInfos.iterator().hasNext() && i < counter )
                {
                    luongNhap[i][0] = info.getProduct().getMaMH();
                    luongNhap[i][1] = Math.toIntExact(importProductInfoRepository.calculateSumImportByProductID(obj.getMaPN(), info.getProduct().getMaMH()));
                    i++;
                }
            }
        }

        return luongNhap;
    }

    public int[][] calculateSumLeft() {
        int[][] luongTon = null;

        int counter = 0;
        Iterable<Product> products = productRepository.findAll();
        for (Product prod : products)
            counter++;

        luongTon = new int[counter][2];
        int i = 0;
        for (Product prod : products)
        {
            if(products.iterator().hasNext() && i < counter)
            {
                luongTon[i][0] = prod.getMaMH();
                luongTon[i][1] = prod.getSoLuong();
                i++;
            }
        }

        return luongTon;
    }

    public ArrayList<ProductReportInfo> CreateReport(int maBCHT, int thang) {
        int[][] luongBan = null;
        int[][] luongNhap = null;
        int[][] luongTon = null;
        ProductReport productReport = null;
        ArrayList<ProductReportInfo> arrResult = new ArrayList<ProductReportInfo>();

        if (maBCHT != 0)
        {
            Optional<ProductReport> productReportOptional = productReportRepository.findById(maBCHT);
            if (productReportOptional.isPresent()) productReport = productReportOptional.get();
        }

        luongBan = calculateSumSell(thang);
        luongNhap = calculateSumImport(thang);
        luongTon = calculateSumLeft();

        Iterable<Product> listProducts = productRepository.findAll();
        for (Product obj : listProducts)
        {
            if (obj != null)
            {
                ProductReportInfo result = new ProductReportInfo();
                for (int i = 0; i < luongBan.length; i++)
                {
                    if (luongBan[i][0] == obj.getMaMH())
                    {
                        if (luongBan[i][1] != 0)
                            result.setLuongBan(new Long(luongBan[i][1]));
                        else
                            result.setLuongBan(new Long(0));
                    }
                }

                for (int i = 0; i < luongNhap.length; i++)
                {
                    if (luongNhap[i][0] == obj.getMaMH())
                    {
                        if (luongNhap[i][1] != 0)
                            result.setLuongNhap(new Long(luongNhap[i][1]));
                        else
                            result.setLuongNhap(new Long(0));
                    }
                }

                for (int i = 0; i < luongTon.length; i++)
                {
                    if (luongTon[i][0] == obj.getMaMH())
                    {
                        if (luongTon[i][1] != 0)
                            result.setLuongTon(new Long(luongTon[i][1]));
                        else
                            result.setLuongTon(new Long(0));
                    }
                }
                result.setProductReport(productReport);
                result.setProduct(obj);

                arrResult.add(result);

            }
        }
        return arrResult;
    }
}
