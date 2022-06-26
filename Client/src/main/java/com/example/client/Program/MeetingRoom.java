/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.client.Program;

/**
 *
 * @author Mohamed Hamdy
 */
public class MeetingRoom {

    private int id;
    private String name;
    private String type;
    private int Durationinmintes;
    private boolean Roomavaliablity;

    private int tinyIntTranslate;
    private int meeting_id;
    private int attendee_id;

    public int getId() {
        return id;
    }

    public MeetingRoom() {
        super();
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getDurationinmintes() {
        return Durationinmintes;
    }

    public void setDurationinmintes(int Durationinmintes) {
        this.Durationinmintes = Durationinmintes;
    }

    public boolean isIsavaliable() {
        return Roomavaliablity;
    }

    public void setIsavaliable(boolean isavaliable) {
        this.Roomavaliablity = isavaliable;
    }

    public int getRoomTinyIntTranslate() {
        int temp;
        if (this.Roomavaliablity) {
            temp = 1;
        } else {
            temp = 0;

        }
        return temp;
    }

    public void setRoomTinyIntToIsAvailable(int tinyIntTranslate) {
        this.tinyIntTranslate = tinyIntTranslate;
        if (tinyIntTranslate == 1) {
            this.Roomavaliablity = true;
        } else if (tinyIntTranslate == 0) {
            this.Roomavaliablity = false;
        }
    }

    public int getMeeting_id() {
        return meeting_id;
    }

    public void setMeeting_id(int meeting_id) {
        this.meeting_id = meeting_id;
    }

    public int getAttendee_id() {
        return attendee_id;
    }

    public void setAttendee_id(int attendee_id) {
        this.attendee_id = attendee_id;
    }

    @Override
    public String toString() {
        return "MeetingRoom{" + "id=" + id + ", name=" + name + ", type=" + type + ", Durationinmintes=" + Durationinmintes + ", Roomavaliablity=" + Roomavaliablity + ", meeting_id=" + meeting_id + ", attendee_id=" + attendee_id + '}';
    }


}
