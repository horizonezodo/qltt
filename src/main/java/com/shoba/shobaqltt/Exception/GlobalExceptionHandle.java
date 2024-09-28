package com.shoba.shobaqltt.Exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandle {
    @ExceptionHandler(Exception.class)
    public ModelAndView handleGlobalException(Exception ex, HandlerMethod handler) {
        ModelAndView modelAndView = null;

        if (handler.getBeanType().getSimpleName().equals("AdminController")) {
            modelAndView = new ModelAndView("Error");
        } else if (handler.getBeanType().getSimpleName().equals("UserController")) {
            modelAndView = new ModelAndView("user_error");
        }
        return modelAndView;
    }
}
