package com.shoba.shobaqltt.control;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class WebController {

    @GetMapping("/")
    public String landingPage(Model model){
        return "pages-login-website";
    }

    @PostMapping("/login")
    public  String loginPage(Model model, @RequestParam(name = "username", required = false)String username, @RequestParam(name = "password", required = false)String password){
        System.out.println(username);
        if(username.equals("admin")){
            return "redirect:/cate-list";
        }else{
            return "redirect:/user/cate-list";
        }
    }

}
