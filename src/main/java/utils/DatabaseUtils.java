package utils;

import java.sql.*;
import java.util.*;

public class DatabaseUtils {

    // Utility method to fetch table data
    public static List<Map<String, String>> fetchTableData(Connection conn, String query) throws SQLException {
        List<Map<String, String>> dataList = new ArrayList<>();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        ResultSetMetaData metaData = rs.getMetaData();
        int columnCount = metaData.getColumnCount();

        while (rs.next()) {
            Map<String, String> row = new HashMap<>();
            for (int i = 1; i <= columnCount; i++) {
                // Use getColumnLabel instead of getColumnName to respect aliases
                row.put(metaData.getColumnLabel(i), rs.getString(i));
            }
            dataList.add(row);
        }

        rs.close();
        stmt.close();
        return dataList;
    }
}
