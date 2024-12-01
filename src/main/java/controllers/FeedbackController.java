package controllers;

import models.Feedback;
import utils.ResponseUtils;

import java.util.List;

public class FeedbackController {

    // Simulate a database for Feedback entries
    private static List<Feedback> feedbackList = Feedback.getAllFeedbacks();

    // API to fetch all feedback
    public static String getAllFeedback() {
        return ResponseUtils.success(feedbackList);
    }

    // API to add a new feedback entry
    public static String addFeedback(Feedback feedback) {
        feedbackList.add(feedback);
        return ResponseUtils.successMessage("Feedback submitted successfully!");
    }

    // API to delete a feedback entry
    public static String deleteFeedback(int id) {
        feedbackList.removeIf(feedback -> feedback.getId() == id);
        return ResponseUtils.successMessage("Feedback entry deleted successfully!");
    }
}
