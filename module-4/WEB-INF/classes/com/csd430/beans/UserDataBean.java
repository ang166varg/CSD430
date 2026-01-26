package com.csd430.beans;

import java.io.Serializable;

public class UserDataBean implements Serializable {

    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String favoriteTeam;
    private String comments;

    public UserDataBean() {}

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getFavoriteTeam() { return favoriteTeam; }
    public void setFavoriteTeam(String favoriteTeam) { this.favoriteTeam = favoriteTeam; }

    public String getComments() { return comments; }
    public void setComments(String comments) { this.comments = comments; }
}
