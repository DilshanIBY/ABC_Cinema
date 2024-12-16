package controllers;

import models.Testimonial;
import utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TestimonialController {

    /**
     * Fetch all testimonials from the database.
     * 
     * @return List of Testimonial objects
     */
    public List<Testimonial> getAllTestimonials() {
        List<Testimonial> testimonials = new ArrayList<>();
        String query = "SELECT * FROM testimonials";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Testimonial testimonial = new Testimonial();
                testimonial.setId(rs.getInt("id"));
                testimonial.setName(rs.getString("name"));
                testimonial.setOccupation(rs.getString("occupation"));
                testimonial.setQuote(rs.getString("quote"));
                testimonial.setImage(rs.getString("image"));
                testimonials.add(testimonial);
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return testimonials;
    }
}
