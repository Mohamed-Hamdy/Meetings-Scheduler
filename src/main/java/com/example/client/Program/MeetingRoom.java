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
        return "MeetingRoom{" +
                "id=" + id +
                ", meeting_id=" + meeting_id +
                ", attendee_id=" + attendee_id +
                '}';
    }

}
