package com.example.client.Program;

public class Guest extends User {

    public Guest() {
    }

    public Guest(String uname, String pass) {
        super();
        this.username = uname;
        this.password = pass;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", username=" + username + ", country=" + country + ", password=" + password + ", phone=" + phone + ", usertype=" + usertype + ", address=" + address +  '}';
    }

}
