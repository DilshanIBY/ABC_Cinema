package controllers;

import models.Movie;
import utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MovieController {
    /**
     * Fetch all movies from the database.
     * 
     * @return List of Movie objects
     */
    public List<Movie> getAllMovies() {
        List<Movie> movies = new ArrayList<>();
        String query = "SELECT * FROM movies";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Movie movie = new Movie();
                movie.setMovieId(rs.getInt("movie_id"));
                movie.setTitle(rs.getString("title"));
                movie.setDescription(rs.getString("description"));
                movie.setTrailerUrl(rs.getString("trailer_url"));
                movie.setPosterUrl(rs.getString("poster_url"));
                movie.setStatus(rs.getString("status"));
                movie.setReleaseDate(rs.getDate("release_date"));
                movie.setDuration(rs.getInt("duration"));
                movie.setCreatedAt(rs.getTimestamp("created_at"));
                movies.add(movie);
            }
        } catch (Exception e) {
            System.out.print("Error: "+e.getMessage());
        }
        return movies;
    }
}
