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

@WebServlet("/updateItem")
public class UpdateItem extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tableName = request.getParameter("tableName");
        String sql = "";

        try (Connection conn = DatabaseConnection.getConnection()) {
            if ("menu".equalsIgnoreCase(tableName)) {
                sql = "UPDATE menu SET Name=?, Type=?, Ingredients=?, Price=?, Image=? WHERE Id=?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, request.getParameter("name"));
                    stmt.setString(2, request.getParameter("type"));
                    stmt.setString(3, request.getParameter("ingredients"));
                    stmt.setString(4, request.getParameter("price"));
                    stmt.setString(5, request.getParameter("image"));
                    stmt.setInt(6, Integer.parseInt(request.getParameter("item_id")));
                    executeUpdate(stmt, response);
                }
            } else if ("chefs".equalsIgnoreCase(tableName)) {
                sql = "UPDATE chefs SET Name=?, Occupation=?, Image=?, Twitter=?, Facebook=?, Instagram=?, LinkedIn=? WHERE Id=?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, request.getParameter("name"));
                    stmt.setString(2, request.getParameter("occupation"));
                    stmt.setString(3, request.getParameter("image"));
                    stmt.setString(4, request.getParameter("twitter"));
                    stmt.setString(5, request.getParameter("facebook"));
                    stmt.setString(6, request.getParameter("instagram"));
                    stmt.setString(7, request.getParameter("linkedin"));
                    stmt.setInt(8, Integer.parseInt(request.getParameter("item_id")));
                    executeUpdate(stmt, response);
                }
            } else if ("whyus".equalsIgnoreCase(tableName)) {
                sql = "UPDATE whyus SET Title=?, Description=? WHERE Id=?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, request.getParameter("title"));
                    stmt.setString(2, request.getParameter("description"));
                    stmt.setInt(3, Integer.parseInt(request.getParameter("item_id")));
                    executeUpdate(stmt, response);
                }
            } // Add other table conditions here following the same structure
            
        } catch (SQLException e) {
            response.getWriter().write("Error updating item: " + e.getMessage());
        }
    }

    private void executeUpdate(PreparedStatement stmt, HttpServletResponse response) throws SQLException, IOException {
        int rowsAffected = stmt.executeUpdate();
        if (rowsAffected > 0) {
            response.getWriter().write("Item updated successfully");
        } else {
            response.getWriter().write("No item was updated");
        }
    }

}
