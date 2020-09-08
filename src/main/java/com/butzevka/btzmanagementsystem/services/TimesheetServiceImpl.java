package com.butzevka.btzmanagementsystem.services;

import com.butzevka.btzmanagementsystem.model.PersonalWeekRota;
import com.butzevka.btzmanagementsystem.model.StaffWeekRota;
import com.butzevka.btzmanagementsystem.model.Timesheet;
import com.butzevka.btzmanagementsystem.model.User;
import com.butzevka.btzmanagementsystem.repositories.TimesheetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import static java.time.DayOfWeek.MONDAY;
import static java.time.DayOfWeek.SUNDAY;
import static java.time.temporal.ChronoUnit.DAYS;
import static java.time.temporal.TemporalAdjusters.nextOrSame;
import static java.time.temporal.TemporalAdjusters.previousOrSame;

@Service
public class TimesheetServiceImpl implements TimesheetService{

    private final TimesheetRepository timesheetRepository;
    private final UserServiceImpl userService;

    @Autowired
    public TimesheetServiceImpl(TimesheetRepository timesheetRepository, UserServiceImpl userService) {
        this.timesheetRepository = timesheetRepository;
        this.userService = userService;
    }

    @Override
    public List<Timesheet> getAllByDate(LocalDate date) {
        return timesheetRepository.getAllByDate(date);
    }

    @Override
    public List<Timesheet> getAllByUserId(Long userId) {
        return timesheetRepository.getAllByUserId(userId);
    }

    @Override
    public Timesheet getByUserIdAndDate(Long userId, LocalDate date) {
        return timesheetRepository.getTimesheetByUserIdAndDate(userId, date);
    }

    @Override
    public void saveTimesheet(Timesheet timesheet) {

        timesheetRepository.save(timesheet);
    }

    public List<LocalDate> currentWeekDates(LocalDate today) {

        List<LocalDate> currentWeekDates = new ArrayList<>(7);
        LocalDate currentWeekMonday = today.with(previousOrSame(MONDAY));
        LocalDate currentWeekSunday = today.with(nextOrSame(SUNDAY));

        currentWeekDates.add(currentWeekMonday);
        currentWeekDates.add(currentWeekMonday.plus(1, DAYS));
        currentWeekDates.add(currentWeekMonday.plus(2, DAYS));
        currentWeekDates.add(currentWeekMonday.plus(3, DAYS));
        currentWeekDates.add(currentWeekMonday.plus(4, DAYS));
        currentWeekDates.add(currentWeekMonday.plus(5, DAYS));
        currentWeekDates.add(currentWeekSunday);

        return currentWeekDates;
    }

    public List<Timesheet> getPersonalWeekRotaByUserId(Long userId) {
        List<Timesheet> userCurrentWeekTimesheet = new ArrayList<>();
        List<Timesheet> allCurrentWeekTimesheet = new ArrayList<>();
        for (LocalDate currentWeekDate : currentWeekDates(LocalDate.now())) {
            allCurrentWeekTimesheet.addAll(getAllByDate(currentWeekDate));
        }
        for (Timesheet timesheet : allCurrentWeekTimesheet) {
            if(timesheet.getUser().equals(userService.findUserById(userId))) {
                userCurrentWeekTimesheet.add(timesheet);
            }
        }
        return userCurrentWeekTimesheet;
    }

    public StaffWeekRota getStaffWeekRota() {
        List<User> allUsers = userService.findAllUsers();
        List<PersonalWeekRota> allPersonalWeekRotas = new ArrayList<>();
        for (User user : allUsers) {
            allPersonalWeekRotas.add(new PersonalWeekRota(user, getPersonalWeekRotaByUserId(user.getId())));
        }
        return new StaffWeekRota(allPersonalWeekRotas);
    }

}
