package utils;
import java.sql.Connection;
import java.sql.SQLException;

public class TestConnection {
    public static void main(String[] args) {
        try {
            // Test the connection
            Connection conn = DatabaseConnection.getConnection();
            if (conn != null) {
                System.out.println("Connection successful!");
            }
            // Close the connection
            DatabaseConnection.closeConnection();
        } catch (SQLException e) {
            System.out.print("Error: "+e.getMessage());
        }
    }
}


