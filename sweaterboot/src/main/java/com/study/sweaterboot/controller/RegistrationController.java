package com.study.sweaterboot.controller;

import com.study.sweaterboot.domain.User;
import com.study.sweaterboot.domain.dto.CaptchaResponseDto;
import com.study.sweaterboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import javax.validation.Valid;
import java.util.Collections;
import java.util.Map;

/**
 * Created by Alexey on 18.09.2018.
 */
@Controller
public class RegistrationController {
    private final static String CAPTCHA_URL="https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";

    @Autowired
    private UserService userService;
    @Value("${recaptcha.secret}")
    private String secret;

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(
            @RequestParam ("password2") String passwordConfirm,
            @RequestParam("g-recaptcha-response") String captchaResponse,
            @Valid User user,
            BindingResult bindingResult,
            Model model) {
        String url = String.format(CAPTCHA_URL, secret, captchaResponse);
        CaptchaResponseDto responseDto = restTemplate.postForObject(url, Collections.emptyList(), CaptchaResponseDto.class);

        if(!responseDto.isSuccess()){
            model.addAttribute("captchaError", "Заполните капчу");
        }

        boolean iSConfirmEmpty = StringUtils.isEmpty(passwordConfirm);
        if(iSConfirmEmpty){
            model.addAttribute("password2Error","Пароль не может быть пустым");
        }
        if(user.getPassword()!=null&&!user.getPassword().equals(passwordConfirm)){
            model.addAttribute("password2Error", "Пароли должны быть одинаковыми");
        }
        if(iSConfirmEmpty || bindingResult.hasErrors() || !responseDto.isSuccess()){
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            return "registration";
        }
        if (!userService.addUser(user)) {
            model.addAttribute("usernameError", "User exists!");
            return "registration";
        }
        user.setActiveMail(false);
        user.setActive(false);


        return "redirect:/login";

    }
    @GetMapping("/activate/{code}")
    public String activate(Model model,
                           @PathVariable String code){
        boolean isActived = userService.activateUser(code);

        if(isActived){
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "Почта активирована");

        }else{
            model.addAttribute("messageType","danger");
            model.addAttribute("message","Активационный код не найден!");
        }

        return "login";
    }
}
