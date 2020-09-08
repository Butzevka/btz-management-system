package com.butzevka.btzmanagementsystem.controllers;

import com.butzevka.btzmanagementsystem.model.User;
import com.butzevka.btzmanagementsystem.repositories.RoleRepository;
import com.butzevka.btzmanagementsystem.services.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.naming.Binding;
import javax.validation.Valid;

@Controller
@Secured({"ROLE_MANAGER", "ROLE_ADMIN"})
public class ManagerController {

    private final UserServiceImpl userService;
    private final RoleRepository roleRepository;

    @Autowired
    public ManagerController(UserServiceImpl userService, RoleRepository roleRepository) {
        this.userService = userService;
        this.roleRepository = roleRepository;
    }

    @ModelAttribute("command")
    public User defaultInstance() {
        User guest = new User();
        return guest;
    }

    @GetMapping(path = "/app/manager/user-form")
    public String newUserForm(Model model) {
        model.addAttribute("user", new User());
        return "/manager/user-form";
    }

    @PostMapping(path = "/app/manager/user-form")
    public String saveUser(@Valid User user, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            System.out.println(result.getAllErrors());
            return "/manager/user-form";
        }
        userService.saveUser(user);
        redirectAttributes.addFlashAttribute("message", "Dodano użytkownika");
        return "redirect:/index";
    }

    @GetMapping(path = "/app/manager/user-list")
    public String allUsersList(Model model) {
        model.addAttribute("users", userService.findAllUsers());
        return "/manager/user-list";
    }

    @GetMapping(path = "/app/manager/user/{id}/details")
    public String showUserDetails(Model model, @PathVariable Long id) {
        model.addAttribute("user", userService.findUserById(id));
        return "/manager/user-details";
    }

    @GetMapping(path = "/app/manager/user/{id}/edit")
    public String editUserData(Model model, @PathVariable Long id) {
        model.addAttribute("user", userService.findUserById(id));
        return "/manager/user-form";
    }

    @PostMapping(path = "/app/manager/user/{id}/edit")
    public String saveEditUserData(@Valid User user, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            return "manager/user-form";
        }
        redirectAttributes.addFlashAttribute("message", "Dane zmienione pomyślnie");
        userService.saveUser(user);
        return "redirect:/app/manager/user-list";
    }

    @GetMapping(path = "app/manager/user/{id}/delete")
    public String disableUser(@PathVariable Long id) {
        User userToHide = userService.findUserById(id);
        userToHide.setEnabled(0);
        userService.saveUser(userToHide);
        return "redirect:/app/manager/user-list";
    }


}
