package com.butzevka.btzmanagementsystem.controllers;

import com.butzevka.btzmanagementsystem.model.Timesheet;
import com.butzevka.btzmanagementsystem.services.IAuthenticationFacade;
import com.butzevka.btzmanagementsystem.services.TimesheetServiceImpl;
import com.butzevka.btzmanagementsystem.services.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;

@Controller
public class UserController {

    private final IAuthenticationFacade authenticationFacade;
    private final UserServiceImpl userService;
    private final TimesheetServiceImpl timesheetService;

    @Autowired
    public UserController(IAuthenticationFacade authenticationFacade, UserServiceImpl userService, TimesheetServiceImpl timesheetService) {
        this.authenticationFacade = authenticationFacade;
        this.userService = userService;
        this.timesheetService = timesheetService;
    }

    @RequestMapping("/app/rota")
    public String currentRota(Model model) {
        model.addAttribute("timesheet", new Timesheet());
        model.addAttribute("staffWeekRota", timesheetService.getStaffWeekRota());
        model.addAttribute("currentWeek", timesheetService.currentWeekDates(LocalDate.now()));
        return "rota";
    }

    @RequestMapping("/app/details")
    public String currentUserDetails(Model model) {
        Authentication authentication = authenticationFacade.getAuthentication();
        model.addAttribute(userService.findUserByUsername(authentication.getName()));
        return "/details";
    }
}
