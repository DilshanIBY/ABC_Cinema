package utils;

import java.sql.*;

public class DatabaseReader {

    // Database URL, username, and password
    private static final String DB_URL = "jdbc:mysql://localhost:3306/abc_cinema";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "";

    // Singleton instance for the database connection
    private static Connection connection;

    public void runQuery(String query) {
        try (Connection conn = DriverManager.getConnection(DB_URL,DB_USERNAME,DB_PASSWORD);
             Statement stmt = conn.createStatement()) {

//            // Replace double quotes inside the string
//            if (query.contains("\"")) {
//                query = query.replaceAll("(?<!\\)\"", "'");
//            } else {
//                // Regex for replacing unquoted values in the query
//                String pattern = "(?<=\b(?:UPDATE|SET|DELETE|VALUES|WHERE|INSERT)\b\\s*|(?<!\\w)'?)(?<!\b(?:UPDATE|FROM|INTO)\b\\s+)(?![\\w.-]+@[\\w.-]+|\"[^\"]*\")\\b(?!(?:UPDATE|SET|DELETE|FROM|VALUES|WHERE|INSERT|INTO)\\b)(?<!\\b\\w+@\\w+\\.\\w+\\b)(?<!')\\b\\w+\\b'?(?!')(?!\\s*(?:=|'|;))";
//                query = query.replaceAll(pattern, "'$&'");
//            }

            stmt.executeUpdate(query);
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
    }

    public String lastMsg(int id) {
        String query = "SELECT last_msg FROM chatbotmessages WHERE user_id='" + id + "';";
        String msg = "";

        try (Connection conn = DriverManager.getConnection(DB_URL,DB_USERNAME,DB_PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            if (rs.next()) {
                msg = rs.getString("last_msg");
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }

        return msg;
    }

    public void updateLastMsg(int id, String msg) {
        String query = "UPDATE chatbotmessages SET last_msg='" + msg + "' WHERE user_id='" + id + "';";

        try (Connection conn = DriverManager.getConnection(DB_URL,DB_USERNAME,DB_PASSWORD);
             Statement stmt = conn.createStatement()) {

            stmt.executeUpdate(query);
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
    }

    public String allDatabase() {
        StringBuilder result = new StringBuilder();

        try (Connection conn = DriverManager.getConnection(DB_URL,DB_USERNAME,DB_PASSWORD)) {

            DatabaseMetaData metaData = conn.getMetaData();
            ResultSet tables = metaData.getTables(null, null, "%", new String[]{"TABLE"});

            while (tables.next()) {
                String tableName = tables.getString("TABLE_NAME");
                result.append("Table: ").append(tableName).append("\n");

                String query = "SELECT * FROM " + tableName;
                try (Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery(query)) {

                    ResultSetMetaData rsMeta = rs.getMetaData();
                    int columnCount = rsMeta.getColumnCount();

                    while (rs.next()) {
                        for (int i = 1; i <= columnCount; i++) {
                            result.append(rs.getString(i));
                            if (i < columnCount) result.append(", ");
                        }
                        result.append("\n");
                    }
                }
                result.append("\n");
            }

        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }

        return result.toString();
    }

    public static void main(String[] args) {
        DatabaseReader dbReader = new DatabaseReader();

        // Example usage
        dbReader.runQuery("INSERT INTO chatbotmessages (user_id, last_msg) VALUES (1, 'Hello World')");
        System.out.println("\n" + dbReader.lastMsg(1));
        dbReader.updateLastMsg(1, "Last Updated Message");
        System.out.println("\n" + dbReader.allDatabase());
    }
}
