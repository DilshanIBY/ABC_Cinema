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
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/deleteItem")
public class DeleteItem extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = DatabaseConnection.getConnection();
            
            String itemId = request.getParameter("item_id");
            String itemName = request.getParameter("item_name");
            String tableName = request.getParameter("table_name");
            
            if (itemId == null || tableName == null || itemId.isEmpty() || tableName.isEmpty()) {
                response.getWriter().println("Invalid input parameters.");
                return;
            }
            
            String sql = "DELETE FROM " + tableName + " WHERE " + itemName + " = ?";
            
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, itemId);
                int rowsAffected = stmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    response.getWriter().println("Item deleted successfully.");
                } else {
                    response.getWriter().println("No item found with the provided ID.");
                }
            } catch (SQLException e) {
                response.getWriter().println("Error deleting item: " + e.getMessage());
            } finally {
                try {
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    System.out.print("Error: "+e.getMessage());
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DeleteItem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
} 
