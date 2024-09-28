package com.shoba.shobaqltt.control;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

public class UserErrorController implements ErrorController {

    @RequestMapping("/user/error")
    public String handleUserError( Model model){
        return "user_error";
    }
}
