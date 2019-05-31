package com.smilegroup.componentmanagement.Controllers;

import com.smilegroup.componentmanagement.Models.Provider;
import com.smilegroup.componentmanagement.DAO.ProviderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
public class ProviderController {

    @Autowired
    ProviderRepository providerRepo;

    @RequestMapping(value = "/provider", produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doProvider() {
        ModelAndView mv = new ModelAndView("provider");
        mv.addObject("providerLists", providerRepo.findAll());
        return mv;
    }

    @RequestMapping(value = "/provider&save", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doSave(@RequestParam("tenNCC") String tenNCC, String diaChiNCC, String emailNCC,
                               @RequestParam("soDTNCC") String soDTNCC) {
        ModelAndView mv = new ModelAndView("redirect:/provider");
        Provider provider = new Provider();
        provider.setTenNCC(tenNCC);
        provider.setDiaChiNCC(diaChiNCC);
        provider.setEmailNCC(emailNCC);
        provider.setSoDTNCC(soDTNCC);
        providerRepo.save(provider);
        return mv;
    }

    @RequestMapping(value = "/provider&edit", method = RequestMethod.POST, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doUpdate(@RequestParam("maNCC") int maNCC, @RequestParam("tenNCC") String tenNCC, String diaChiNCC, String emailNCC,
                                 @RequestParam("soDTNCC") String soDTNCC) {
        ModelAndView mv = new ModelAndView("redirect:/provider");
        Provider provider = null;
        if (maNCC != 0)
        {
            Optional<Provider> providerOpt = providerRepo.findById(maNCC);
            if (providerOpt.isPresent()) provider = providerOpt.get();
        }
        provider.setTenNCC(tenNCC);
        provider.setDiaChiNCC(diaChiNCC);
        provider.setEmailNCC(emailNCC);
        provider.setSoDTNCC(soDTNCC);
        providerRepo.save(provider);

        return mv;
    }

    @RequestMapping(value = "/viewProvider/{maNCC}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doEdit(@PathVariable("maNCC") int maNCC) {
        ModelAndView mv = new ModelAndView("viewProvider");
        Optional<Provider> providerOptional  = this.providerRepo.findById(maNCC);
        Provider provider = null;
        if(providerOptional.isPresent()){
            provider = providerOptional.get();
        }
        if(provider == null){
            // Tu tao them class Exception cho Controller
        }
        mv.addObject("providerEditList", provider);
        return mv;
    }

    @RequestMapping(value = "/provider/delete/{maNCC}", method = RequestMethod.GET, produces = "application/x-www-form-urlencoded;charset=utf-8")
    public ModelAndView doDelete(@PathVariable("maNCC") int maNCC) {
        ModelAndView mv = new ModelAndView("redirect:/provider");
        providerRepo.deleteById(maNCC);
        return mv;
    }
}
