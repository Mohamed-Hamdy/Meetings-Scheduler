package com.example.client.Program;

import java.sql.Date;
import java.util.List;

public class Meeting {

    private int id;
    private String Timezone;
    private String Date;

    private String Capacity;
    private String Time;
    private String Repeat;
    private String Description;
    private String meetingtype;
    private boolean Meetingavaliablity;
    private int tinyIntTranslate;

    private String Title;

    private String MeetingUrl;
    private String Duration;


    private int adminId;
    private String userId;

    public Meeting() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMeetingtype() {
        return meetingtype;
    }

    public void setMeetingtype(String meetingtype) {
        this.meetingtype = meetingtype;
    }

    public String getTimezone() {
        return Timezone;
    }

    public void setTimezone(String timezone) {
        Timezone = timezone;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public String getTime() {
        return Time;
    }

    public void setTime(String time) {
        Time = time;
    }

    public String getRepeat() {
        return Repeat;
    }

    public void setRepeat(String repeat) {
        Repeat = repeat;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getMeetingUrl() {
        return MeetingUrl;
    }

    public String getCapacity() {
        return Capacity;
    }

    public void setCapacity(String capacity) {
        Capacity = capacity;
    }

    public void setMeetingUrl(String meetingUrl) {
        MeetingUrl = meetingUrl;
    }

    public String getDuration() {
        return Duration;
    }

    public void setDuration(String duration) {
        Duration = duration;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public boolean isMeetingavaliablity() {
        return Meetingavaliablity;
    }

    public void setMeetingavaliablity(boolean Meetingavaliablity) {
        this.Meetingavaliablity = Meetingavaliablity;
    }

    @Override
    public String toString() {
        return "Meeting{" +
                "id=" + id +
                ", Timezone='" + Timezone + '\'' +
                ", Date=" + Date +
                ", Time='" + Time + '\'' +
                ", Repeat='" + Repeat + '\'' +
                ", Description='" + Description + '\'' +
                ", meetingtype='" + meetingtype + '\'' +
                ", Meetingavaliablity=" + Meetingavaliablity +
                ", Title='" + Title + '\'' +
                ", MeetingUrl='" + MeetingUrl + '\'' +
                ", Duration=" + Duration +
                ", adminId=" + adminId +
                ", userId=" + userId +
                '}';
    }

    public int getmeetingTinyIntTranslate() {
        int temp;
        if (this.Meetingavaliablity) {
            temp = 1;
        } else {
            temp = 0;

        }
        return temp;
    }

    public void setmeetingTinyIntToIsAvailable(int tinyIntTranslate) {
        this.tinyIntTranslate = tinyIntTranslate;
        if (tinyIntTranslate == 1) {
            this.Meetingavaliablity = true;
        } else if (tinyIntTranslate == 0) {
            this.Meetingavaliablity = false;
        }
    }

}
