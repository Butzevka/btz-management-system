package com.butzevka.btzmanagementsystem.services;

import com.butzevka.btzmanagementsystem.model.Timesheet;

import java.time.LocalDate;
import java.util.List;

public interface TimesheetService {

    List<Timesheet> getAllByDate(LocalDate date);
    List<Timesheet> getAllByUserId(Long userId);
    Timesheet getByUserIdAndDate(Long userId, LocalDate date);
    void saveTimesheet(Timesheet timesheet);


}
