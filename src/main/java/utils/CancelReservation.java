package utils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CancelReservation")
public class CancelReservation extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve reservation ID from the request
        String reservationId = request.getParameter("reservationId");
        response.setContentType("text/plain");

        if (reservationId != null) {
            Connection conn = null;
            PreparedStatement stmt = null;

            try {
                conn = DatabaseConnection.getConnection();
                // SQL query to delete the reservation
                String query = "DELETE FROM reservations WHERE reservation_id = ?";
                stmt = conn.prepareStatement(query);
                stmt.setInt(1, Integer.parseInt(reservationId));
                int rows = stmt.executeUpdate();

                if (rows > 0) {
                    response.getWriter().write("Reservation canceled successfully!");
                } else {
                    response.getWriter().write("Failed to cancel reservation.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().write("Database error: " + e.getMessage());
            } catch (NumberFormatException e) {
                response.getWriter().write("Invalid reservation ID.");
            } finally {
                try {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            response.getWriter().write("Invalid request!");
        }
    }
}
