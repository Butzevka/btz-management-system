package com.butzevka.btzmanagementsystem.controllers;

import com.butzevka.btzmanagementsystem.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
public class HomeController {
    @ModelAttribute("command")
    public User defaultInstance() {
        User guest = new User();
        return guest;
    }

    @RequestMapping(value = {"/", "/home", "/index"})
    public String homePage() {
        return "/index";
    }

    @RequestMapping(value = {"/404", "**error", "/error"})
    public String errorPage() {
        return "/404";
    }

    @RequestMapping("/login")
    public String loginPage(Model model) {
        model.addAttribute("user", new User());
        return "/login";
    }
}
