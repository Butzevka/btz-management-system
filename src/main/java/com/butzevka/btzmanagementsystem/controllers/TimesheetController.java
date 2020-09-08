package com.butzevka.btzmanagementsystem.controllers;

import com.butzevka.btzmanagementsystem.model.*;
import com.butzevka.btzmanagementsystem.services.TimesheetServiceImpl;
import com.butzevka.btzmanagementsystem.services.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
public class TimesheetController {

    private final TimesheetServiceImpl timesheetService;
    private final UserServiceImpl userService;

    @Autowired
    public TimesheetController(TimesheetServiceImpl timesheetService, UserServiceImpl userService) {
        this.timesheetService = timesheetService;
        this.userService = userService;
    }

    @ModelAttribute("command")
    public User defaultInstance() {
        User guest = new User();
        return guest;
    }
    @Secured({"ROLE_MANAGER", "ROLE_ADMIN"})
    @RequestMapping("/app/manager/rota-form")
    public String openRotaForm(Model model) {
        model.addAttribute("timesheet", new Timesheet());
        model.addAttribute("staffWeekRota", timesheetService.getStaffWeekRota());
        model.addAttribute("currentWeek", timesheetService.currentWeekDates(LocalDate.now()));
        return "/manager/rota-form";
    }
    @ExceptionHandler(ResourceNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String rotaNotFound() {
        return "/404";
    }
    @Secured({"ROLE_MANAGER", "ROLE_ADMIN"})
    @PostMapping("/app/manager/rota-form")
    public String saveRotaForm(@Valid StaffWeekRota staffWeekRota, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            System.out.println(result.getAllErrors());
            return "/manager/rota-form";
        }
        for (PersonalWeekRota weekRota : staffWeekRota.getWeekRota()) {
            for (Timesheet timesheet : weekRota.getWeekRotaTimesheetList()) {
                timesheetService.saveTimesheet(timesheet);
            }
        }
        redirectAttributes.addFlashAttribute("message", "Dodano grafik pomyślnie");
        return "redirect:/index";
    }
//    @Secured({"ROLE_USER", "ROLE_MANAGER", "ROLE_ADMIN"})
//    @RequestMapping("app/rota")
//    public String publicRota(Model model) {
//        model.addAttribute("currentWeek", timesheetService.currentWeekDates(LocalDate.now()));
//        model.addAttribute("timesheet", timesheetService.getCurrentWeekTimesheet(LocalDate.now()));
//        model.addAttribute("users", userService.findAllUsers());
//        return "/rota";
//    }


    @Secured("ROLE_ADMIN")
    @RequestMapping("/app/admin/rota-form")
    public String adminRotaForm(Model model) {
        List<LocalDate> currentWeek = timesheetService.currentWeekDates(LocalDate.now());
        List<Timesheet> timesheets = new ArrayList<>();
        List<User> users = userService.findAllUsers();
        for (LocalDate currentWeekDate : currentWeek) {
            for (User user : users) {
                if(timesheetService.getByUserIdAndDate(user.getId(), currentWeekDate)==null) {
                    timesheetService.saveTimesheet(new Timesheet(currentWeekDate, user));
                }
                timesheets.add(timesheetService.getByUserIdAndDate(user.getId(), currentWeekDate));
            }
        }
        TimesheetContainer timesheetList = new TimesheetContainer();
        timesheetList.setTimesheetList(timesheets);

        model.addAttribute("CurrentWeek", currentWeek);
        model.addAttribute("Users", users);
        model.addAttribute("TimesheetList", timesheetList);

        return "/admin/rota-form";
    }

    @Secured("ROLE_ADMIN")
    @PostMapping("/app/admin/rota-form")
    public String saveAdminRotaForm(@Valid TimesheetContainer timesheetContainer, BindingResult result, RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            System.out.println(result.getAllErrors());
            return "/admin/rota-form";
        }
        List<Timesheet> currentWeekTimesheet = timesheetContainer.getTimesheetList();
        for (Timesheet timesheet : currentWeekTimesheet) {
            timesheetService.saveTimesheet(timesheet);
        }

        redirectAttributes.addFlashAttribute("message", "Dodano grafik pomyślnie");
        return "redirect:/index";
    }
}
