package com.shoba.shobaqltt.control;

import com.shoba.shobaqltt.model.category;
import com.shoba.shobaqltt.model.newDetail;
import com.shoba.shobaqltt.repo.CateRepo;
import com.shoba.shobaqltt.repo.newDetailRepo;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
public class AdminController {
    @Autowired
    private CateRepo cateRepo;

    @Autowired
    private newDetailRepo newDetailRepo;

    @GetMapping(value = {"/admin/addCate"})
    public String showAddCate(Model model){
        return "addCate";
    }

    @GetMapping(value = "/cate-list")
    public String getCateList(Model model){
        List<category> cateList = cateRepo.findAll();
        model.addAttribute("cateList", cateList);
        return "showCate";
    }

    @PostMapping({"/admin/addCate"})
    public String addCate(Model model, @RequestParam(value = "name", required = false)String name, @RequestParam(value = "isActivate", required = false) String isActivate){
        category cate = new category();

        cate.setCateName(name);
        if (isActivate != null && isActivate.equals("true")){
            cate.setCateActivate(true);
        }else {
            cate.setCateActivate(false);
        }
        cateRepo.save(cate);
        return "redirect:/cate-list";
    }

    @GetMapping("/admin/showEditCate/{id}")
    public String showEditCate(Model model, @PathVariable("id")Long id){
        Optional<category> cateOpt = cateRepo.findByCateId(id);
        if (cateOpt.isPresent()){
            category cate = cateOpt.get();
            model.addAttribute("cate", cate);
            return "showEditCate";
        }else{
            model.addAttribute("ErrorName", "Id Not Found");
            return "Error";
        }
    }

    @PostMapping("/admin/editCate/{id}")
    public String editCate(Model model, @PathVariable("id") Long id, @RequestParam(value = "cateName", required = false)String cateName , @RequestParam(value = "isActivate", required = false)String isActivate){
        Optional<category> cateOpt = cateRepo.findByCateId(id);
        if(cateOpt.isPresent()){
            category cate = cateOpt.get();
            cate.setCateName(cateName);
            if (isActivate != null && isActivate.equals("true")){
                cate.setCateActivate(true);
            }else{
                cate.setCateActivate(false);
            }
            cateRepo.save(cate);
            return "redirect:/cate-list";
        }
        else{
            model.addAttribute("ErrorName", "Id Not Found");
            return "Error";
        }
    }

    @GetMapping("/admin/deleteCate/{id}")
    public String deleteCate(Model model, @PathVariable("id") Long id){
        Optional<category> cateOpt = cateRepo.findByCateId(id);
        newDetail newDetailOpt = newDetailRepo.findByCateId(id);
        if(cateOpt.isPresent()){
            category cate = cateOpt.get();
            cateRepo.delete(cate);
            if(newDetailOpt != null){
                newDetailRepo.delete(newDetailOpt);
            }
            return "redirect:/cate-list";
        }else{
            model.addAttribute("ErrorName", "Id Not Found");
            return "redirect:/Error";
        }
    }

    @GetMapping("/viewDetail/{id}")
    public String viewDetail(Model model, @PathVariable("id")Long id){
        newDetail detail = newDetailRepo.findByCateId(id);
        if(detail != null){
            model.addAttribute("newDetail",detail);
        }else{
            model.addAttribute("newDetail",null);
        }
        String cateName = cateRepo.findByCateId(id).get().getCateName();
        model.addAttribute("cateName", cateName);
        model.addAttribute("cateId", id);
        return "show_new_detail";
    }

    @GetMapping("/admin/addNewDetail/{id}")
    public String showNewDetail(Model model, @PathVariable("id")Long id){
        model.addAttribute("cateId", id);
        return "add_new_detail";
    }

    @PostMapping("/admin/addNewDetail/{id}")
    public String addNewDetail(Model model, @PathVariable("id") Long id, @RequestParam("title")String title, @RequestParam("content")String content, @RequestParam("status")String status){
        Optional<category> cateOpt = cateRepo.findByCateId(id);
        if(cateOpt.isPresent()){
            newDetail detail = new newDetail();
            detail.setTitle(title);
            detail.setContent(content);
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String strDate = formatter.format(date);
            detail.setCreateAt(strDate);
            detail.setCateId(id);
            if(status != null && status.equals("true")){
                detail.setStatus(true);
            }
            newDetailRepo.save(detail);
            return "redirect:/viewDetail/"+ id;
        }else{
            model.addAttribute("ErrorName", "Id Not Found");
            return "redirect:/Error";
        }
    }

    @GetMapping("/admin/show-edit-new-detail/{id}")
    public String showEditDetail(Model model, @PathVariable("id")Long id){
        Optional<newDetail> newDetailOpt = newDetailRepo.findByNewDetailId(id);
        String cateName = cateRepo.findByCateId(id).get().getCateName();
        if(newDetailOpt.isPresent()){
            newDetail updateDetail = newDetailOpt.get();
            model.addAttribute("updateDetail",updateDetail);
            model.addAttribute("cateName",cateName);
            return "show_edit_detail";
        }else{
            model.addAttribute("ErrorName", "Id Not Found");
            return "redirect:/Error";
        }
    }

    @PostMapping("/admin/edit-new-detail/{id}")
    public String EditNewDetail(Model model, @PathVariable("id")Long id, @RequestParam(value = "title", required = false)String title, @RequestParam(value = "content", required = false)String content, @RequestParam(value = "isActivate", required = false)String isActivate){
        Optional<newDetail> newDetailOpt = newDetailRepo.findByNewDetailId(id);
        System.out.println(isActivate);
        if(newDetailOpt.isPresent()){
            newDetail upadteDetail = newDetailOpt.get();
            upadteDetail.setTitle(title);
            upadteDetail.setContent(content);
            if(isActivate != null && isActivate.equals("true")){
                upadteDetail.setStatus(true);
            }else{
                upadteDetail.setStatus(false);
            }
            newDetailRepo.save(upadteDetail);
            return "redirect:/viewDetail/" + upadteDetail.getCateId();
        }else{
            model.addAttribute("ErrorName", "Id Not Found");
            return "redirect:/Error";
        }
    }

    @GetMapping("/admin/delete-new-detail/{id}")
    public String deleteNewDetail(Model model, @PathVariable("id")Long id){
        Optional<newDetail> newDetailOpt = newDetailRepo.findByNewDetailId(id);
        String cateId = newDetailOpt.get().getCateId().toString();
        if(newDetailOpt.isPresent()){
            newDetailRepo.delete(newDetailOpt.get());
            return "redirect:/viewDetail/"+ cateId;
        }else{
            model.addAttribute("ErrorName", "Id Not Found");
            return "redirect:/Error";
        }
    }

}
