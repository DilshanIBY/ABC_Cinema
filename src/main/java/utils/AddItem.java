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

@WebServlet("/addItem")
public class AddItem extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection conn = DatabaseConnection.getConnection();
            
            String tableName = request.getParameter("tableName");
            String sql = "";
            
            try {
                if ("menu".equals(tableName)) {
                    sql = "INSERT INTO menu (Name, Type, Ingredients, Price, Image) VALUES (?, ?, ?, ?, ?)";
                    executeInsert(conn, sql, request.getParameter("name"), request.getParameter("type"),
                            request.getParameter("ingredients"), safePrice(request.getParameter("price")),
                            checkDefaultImage(request.getParameter("image")));
                    
                } else if ("chefs".equals(tableName)) {
                    sql = "INSERT INTO chefs (Name, Occupation, Image, Twitter, Facebook, Instagram, LinkedIn) VALUES (?, ?, ?, ?, ?, ?, ?)";
                    executeInsert(conn, sql, request.getParameter("name"), request.getParameter("occupation"),
                            checkDefaultImage(request.getParameter("image")), request.getParameter("twitter"),
                            request.getParameter("facebook"), request.getParameter("instagram"),
                            request.getParameter("linkedin"));
                    
                } else if ("whyus".equals(tableName)) {
                    sql = "INSERT INTO whyus (Title, Description) VALUES (?, ?)";
                    executeInsert(conn, sql, request.getParameter("title"), escapeSql(request.getParameter("description")));
                    
                } else if ("specials".equals(tableName)) {
                    sql = "INSERT INTO specials (Name, Title, Hint, Description, Image) VALUES (?, ?, ?, ?, ?)";
                    executeInsert(conn, sql, request.getParameter("name"), request.getParameter("title"),
                            escapeSql(request.getParameter("hint")), escapeSql(request.getParameter("description")),
                            checkDefaultImage(request.getParameter("image")));
                    
                } else if ("events".equals(tableName)) {
                    sql = "INSERT INTO events (Name, Price, Top_Desc, Points, Bottom_Desc, Image) VALUES (?, ?, ?, ?, ?, ?)";
                    executeInsert(conn, sql, request.getParameter("name"), safePrice(request.getParameter("price")),
                            escapeSql(request.getParameter("topDesc")), escapeSql(request.getParameter("points")),
                            escapeSql(request.getParameter("bottomDesc")), checkDefaultImage(request.getParameter("image")));
                    
                } else if ("testimonials".equals(tableName)) {
                    sql = "INSERT INTO testimonials (Name, Occupation, Quote, Image) VALUES (?, ?, ?, ?)";
                    executeInsert(conn, sql, request.getParameter("name"), request.getParameter("occupation"),
                            escapeSql(request.getParameter("quote")), checkDefaultImage(request.getParameter("image")));
                    
                } else if ("gallery".equals(tableName)) {
                    String image = request.getParameter("image");
                    if (!image.isEmpty()) {
                        sql = "INSERT INTO gallery (Image) VALUES (?)";
                        executeInsert(conn, sql, checkDefaultImage(image));
                        response.getWriter().println("New gallery item added successfully");
                        return;
                    } else {
                        response.getWriter().println("New gallery item is empty");
                        return;
                    }
                }
                
                response.getWriter().println("New item added successfully");
            } catch (SQLException e) {
                response.getWriter().println("Error adding new item: " + e.getMessage());
            } finally {
                try {
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    System.out.print("Error: "+e.getMessage());
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddItem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void executeInsert(Connection conn, String sql, Object... params) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            for (int i = 0; i < params.length; i++) {
                stmt.setObject(i + 1, params[i]);
            }
            stmt.executeUpdate();
        }
    }

    private String checkDefaultImage(String image) {
        return (image == null || image.isEmpty()) ? "default.jpg" : image;
    }

    private String escapeSql(String input) {
        return input.replace("'", "''");
    }

    private String safePrice(String price) {
        return (price == null || price.isEmpty()) ? "0" : price;
    }
} 
