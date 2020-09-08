package com.butzevka.btzmanagementsystem.model;

import java.util.List;

public class PersonalWeekRota {

    private User weekRotaPerson;
    private List<Timesheet> weekRotaTimesheetList;

    public PersonalWeekRota(User weekRotaPerson, List<Timesheet> weekRotaTimesheetList) {
        this.weekRotaPerson = weekRotaPerson;
        this.weekRotaTimesheetList = weekRotaTimesheetList;
    }

    public PersonalWeekRota() {
    }

    public User getUser() {
        return weekRotaPerson;
    }

    public void setUser(User personWeekRota) {
        this.weekRotaPerson = personWeekRota;
    }

    public List<Timesheet> getWeekRotaTimesheetList() {
        return weekRotaTimesheetList;
    }

    public void setWeekRotaTimesheetList(List<Timesheet> weekRotaTimesheetList) {
        this.weekRotaTimesheetList = weekRotaTimesheetList;
    }

}
