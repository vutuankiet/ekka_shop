package com.example.ekka.controller.admin;

import com.example.ekka.dto.ContactDto;
import com.example.ekka.dto.ReviewDto;
import com.example.ekka.entities.ContactEntity;
import com.example.ekka.entities.ProductEntity;
import com.example.ekka.entities.ReviewEntity;
import com.example.ekka.entities.UserEntity;
import com.example.ekka.service.ContactService;
import com.example.ekka.service.UserService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("ekka/admin/contact")
public class ContactAdminController {

    @Autowired
    ContactService contactService;

    @Autowired
    UserService userService;

    //quyền ADMIN được vào trang này
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @GetMapping(value = {"list","","/"})
    public String list(Model model) {
        try {
            List<ContactEntity> listContact = contactService.listAllCreateDesc();
            List<UserEntity> listUser = userService.listAll();
            model.addAttribute("listContact",listContact);
            model.addAttribute("listUser",listUser);

            model.addAttribute("contactDto", new ContactDto());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin_view/contact/list";
    }

    @PostMapping(value = "delete/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String deleteContact(@PathVariable(name = "id") long id, ContactDto contactDto, RedirectAttributes model, Model m) {
        try {
            contactDto.setId(id);
            contactService.deleteContact(contactDto);
            model.addFlashAttribute("message_success", "Delete contact successfully");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Contact deletion failed");
        }

        return "redirect:/ekka/admin/contact/list/";
    }

    @PostMapping(value = "restore/{id}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String restoreContact(@PathVariable(name = "id") long id, ContactDto contactDto, RedirectAttributes model, Model m) {
        try {
            contactDto.setId(id);
            contactService.restoreContact(contactDto);
            model.addFlashAttribute("message_success", "Successful contact recovery");
        } catch (Exception e) {
            model.addFlashAttribute("message_err", "Contact recovery failed");
        }

        return "redirect:/ekka/admin/contact/list/";
    }

    @PostMapping(value = "reply/{id}")
    public String replyContact(@PathVariable(name = "id") long id, ContactDto contactDto, RedirectAttributes model, Model m){
        try {
            ContactEntity contactEntity = contactService.get(id);
            contactDto.setEmail(contactEntity.getEmail());
            contactDto.setFirst_name(contactEntity.getFirst_name());
            contactDto.setLast_name(contactEntity.getLast_name());
            contactDto.setId(id);
            contactDto.setState(2);
            contactService.replyContact(contactDto);
            model.addFlashAttribute("message_success","Feedback submitted successfully");
        }catch (Exception e){
            model.addFlashAttribute("message_err","Feedback submission failed");
        }
        return "redirect:/ekka/admin/contact/list/";
    }
}
