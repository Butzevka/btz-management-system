package com.butzevka.btzmanagementsystem.model;

import java.util.List;

public class StaffWeekRota {

    List<PersonalWeekRota> staffWeekRota;

    public StaffWeekRota() {
    }

    public StaffWeekRota(List<PersonalWeekRota> staffWeekRota) {
        this.staffWeekRota = staffWeekRota;
    }

    public List<PersonalWeekRota> getWeekRota() {
        return staffWeekRota;
    }

    public void setWeekRota(List<PersonalWeekRota> staffWeekRota) {
        this.staffWeekRota = staffWeekRota;
    }
}
