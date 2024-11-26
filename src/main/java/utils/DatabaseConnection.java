package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    // Database URL, username, and password
    private static final String DB_URL = "jdbc:mysql://localhost:3306/abc_cinema";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "";

    // Singleton instance for the database connection
    private static Connection connection;

    /**
     * Private constructor to prevent instantiation
     */
    private DatabaseConnection() { }

    /**
     * Get a connection to the database.
     * 
     * @return Connection object
     * @throws SQLException if there is an error connecting to the database
     */
    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                // Establish the connection
                connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
                System.out.println("Database connection established.");
            } catch (ClassNotFoundException e) {
                System.err.println("MySQL JDBC Driver not found.");
                throw new SQLException("Unable to load JDBC Driver", e);
            } catch (SQLException e) {
                System.err.println("Unable to establish database connection.");
                throw e;
            }
        }
        return connection;
    }

    /**
     * Close the connection if it is open.
     */
    public static void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Database connection closed.");
            } catch (SQLException e) {
                System.err.println("Error closing database connection.");
            }
        }
    }
}
