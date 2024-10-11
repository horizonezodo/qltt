package com.shoba.shobaqltt.control;

import com.shoba.shobaqltt.Exception.MessageError;
import com.shoba.shobaqltt.response.GetViewDetail;
import com.shoba.shobaqltt.model.category;
import com.shoba.shobaqltt.model.newDetail;
import com.shoba.shobaqltt.repo.CateRepo;
import com.shoba.shobaqltt.request.CategoryRequest;
import com.shoba.shobaqltt.request.newDetailRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/admin")
public class AdminRestController {

    @Autowired
    private CateRepo cateRepo;

    @Autowired
    private com.shoba.shobaqltt.repo.newDetailRepo newDetailRepo;


    @GetMapping(value = {"/cate/{id}"})
    public ResponseEntity<?> showAddCate(@PathVariable("id")Long id){
        Optional<category> opt = cateRepo.findByCateId(id);
        if(opt.isPresent()) {
            return new ResponseEntity<>(opt.get(), HttpStatus.OK);
        }else{
            return  new ResponseEntity<>(new MessageError("Cannot find this id: " + id), HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping(value = "/cate-list")
    public ResponseEntity<?> getCateList(Model model){
        List<category> cateList = cateRepo.findAll();
        return new ResponseEntity<>(cateList,HttpStatus.OK);
    }

    @GetMapping("/showEditCate/{id}")
    public ResponseEntity<?> showEditCate(@PathVariable("id")Long id){
        Optional<category> cateOpt = cateRepo.findByCateId(id);
        if (cateOpt.isPresent()){
            category cate = cateOpt.get();
            return new ResponseEntity<>(cate, HttpStatus.FOUND);
        }else{
            return new ResponseEntity<>("Cannot find Category with id: " + id, HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping("/deleteCate/{id}")
    public ResponseEntity<?> deleteCate(@PathVariable("id") Long id){
        Optional<category> cateOpt = cateRepo.findByCateId(id);
        newDetail newDetailOpt = newDetailRepo.findByCateId(id);
        if(cateOpt.isPresent()){
            category cate = cateOpt.get();
            cateRepo.delete(cate);
            if(newDetailOpt != null){
                newDetailRepo.delete(newDetailOpt);
            }
            return new ResponseEntity<>("Delete Category wiht id: " + id, HttpStatus.BAD_REQUEST);
        }else{
            return new ResponseEntity<>("Cannot find Category with id: " + id, HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/viewDetail/{id}")
    public ResponseEntity<?> viewDetail(@PathVariable("id")String id){
        newDetail detail = newDetailRepo.findByCateId(Long.parseLong(id));
        if(detail != null){
            GetViewDetail res = new GetViewDetail();
            res.setNewDetail(detail);
            String cateName = cateRepo.findByCateId(Long.parseLong(id)).get().getCateName();
            res.setName(cateName);
            return new ResponseEntity<>(res,HttpStatus.OK);
        }else{
            return new ResponseEntity<>(null, HttpStatus.OK);
        }

    }

//    @GetMapping("/admin/addNewDetail/{id}")
//    public ResponseEntity<?> showNewDetail(Model model, @PathVariable("id")Long id){
//        model.addAttribute("cateId", id);
//        return "add_new_detail";
//    }
//
//
//
//    @GetMapping("/admin/show-edit-new-detail/{id}")
//    public ResponseEntity<?> showEditDetail(Model model, @PathVariable("id")Long id){
//        Optional<newDetail> newDetailOpt = newDetailRepo.findByNewDetailId(id);
//        String cateName = cateRepo.findByCateId(id).get().getCateName();
//        model.addAttribute("cateId", id);
//        if(newDetailOpt.isPresent()){
//            newDetail updateDetail = newDetailOpt.get();
//
//            model.addAttribute("updateDetail",updateDetail);
//            model.addAttribute("cateName",cateName);
//            return "show_edit_detail";
//        }else{
//            model.addAttribute("ErrorName", "Id Not Found");
//            return "redirect:/Error";
//        }
//    }


    @PostMapping("/delete-new-detail/{id}")
    public ResponseEntity<?> deleteNewDetail(@PathVariable("id")Long id){
        Optional<newDetail> newDetailOpt = newDetailRepo.findByNewDetailId(id);
        String cateId = newDetailOpt.get().getCateId().toString();
        if(newDetailOpt.isPresent()){
            newDetailRepo.delete(newDetailOpt.get());
            return new ResponseEntity<>(new MessageError("Delete New Detail with this id: " + id),HttpStatus.OK);
        }else{
           return new ResponseEntity<>(new MessageError("Cannot found this id: " + id),HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping({"/addCate"})
    public ResponseEntity<?> addCate(@RequestBody CategoryRequest request){
        category cate = new category();
        cate.setCateName(request.getCateName());
        cate.setCateActivate(request.isCateActivate());
        cateRepo.save(cate);
        return new ResponseEntity<>(cate, HttpStatus.CREATED);
    }

    @PostMapping("/editCate/{id}")
    public ResponseEntity<?> editCate(@RequestBody CategoryRequest request, @PathVariable Long id){
        Optional<category> cateOpt = cateRepo.findByCateId(id);
        if(cateOpt.isPresent()){
            category cate = cateOpt.get();
           cate.setCateName(request.getCateName());
           cate.setCateActivate(request.isCateActivate());
            cateRepo.save(cate);
            return new ResponseEntity<>(cate, HttpStatus.OK);
        }
        else{
            return new ResponseEntity<>(new MessageError("Can not found category with id: " + id),HttpStatus.BAD_REQUEST);
        }
    }
    @PostMapping("/addNewDetail/{id}")
    public ResponseEntity<?> addNewDetail(@PathVariable("id") String id, @RequestBody newDetailRequest request){
        Optional<category> cateOpt = cateRepo.findByCateId(Long.parseLong(id));
        if(cateOpt.isPresent()){
            newDetail detail = new newDetail();
            detail.setTitle(request.getTitle());
            detail.setContent(request.getContent());
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String strDate = formatter.format(date);
            detail.setCreateAt(strDate);
            detail.setCateId(Long.parseLong(id));
            detail.setStatus(request.isStatus());
            newDetailRepo.save(detail);
            return new ResponseEntity<>(detail, HttpStatus.OK);
        }else{
            return new ResponseEntity<>(new MessageError("Cannot found Category with this id: " + id),HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping("/edit-new-detail/{id}")
    public ResponseEntity<?> EditNewDetail(@PathVariable("id")Long id, @RequestBody newDetailRequest request){
        Optional<newDetail> newDetailOpt = newDetailRepo.findByNewDetailId(id);
        if(newDetailOpt.isPresent()){
            newDetail upadteDetail = newDetailOpt.get();
            upadteDetail.setTitle(request.getTitle());
            upadteDetail.setContent(request.getContent());
            upadteDetail.setStatus(request.isStatus());
            newDetailRepo.save(upadteDetail);
            return new ResponseEntity<>(upadteDetail,HttpStatus.OK);
        }else{
            return new ResponseEntity<>(new MessageError("Cannot found New Detail with this id: " + id), HttpStatus.BAD_REQUEST);
        }
    }
}
