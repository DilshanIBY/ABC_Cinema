package models;

import java.util.ArrayList;
import java.util.List;

public class Feedback {
    private int id;
    private String user;
    private String comment;
    private int rating;

    private static List<Feedback> feedbackEntries = new ArrayList<>();

    public Feedback(int id, String user, String comment, int rating) {
        this.id = id;
        this.user = user;
        this.comment = comment;
        this.rating = rating;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    // Simulate fetching data from a database
    public static List<Feedback> getAllFeedbacks() {
        // Sample data
        feedbackEntries.add(new Feedback(1, "Alice", "Great service!", 5));
        feedbackEntries.add(new Feedback(2, "Bob", "Could be better.", 3));
        return feedbackEntries;
    }
}
