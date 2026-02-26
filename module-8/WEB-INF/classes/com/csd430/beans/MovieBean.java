package com.csd430.beans;

/*
 * Angela Vargas
 * CSD430
 * Project Part 3
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

    // Constructor: connects one time when bean is created
    public MovieBean() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = DriverManager.getConnection(url, username, password);
        System.out.println("MovieBean LOADED - MODULE 8 VERSION - " + System.currentTimeMillis());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ---------------------------
    // INSERT METHOD
    // ---------------------------
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

    // ---------------------------
    // DELETE METHOD
    // ---------------------------
    public void deleteMovie(int movieId) {
        try {
            String sql = "DELETE FROM databasedb.angela_movies_data WHERE movie_id = ?";
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

    // ---------------------------
    // SELECT ALL METHOD
    // ---------------------------
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

    // =========================================================
    // PROJECT PART 3 METHODS (UPDATE WORKFLOW)
    // =========================================================

    /**
     * Gets a list of all primary key values (movie_id) for the dropdown menu.
     * @return ArrayList of movie_id values
     */
    public ArrayList<Integer> getMovieIDs() {
        ArrayList<Integer> ids = new ArrayList<>();

        try {
            String sql = "SELECT movie_id FROM databasedb.angela_movies_data ORDER BY movie_id";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                ids.add(rs.getInt("movie_id"));
            }

            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ids;
    }

    /**
     * Returns one movie record by movie_id.
     * Array order matches getAllMovies():
     * [0]=movie_id [1]=title [2]=genre [3]=release_year [4]=rating [5]=director
     */
    public String[] getMovieById(int movieId) {
        String[] movie = null;

        try {
            String sql = "SELECT * FROM databasedb.angela_movies_data WHERE movie_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, movieId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                movie = new String[6];
                movie[0] = rs.getString("movie_id");
                movie[1] = rs.getString("title");
                movie[2] = rs.getString("genre");
                movie[3] = rs.getString("release_year");
                movie[4] = rs.getString("rating");
                movie[5] = rs.getString("director");
            }

            rs.close();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return movie;
    }

    /**
     * Updates an existing movie record (movie_id is NOT editable).
     * @return true if at least one row was updated
     */
    public boolean updateMovie(int movieId, String title, String genre, int releaseYear, double rating, String director) {
        try {
            String sql =
                "UPDATE databasedb.angela_movies_data " +
                "SET title = ?, genre = ?, release_year = ?, rating = ?, director = ? " +
                "WHERE movie_id = ?";

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, title);
            ps.setString(2, genre);
            ps.setInt(3, releaseYear);
            ps.setDouble(4, rating);
            ps.setString(5, director);
            ps.setInt(6, movieId);

            int rows = ps.executeUpdate();
            ps.close();

            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}

