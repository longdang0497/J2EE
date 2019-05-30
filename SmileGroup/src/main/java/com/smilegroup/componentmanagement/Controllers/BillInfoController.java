//package com.smilegroup.componentmanagement.Controllers;
//
//import com.smilegroup.componentmanagement.DAO.*;
//import com.smilegroup.componentmanagement.Models.*;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.persistence.EntityManager;
//import java.util.Date;
//import java.util.Optional;
//
//@Controller
//public class BillController {
//
//    @Autowired
//    BillRepository billRepository;
//
//    @Autowired
//    BillInfoRepository billInfoRepository;
//
//    @Autowired
//    CustomerRepository customerRepository;
//
//    @Autowired
//    ProductRepository productRepository;
//
//    @Autowired
//    EmployeeRepository employeeRepository;
//
//    @RequestMapping(value = "/bill/details/{maHD}", produces = "application/x-www-form-urlencoded;charset=utf-8")
//    public ModelAndView doBillInfo(@RequestParam("maHD") int maHD) {
//        ModelAndView mv = new ModelAndView("billinfo");
//        mv.addObject("customerLists", customerRepository.findAll());
//        mv.addObject("billInfoLists", billInfoRepository.findAll());
//
//        if (maHD != 0)
//        {
//            Optional<BillInfo> employeeObjOpt = billInfoRepository.findByBillID(maHD);
//            if (employeeObjOpt.isPresent()) employeeObj = employeeObjOpt.get();
//        }
//
//        return mv;
//    }
//
//    @RequestMapping(value = "/bill&save", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
//    public ModelAndView doSave(String tenKH, String tenNV, Date ngayLap, int tongTien, String maSoThue) {
//        ModelAndView mv = new ModelAndView("redirect:/bill");
//        Bill obj = new Bill();
//        Customer customerObj = new Customer();
//        Employee employeeObj = new Employee();
//
//        if (tenNV != "")
//        {
//            Optional<Employee> employeeObjOpt = employeeRepository.findByName(tenNV);
//            if (employeeObjOpt.isPresent()) employeeObj = employeeObjOpt.get();
//        }
//
//        if (tenKH != "")
//        {
//            Optional<Customer> customerObjOpt = customerRepository.findByName(tenKH);
//            if (customerObjOpt.isPresent()) customerObj = customerObjOpt.get();
//        }
//
//        obj.setEmployee(employeeObj);
//        obj.setCustomer(customerObj);
//        obj.setMaSoThue(maSoThue);
//        obj.setTongTien(tongTien);
//        obj.setNgayLap(ngayLap);
//        billRepository.save(obj);
//        return mv;
//    }
//
////    @RequestMapping(value = "/bill&edit", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
////    public ModelAndView doUpdate(@RequestParam("maNV") int maNV, @RequestParam("tenNV") String tenNV, String cauHinh, String hangSX,
////                                 int soLuong, String tenLoai, String tenDV, String tenKhu) {
////        ModelAndView mv = new ModelAndView("redirect:/bill");
////        Bill obj = null;
////        Unit unitObj = new Unit();
////        Store storeObj = new Store();
////        TypeOfComponent tocObj = new TypeOfComponent();
////
////        if (maNV != 0)
////        {
////            Optional<Bill> objOpt = billRepository.findById(maNV);
////            if (objOpt.isPresent()) obj = objOpt.get();
////        }
////
////        if (tenKhu != "")
////        {
////            Optional<Store> storeObjOpt = storeRepository.findByName(tenKhu);
////            if (storeObjOpt.isPresent()) storeObj = storeObjOpt.get();
////        }
////
////        if (tenDV != "")
////        {
////            Optional<Unit> unitObjOpt = unitRepository.findByName(tenDV);
////            if (unitObjOpt.isPresent()) unitObj = unitObjOpt.get();
////        }
////
////        if (tenLoai != "")
////        {
////            Optional<TypeOfComponent> tocObjOpt = tocRepository.findByName(tenLoai);
////            if (tocObjOpt.isPresent()) tocObj = tocObjOpt.get();
////        }
////
////        obj.setTenNV(tenNV);
////        obj.setCauHinh(cauHinh);
////        obj.setType(tocObj);
////        obj.setHangSX(hangSX);
////        obj.setSoLuong(soLuong);
////        obj.setStore(storeObj);
////        obj.setUnit(unitObj);
////        billRepository.save(obj);
////
////        return mv;
////    }
////
////    @RequestMapping(value = "/viewBill/{maNV}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
////    public ModelAndView doEdit(@PathVariable("maNV") int maNV) {
////        ModelAndView mv = new ModelAndView("viewBill");
////        mv.addObject("storeLists", storeRepository.findAll());
////        mv.addObject("tocLists", tocRepository.findAll());
////        mv.addObject("unitLists", unitRepository.findAll());
////        Optional<Bill> objOpt  = this.billRepository.findById(maNV);
////        Bill obj = null;
////        if(objOpt.isPresent()){
////            obj = objOpt.get();
////        }
////        if(obj == null){
////            // Tu tao them class Exception cho Controller
////        }
////        mv.addObject("billEditList", obj);
////        return mv;
////    }
////
////    @RequestMapping(value = "/bill/delete/{maNV}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
////    public ModelAndView doDelete(@PathVariable("maNV") int maNV) {
////        ModelAndView mv = new ModelAndView("redirect:/bill");
////        billRepository.deleteById(maNV);
////        return mv;
////    }
//}
