package models;
import utils.DatabaseConnection;

import jakarta.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/subscribe")
public class Subscribe extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String currentUrl = request.getParameter("current_url");
        String message;

        if (email == null || email.isEmpty()) {
            message = "Email cannot be empty.";
            response.sendRedirect(currentUrl + "?message=" + message);
            return;
        }

        try {

            // Connect to the database
            Connection connection = DatabaseConnection.getConnection();

            // Insert email into the newsletter table
            String sql = "INSERT INTO subscribers (email) VALUES (?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);

            int rows = preparedStatement.executeUpdate();
            if (rows > 0) {
                message = "Subscription successful!";
            } else {
                message = "Failed to subscribe. Try again.";
            }

            // Close resources
            preparedStatement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            message = "An error occurred. Please try again later.";
        }

        // Redirect back with a message
        response.sendRedirect(currentUrl + "?message=" + message);
    }
}
