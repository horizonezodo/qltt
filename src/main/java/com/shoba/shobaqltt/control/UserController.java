package com.shoba.shobaqltt.control;

import com.shoba.shobaqltt.model.category;
import com.shoba.shobaqltt.model.newDetail;
import com.shoba.shobaqltt.repo.CateRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private CateRepo cateRepo;

    @Autowired
    private com.shoba.shobaqltt.repo.newDetailRepo newDetailRepo;

    @GetMapping("/user/home")
    public String getHome(Model model){
        return "index";
    }

    @GetMapping("/user/contact")
    public String getContact(Model model){
        return "contact";
    }

    @GetMapping(value = "/user/cate-list")
    public String getCateList(Model model){
        List<category> cateList = cateRepo.findAllByCateActivate(true);
        model.addAttribute("cateList", cateList);
        return "show_user_cate";
    }

    @GetMapping("/user/viewDetail/{id}")
    public String viewDetail(Model model, @PathVariable("id")Long id){
        newDetail detail = newDetailRepo.findByCateIdAndStatus(id, true);
        if(detail != null){
            model.addAttribute("newDetail",detail);
        }else{
            model.addAttribute("newDetail",null);
        }
        String cateName = cateRepo.findByCateId(id).get().getCateName();
        model.addAttribute("cateName", cateName);
        model.addAttribute("cateId", id);
        return "user_show_new_detail";
    }



}
