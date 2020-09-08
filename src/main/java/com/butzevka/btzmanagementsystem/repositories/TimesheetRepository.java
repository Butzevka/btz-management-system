package com.butzevka.btzmanagementsystem.repositories;

import com.butzevka.btzmanagementsystem.model.Timesheet;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface TimesheetRepository extends JpaRepository<Timesheet, Long> {

    List<Timesheet> getAllByDate(LocalDate date);
    List<Timesheet> getAllByUserId(Long userId);
    Timesheet getTimesheetByUserIdAndDate(Long userId, LocalDate date);

}
