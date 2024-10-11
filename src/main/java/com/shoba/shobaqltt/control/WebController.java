package com.shoba.shobaqltt.control;

import com.shoba.shobaqltt.Exception.MessageError;
import com.shoba.shobaqltt.request.LoginRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@CrossOrigin(origins = "*", maxAge = 3600)
public class WebController {

    @GetMapping("/")
    public String landingPage(Model model) {
        return "index";
    }

    @RequestMapping("/partials/{page}")
    String partialHandler(@PathVariable("page") final String page) {
        return page;
    }

    @PostMapping("/login")
    @ResponseBody
    public ResponseEntity<?> loginPage(@RequestBody LoginRequest request){
        if(request.getUsername().equals("admin")){
            return new ResponseEntity<>(new MessageError("Admin"), HttpStatus.OK);
        }else{
            return new ResponseEntity<>(new MessageError("User"), HttpStatus.OK);
        }
    }



    @GetMapping("/home")
    @ResponseBody
    public ResponseEntity<?> getHomePage(){
        return new ResponseEntity<>(new MessageError("Home page"), HttpStatus.OK);
    }

}
