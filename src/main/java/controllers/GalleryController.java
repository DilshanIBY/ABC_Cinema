package controllers;

import models.Gallery;
import utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GalleryController {
    /**
     * Fetch all gallery items from the database.
     * 
     * @return List of Gallery objects
     */
    public List<Gallery> getAllGalleryItems() {
        List<Gallery> galleryItems = new ArrayList<>();
        String query = "SELECT * FROM gallery";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Gallery item = new Gallery();
                item.setId(rs.getInt("id"));
                item.setImage(rs.getString("image"));
                galleryItems.add(item);
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
        return galleryItems;
    }
}
