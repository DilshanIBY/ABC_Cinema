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
                row.put(metaData.getColumnName(i), rs.getString(i));
            }
            dataList.add(row);
        }

        rs.close();
        stmt.close();
        return dataList;
    }
}
