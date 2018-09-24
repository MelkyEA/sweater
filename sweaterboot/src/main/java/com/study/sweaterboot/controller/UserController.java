package com.study.sweaterboot.controller;

import org.springframework.util.StringUtils;
import com.study.sweaterboot.domain.Role;
import com.study.sweaterboot.domain.User;
import com.study.sweaterboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users", userService.findAll());

        return "userList";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());

        return "userEdit";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {
        userService.saveUser(user, username, form);

        return "redirect:/user";
    }

    @GetMapping("profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user) {
        model.addAttribute("username", user.getUsername());
        model.addAttribute("email", user.getEmail());

        return "profile";
    }
    @PostMapping("profile")
    public String updateProfile(
            @AuthenticationPrincipal User user,
            @RequestParam String password,
            @RequestParam ("password2") String passwordConfirm,
            @RequestParam String email,
            Model model

    ) {
        boolean isConfirmEmpty= StringUtils.isEmpty(passwordConfirm);
        boolean isPasswordEmpty= StringUtils.isEmpty(password);
        if(isPasswordEmpty) {
            model.addAttribute("passwordError", "Пароль не может быть пустым");


            if (isConfirmEmpty) {
                model.addAttribute("password2Error", "Пароль не может быть пустым");

            }
            return "profile";
        }



        if(!password.equals(passwordConfirm)){
            model.addAttribute("password2Error","Пароли должны совпадать");
            model.addAttribute("passwordError","Пароли должны совпадать");
            return "profile";
        }else{
        userService.updateProfile(user, password, email);}




        return "redirect:/user/profile";
    }
}
