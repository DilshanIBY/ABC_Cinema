package utils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import jakarta.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // Validate input (additional validation can be added as required)
        if (name == null || email == null || phone == null || password == null || name.isEmpty() || email.isEmpty() | phone.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("login-register.jsp").forward(request, response);
            return;
        }

        // Get the latest user_id from the database
        int newUserId = getNextUserId();

        // Save the user to the database
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO users (user_id, name, email, phone, password, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, newUserId);
                stmt.setString(2, name);
                stmt.setString(3, email);
                stmt.setString(4, phone);
                stmt.setString(5, password); // Ideally, hash the password before saving
                stmt.setObject(6, LocalDateTime.now());
                stmt.setObject(7, LocalDateTime.now());

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    request.setAttribute("success", "Account created successfully! Please log in.");
                    request.getRequestDispatcher("login-register.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Failed to create account. Please try again later.");
                    request.getRequestDispatcher("login-register.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while processing your request." + e.getMessage());
            request.getRequestDispatcher("login-register.jsp").forward(request, response);
        }
    }

    private int getNextUserId() {
        int nextUserId = 1; // Default to 1 if no users exist yet

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT MAX(user_id) FROM users";
            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    nextUserId = rs.getInt(1) + 1; // Increment the highest user_id found
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the error, or handle it as needed
        }

        return nextUserId;
    }
}
