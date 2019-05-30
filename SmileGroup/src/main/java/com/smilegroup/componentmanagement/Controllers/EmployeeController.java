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
public class EmployeeController {

    @Autowired
    EmployeeRepository empRepository;

    @Autowired
    DepartmentRepository depRepository;

    @RequestMapping("/employee")
    public ModelAndView doEmployee() {
        ModelAndView mv = new ModelAndView("employee");
        mv.addObject("depLists", depRepository.findAll());
        mv.addObject("employeeLists", empRepository.findAll());
        return mv;
    }

    @RequestMapping(value = "/employee&save", method = RequestMethod.POST)
    public ModelAndView doSave(@RequestParam("tenNV") String tenNV, String tenPhong) {
        ModelAndView mv = new ModelAndView("redirect:/employee");
        Employee obj = new Employee();
        Department depObj = new Department();

        if (tenPhong != "")
        {
            Optional<Department> depObjOpt = depRepository.findByName(tenPhong);
            if (depObjOpt.isPresent()) depObj = depObjOpt.get();
        }
        obj.setTenNV(tenNV);
        obj.setDepartment(depObj);
        empRepository.save(obj);
        return mv;
    }

    @RequestMapping(value = "/employee&edit", method = RequestMethod.POST)
    public ModelAndView doUpdate(@RequestParam("maNV") int maNV, @RequestParam("tenNV") String tenNV, String tenPhong) {
        ModelAndView mv = new ModelAndView("redirect:/employee");
        Employee obj = null;
        Department depObj = new Department();

        if (maNV != 0)
        {
            Optional<Employee> objOpt = empRepository.findById(maNV);
            if (objOpt.isPresent()) obj = objOpt.get();
        }

        if (tenPhong != "")
        {
            Optional<Department> objOpt = depRepository.findByName(tenPhong);
            if (objOpt.isPresent()) depObj = objOpt.get();
        }

        obj.setTenNV(tenNV);
        obj.setDepartment(depObj);
        empRepository.save(obj);

        return mv;
    }

    @RequestMapping(value = "/viewEmployee/{maNV}", method = RequestMethod.GET)
    public ModelAndView doEdit(@PathVariable("maNV") int maNV) {
        ModelAndView mv = new ModelAndView("viewEmployee");
        mv.addObject("depLists", depRepository.findAll());
        Optional<Employee> objOpt  = this.empRepository.findById(maNV);
        Employee obj = null;
        if(objOpt.isPresent()){
            obj = objOpt.get();
        }
        if(obj == null){
            // Tu tao them class Exception cho Controller
        }
        mv.addObject("employeeEditList", obj);
        return mv;
    }

    @RequestMapping(value = "/employee/delete/{maNV}", method = RequestMethod.GET)
    public ModelAndView doDelete(@PathVariable("maNV") int maNV) {
        ModelAndView mv = new ModelAndView("redirect:/employee");
        empRepository.deleteById(maNV);
        return mv;
    }
}
