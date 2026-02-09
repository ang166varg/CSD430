package com.csd430.beans;

import java.sql.*;
import java.util.ArrayList;

public class MovieBean {

    private String dbURL = "jdbc:mysql://localhost:3306/databasedb?useSSL=false&serverTimezone=UTC";
    private String dbUser = "root";
    private String dbPassword = "root1020";

    private int movie_id;
    private String title;
    private String genre;
    private int release_year;
    private double rating;
    private String director;

    // Get all movie IDs
    public ArrayList<Integer> getMovieIDs() {
        ArrayList<Integer> ids = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            String sql = "SELECT movie_id FROM angela_movies_data";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ids.add(rs.getInt("movie_id"));
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ids;
    }

    // Get one movie by ID
    public void getMovieByID(int id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
			
			System.out.println("Connected to DB for ID: " + id);

            String sql = "SELECT * FROM angela_movies_data WHERE movie_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
				System.out.println("Row found!");
                movie_id = rs.getInt("movie_id");
                title = rs.getString("title");
                genre = rs.getString("genre");
                release_year = rs.getInt("release_year");
                rating = rs.getDouble("rating");
                director = rs.getString("director");
            }else{
				System.out.println("No row returned!");
			}

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Getters
    public int getMovie_id() { return movie_id; }
    public String getTitle() { return title; }
    public String getGenre() { return genre; }
    public int getRelease_year() { return release_year; }
    public double getRating() { return rating; }
    public String getDirector() { return director; }
}

