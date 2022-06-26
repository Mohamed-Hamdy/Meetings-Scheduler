package com.example.client.Program;

import java.sql.Date;
import java.util.List;

public class Meeting {

    private int id;
    private String name;
    private String MeetingUrl;

    private String Description;
    private Date start;
    private Date end;
    private int capacity;
    private boolean Meetingavaliablity;
    private int tinyIntTranslate;

    private int adminId;
    private int userId;

    public Meeting() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMeetingUrl() {
        return MeetingUrl;
    }

    public void setMeetingUrl(String MeetingUrl) {
        this.MeetingUrl = MeetingUrl;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public boolean isMeetingavaliablity() {
        return Meetingavaliablity;
    }

    public void setMeetingavaliablity(boolean Meetingavaliablity) {
        this.Meetingavaliablity = Meetingavaliablity;
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

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public int getUserId() {
        return userId;
    }

    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    @Override
    public String toString() {
        return "Meeting{" + "id=" + id + ", name=" + name + ", MeetingUrl=" + MeetingUrl + ", Description=" + Description + ", start=" + start + ", end=" + end + ", capacity=" + capacity + ", Meetingavaliablity=" + Meetingavaliablity + ", tinyIntTranslate=" + tinyIntTranslate + ", adminId=" + adminId + ", userId=" + userId + '}';
    }

}
