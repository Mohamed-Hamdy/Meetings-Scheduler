package com.example.client.Program;

public class User {

    protected int userId;
    protected String firstName;
    protected String lastName;
    protected String email;
    protected String username;

    protected String country;
    protected String password;
    protected String phone;

    protected String usertype;
    protected String address;


    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public boolean verifyPassword(String pass) {
        boolean success = false;
        if (pass.equals(password)) {
            success = true;
        }
        return success;
    }

    private void setPassword(String password) {
        this.password = password;
    }

    public boolean setNewPassword(String password, String newPassword) {
        boolean success = false;

        if (password.equals(password)) {
            setPassword(newPassword);
        }

        return success;
    }

    public String getPassword() {

        return password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;

    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = (phone);
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", username=" + username + ", country=" + country + ", password=" + password + ", phone=" + phone + ", usertype=" + usertype + ", address=" + address +  '}';
    }
}
