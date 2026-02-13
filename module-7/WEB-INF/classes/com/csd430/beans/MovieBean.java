package com.csd430.beans;

/*
 * Angela Vargas
 * CSD430
 * Project Part 2
 * MovieBean handles all database operations for movie records.
 */

import java.sql.*;
import java.util.ArrayList;

public class MovieBean {

    private Connection connection;

    // Database credentials
    private String url = "jdbc:mysql://localhost:3306/databasedb?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private String username = "root";
    private String password = "root1020"; 

    // Constructor
    public MovieBean() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
			System.out.println("Connected to database successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // INSERT METHOD
    public void addMovie(String title, String genre, int releaseYear, double rating, String director) {
        try {
            String sql = "INSERT INTO databasedb.angela_movies_data (title, genre, release_year, rating, director) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, title);
            ps.setString(2, genre);
            ps.setInt(3, releaseYear);
            ps.setDouble(4, rating);
            ps.setString(5, director);

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	public void deleteMovie(int movieId) {
    try {
        String sql = "DELETE FROM angela_movies_data WHERE movie_id = ?";
        PreparedStatement ps = connection.prepareStatement(sql);

        ps.setInt(1, movieId);

        int rows = ps.executeUpdate();
        System.out.println("Rows deleted: " + rows);

        ps.close();
    } catch (Exception e) {
        System.out.println("DELETE FAILED:");
        e.printStackTrace();
    }
}

    // SELECT ALL METHOD
    public ArrayList<String[]> getAllMovies() {
        ArrayList<String[]> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM databasedb.angela_movies_data";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                String[] movie = new String[6];
                movie[0] = rs.getString("movie_id");
                movie[1] = rs.getString("title");
                movie[2] = rs.getString("genre");
                movie[3] = rs.getString("release_year");
                movie[4] = rs.getString("rating");
                movie[5] = rs.getString("director");

                list.add(movie);
            }	

            rs.close();
            stmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}


