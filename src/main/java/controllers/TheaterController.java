package controllers;

import models.Theater;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import utils.DatabaseConnection;

public class TheaterController {

    public List<Theater> getAllTheaters() {
        List<Theater> theaters = new ArrayList<>();
                String query = "SELECT * FROM theaters";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Theater theater = new Theater();
                theater.setTheaterId(rs.getInt("theater_id"));
                theater.setName(rs.getString("name"));
                theater.setLocation(rs.getString("location"));
                theater.setSeatingCapacity(rs.getInt("seating_capacity"));
                theater.setImageUrl(rs.getString("image_url"));
                theaters.add(theater);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return theaters;
    }
}
