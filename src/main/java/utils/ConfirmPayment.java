package utils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import controllers.PaymentController;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.ResultSet;

@WebServlet("/ConfirmPayment")
public class ConfirmPayment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");

        // Execute Payment
        PaymentController paymentController = new PaymentController();
        String paymentStatus = paymentController.executePayment(paymentId, payerId);

        // Debugging
        System.out.println("Payment status from PayPal: " + paymentStatus);

        // Update payment status in the database
        try (Connection conn = DatabaseConnection.getConnection()) {
            String updateQuery = "UPDATE payments SET payment_status = ? WHERE payment_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(updateQuery)) {
                pstmt.setString(1, paymentStatus); // Use the PayPal payment status here (approved, completed, etc.)
                pstmt.setString(2, paymentId);
                pstmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Database error occurred: " + e.getMessage());
            return;
        }

        // Redirect based on payment status
        if ("approved".equalsIgnoreCase(paymentStatus) || "completed".equalsIgnoreCase(paymentStatus)) {
            
            // SEND THE E-MAIL NOTIFICATION
            // Email details
            String recipientEmail = getRecipientEmail(paymentId);
            if (recipientEmail == null || recipientEmail.isEmpty()) {
                response.getWriter().write("Error: Unable to retrieve recipient email.");
                return;
            }
            String subject = "Booking Confirmation - ABC Cinema";
            String messageContent = "Dear Customer,\n\nYour booking has been successfully confirmed. Thank you for choosing ABC Cinema!\n\nBest regards,\nABC Cinema Team";

            // Send email by calling EmailSenderServlet
            try {
                URL url = new URL("http://localhost:8080/ABC_Cinema_Reservation/SendEmail");
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("POST");
                conn.setDoOutput(true);
                conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

                // Email parameters
                String urlParameters = "recipientEmail=" + URLEncoder.encode(recipientEmail, "UTF-8")
                        + "&subject=" + URLEncoder.encode(subject, "UTF-8")
                        + "&messageContent=" + URLEncoder.encode(messageContent, "UTF-8");

                // Write parameters
                try (OutputStream os = conn.getOutputStream()) {
                    byte[] input = urlParameters.getBytes("utf-8");
                    os.write(input, 0, input.length);
                }

                // Check response
                int responseCode = conn.getResponseCode();
                if (responseCode == HttpURLConnection.HTTP_OK) {
                    System.out.println("Email sent successfully.");
                } else {
                    System.out.println("Failed to send email.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Error occurred while sending email: " + e.getMessage());
            }
            
            response.sendRedirect("http://localhost:8080/ABC_Cinema_Reservation/profile.jsp");
            
        } else {
            
            response.sendRedirect("http://localhost:8080/ABC_Cinema_Reservation/error.jsp");
            
        }
    }
    
    private String getRecipientEmail(String paymentId) {
        String email = null;
        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "SELECT users.email FROM users INNER JOIN reservations ON users.user_id = reservations.user_id INNER JOIN payments ON reservations.reservation_id = payments.reservation_id WHERE payments.payment_id = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(query)) {
                pstmt.setString(1, paymentId);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        email = rs.getString("email");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return email; // Returns null if no email is found
    }
}
