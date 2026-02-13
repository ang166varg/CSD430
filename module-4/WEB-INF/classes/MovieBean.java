package com.csd430.beans;

/*
 * Angela Vargas
 * CSD430
 * Module 5 / 6.2 Assignment
 * JavaBean used to retrieve movie records from MySQL database
 */

import java.sql.*;
import java.util.ArrayList;

public class MovieBean {

    private int movie_id;
    private String title;
    private String genre;
    private int release_year;
    private double rating;
    private String director;

    private String dbURL = "jdbc:mysql://localhost:3306/CSD430";
    private String dbUser = "root";
    private String dbPassword = "root"; // change if needed

    public int getMovie_id() { return movie_id; }
    public String getTitle() { return title; }
    public String getGenre() { return genre; }
    public int getRelease_year() { return release_year; }
    public double getRating() { return rating; }
    public String getDirector() { return director; }

    public ArrayList<Integer> getMovieIDs() {
        ArrayList<Integer> list = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT movie_id FROM angela_movies_data");

            while (rs.next()) {
                list.add(rs.getInt("movie_id"));
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void getMovieByID(int id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            PreparedStatement ps =
                conn.prepareStatement("SELECT * FROM angela_movies_data WHERE movie_id = ?");

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                movie_id = rs.getInt("movie_id");
                title = rs.getString("title");
                genre = rs.getString("genre");
                release_year = rs.getInt("release_year");
                rating = rs.getDouble("rating");
                director = rs.getString("director");
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
