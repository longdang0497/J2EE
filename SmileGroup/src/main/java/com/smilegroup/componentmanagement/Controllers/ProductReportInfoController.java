package com.smilegroup.componentmanagement.Controllers;

import com.smilegroup.componentmanagement.DAO.*;
import com.smilegroup.componentmanagement.Models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.sql.SQLException;
import java.util.ArrayList;
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
    public ModelAndView doGetProductReportInfo(@PathVariable("maBCHT") int maBCHT, @PathVariable("thang") int thang) throws Exception, SQLException, NullPointerException {
        ModelAndView mv = new ModelAndView("productreportinfo");

        ProductReport obj = new ProductReport();
        Long sumImport = productReportRepository.sumImport(maBCHT);
        Long sumSell = productReportRepository.sumSell(maBCHT);
        Long sumLeft = productReportRepository.sumLeft(maBCHT);
        if (maBCHT != 0 && sumImport != null && sumLeft != null && sumSell != null)
        {
            Optional<ProductReport> productReportOptional = productReportRepository.findById(maBCHT);
            if (productReportOptional.isPresent()){
                obj.setMaBCHT(productReportOptional.get().getMaBCHT());
                obj.setNgayLap(productReportOptional.get().getNgayLap());
                obj.setThang(productReportOptional.get().getThang());
                obj.setEmployee(productReportOptional.get().getEmployee());
                if (sumImport != 0)
                    obj.setTongNhap(sumImport);
                else
                    obj.setTongNhap(Long.parseLong("0"));
                if (sumSell != 0)
                    obj.setTongBan(sumSell);
                else
                    obj.setTongBan(Long.parseLong("0"));
                if (sumLeft != 0)
                    obj.setTongTon(sumLeft);
                else
                    obj.setTongTon(Long.parseLong("0"));
                productReportRepository.save(obj);
            }
        }

        ArrayList<ProductReportInfo> arrResult = CreateReport(maBCHT, thang);
        if (arrResult != null)
        {
            for (ProductReportInfo itr : arrResult)
            {
                if (itr.getProduct().getMaMH() != 0)
                {
                    Optional<ProductReportInfo> prOptional = productReportInfoRepository.findAllByProductID(itr.getProduct().getMaMH(), itr.getProductReport().getMaBCHT());
                    if (!prOptional.isPresent())
                        productReportInfoRepository.save(itr);
                }
            }

        }
        else
        {
            ProductReportInfo productReportInfo = new ProductReportInfo();
            arrResult.add(productReportInfo);
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
                    luongBan[i][1] = Math.toIntExact(billInfoRepository.calculateSumSellByProductID(info.getBill().getMaHD(), info.getProduct().getMaMH()));
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
            ProductReportInfo result = new ProductReportInfo();
            if (obj != null)
            {
                int temp = 0;
                for (int i = 0; i < luongBan.length; i++)
                {
                    if (luongBan[i][0] == obj.getMaMH())
                    {
                        temp = luongBan[i][0];
                        result.setLuongBan(new Long(luongBan[i][1]));
                    }
                }
                if (temp == 0)
                    result.setLuongBan(Long.parseLong("0"));

                for (int i = 0; i < luongNhap.length; i++)
                {
                    if (luongNhap[i][0] == obj.getMaMH())
                    {
                        temp = luongNhap[i][0];
                        result.setLuongNhap(new Long(luongNhap[i][1]));
                    }
                }
                if (temp == 0)
                    result.setLuongNhap(Long.parseLong("0"));

                for (int i = 0; i < luongTon.length; i++)
                {
                    if (luongTon[i][0] == obj.getMaMH())
                    {
                        temp = luongTon[i][0];
                        result.setLuongTon(new Long(luongTon[i][1]));
                    }
                }
                if (temp == 0)
                    result.setLuongTon(Long.parseLong("0"));

                result.setProductReport(productReport);
                result.setProduct(obj);

                arrResult.add(result);
            }
        }
        return arrResult;
    }
}
