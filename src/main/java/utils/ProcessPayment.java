package utils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import controllers.PaymentController;

@WebServlet("/ProcessPayment")
public class ProcessPayment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reservationId = request.getParameter("reservationId");
        String userId = request.getParameter("userId");
        String movieId = request.getParameter("movieId");
        String theaterId = request.getParameter("theaterId");
        String seatNumbers = request.getParameter("seatNumbers");
        double amount = Double.parseDouble(request.getParameter("amount"));

        try (Connection conn = DatabaseConnection.getConnection()) {
            // Insert into reservations table
            String reservationQuery = "INSERT INTO reservations (reservation_id, user_id, movie_id, theater_id, reservation_date, seat_numbers, total_price, created_at) VALUES (?, ?, ?, ?, NOW(), ?, ?, NOW())";
            try (PreparedStatement pstmt = conn.prepareStatement(reservationQuery)) {
                pstmt.setString(1, reservationId);
                pstmt.setString(2, userId);
                pstmt.setString(3, movieId);
                pstmt.setString(4, theaterId);
                pstmt.setString(5, seatNumbers);
                pstmt.setDouble(6, amount);
                pstmt.executeUpdate();
            }

            // Create Payment with PayPal and get PayPal Payment ID
            PaymentController paymentController = new PaymentController();
            String approvalUrl = paymentController.createPayment(reservationId, amount);
            if (approvalUrl != null) {
                // PayPal provides a payment ID, store it in the payments table
                String paypalPaymentId = paymentController.getPayPalPaymentId(); // Get the actual PayPal payment ID

                // Insert into payments table with PayPal payment ID and status "Pending"
                String paymentQuery = "INSERT INTO payments (payment_id, reservation_id, amount, payment_method, payment_status, created_at) VALUES (?, ?, ?, ?, ?, NOW())";
                try (PreparedStatement pstmt = conn.prepareStatement(paymentQuery)) {
                    pstmt.setString(1, paypalPaymentId); // Use PayPal payment ID
                    pstmt.setString(2, reservationId);
                    pstmt.setDouble(3, amount);
                    pstmt.setString(4, "PayPal");
                    pstmt.setString(5, "Pending");
                    pstmt.executeUpdate();
                }

                response.sendRedirect(approvalUrl); // Redirect to PayPal approval page
            } else {
                response.getWriter().write("Error creating PayPal payment.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Database error occurred: " + e.getMessage());
            return;
        }
    }
}
