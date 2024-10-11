package com.shoba.shobaqltt.control;

import com.shoba.shobaqltt.Exception.MessageError;
import com.shoba.shobaqltt.model.category;
import com.shoba.shobaqltt.model.newDetail;
import com.shoba.shobaqltt.repo.CateRepo;
import com.shoba.shobaqltt.response.GetViewDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private CateRepo cateRepo;

    @Autowired
    private com.shoba.shobaqltt.repo.newDetailRepo newDetailRepo;

    @GetMapping("/home")
    public ResponseEntity<?> getHome(){
        return new ResponseEntity<>(new MessageError("Home"), HttpStatus.OK);
    }

    @GetMapping(value = "/cate-list")
    public ResponseEntity<?> getCateList(){
        List<category> cateList = cateRepo.findAllByCateActivate(true);
        return new ResponseEntity<>(cateList, HttpStatus.OK);
    }

    @GetMapping("/viewDetail/{id}")
    public ResponseEntity<?> viewDetail(@PathVariable("id")String id){
        newDetail detail = newDetailRepo.findByCateIdAndStatus(Long.parseLong(id), true);
        if(detail != null){
            String cateName = cateRepo.findByCateId(Long.parseLong(id)).get().getCateName();
            GetViewDetail res = new GetViewDetail();
            res.setNewDetail(detail);
            res.setName(cateName);
            return new ResponseEntity<>(res, HttpStatus.OK);
        }else{
           return new ResponseEntity<>(null,HttpStatus.OK);
        }
    }



}
