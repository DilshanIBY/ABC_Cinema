package utils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input (additional validation can be added as required)
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Email and password are required.");
            request.getRequestDispatcher("login-register.jsp").forward(request, response);
            return;
        }

        // Authenticate user
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT user_id, name, phone, email, profile_photo FROM users WHERE email = ? AND password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email);
                stmt.setString(2, password); // Ideally, passwords should be hashed and verified
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        // User authenticated successfully
                        HttpSession session = request.getSession();
                        session.setAttribute("userId", rs.getInt("user_id"));
                        session.setAttribute("userName", rs.getString("name"));
                        session.setAttribute("userPhone", rs.getString("phone"));
                        session.setAttribute("userEmail", rs.getString("email"));
                        session.setAttribute("userPhoto", rs.getString("profile_photo"));                

                        response.sendRedirect("index.jsp"); // Redirect to the home page
                        


                    } else {
                        // Invalid credentials
                        request.setAttribute("error", "Invalid email or password.");
                        request.getRequestDispatcher("login-register.jsp").forward(request, response);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while processing your request.");
            request.getRequestDispatcher("login-register.jsp").forward(request, response);
        }
    }
}
