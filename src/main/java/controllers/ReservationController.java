/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author User
 */
public class ReservationController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
        String jdbcURL = "jdbc:mysql://localhost:3306/ABC_CINEMA";
        String dbUser = "root";
        String dbPassword = "";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReservationController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReservationController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        Connection connection = null;
        Statement statement = null;
        
        String[] selectedseats = request.getParameterValues("seats");
        String moviedate = request.getParameter("moviedate");
        String movietime = request.getParameter("movietime");
        
        HttpSession session = (HttpSession) request.getSession();
        String username = (String)session.getAttribute("Username");
        String email = (String)session.getAttribute("Email");
        String movie = (String)session.getAttribute("Movie");
        
        response.setContentType("text/html");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            statement = connection.createStatement();


            
            String tableName = "seats_" + movie + "_" + moviedate + "_" + movietime;  

            
            String createTableSQL = "CREATE TABLE IF NOT EXISTS" + tableName + " ("
                                  + "id INT AUTO_INCREMENT PRIMARY KEY, "
                                  + "seat_code VARCHAR(10) NOT NULL, "
                                  + "status VARCHAR(10) DEFAULT 'available'"
                                  + ")";
            statement.executeUpdate(createTableSQL);
            response.getWriter().println("<h1>Table '" + tableName + "' created successfully.</h1>");

            String checkSQL = "SELECT COUNT(*) FROM " + tableName + " WHERE seat_code = ?";
            String insertSQL = "INSERT INTO " + tableName + " (seat_code) VALUES (?)";
            PreparedStatement pstmt = connection.prepareStatement(insertSQL);
            PreparedStatement cpstmt = connection.prepareStatement(checkSQL);
            for (int i = 1; i <= 60; i++) {
            String seatCode = "S" + (i + 2); 

       
            cpstmt.setString(1, seatCode);
            ResultSet rs = cpstmt.executeQuery(); 
        
            if (rs.next() && rs.getInt(1) == 0) {  
                pstmt.setString(1, seatCode);
                pstmt.executeUpdate();
                System.out.println("Inserted: " + seatCode);
            } else {
                System.out.println("Skipped (already exists): " + seatCode);
            }
        }  
        
           
            
            String resetSql = "UPDATE seats SET status = 'not-booked' WHERE status != 'booked'";
            connection.createStatement().executeUpdate(resetSql);

            if (selectedseats != null) {
                // Update selected seats to "booked"
                String sql = "UPDATE seats SET status = 'booked' WHERE seat_code = ?";
                PreparedStatement ps = connection.prepareStatement(sql);

                for (String seat : selectedseats) {
                    ps.setString(1, seat);
                    ps.addBatch();
                }
                ps.executeBatch();
            }
                String clientsql = "INSERT INTO ClientData(username, email, moviedate, movietime, seats) VALUES(" + username + "," + email + "," + moviedate + "," + movietime + "," + Arrays.toString(selectedseats) + " ) ";     
                PreparedStatement psmt = connection.prepareStatement(clientsql);
                psmt.setString(1, moviedate);  
                psmt.setString(2, movietime);  
                psmt.setString(3, String.join(",", selectedseats)); 
                psmt.setString(4, username);
                psmt.setString(5, email);
                psmt.executeQuery();
   

        }catch(Exception e){  
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } 
        
        request.setAttribute("selectedseats", selectedseats);
        request.setAttribute("movietime", movietime);
        request.setAttribute("moviedate", moviedate);
        
        RequestDispatcher dispatcher = (RequestDispatcher) request.getRequestDispatcher("reservation.jsp");
        //dispatcher.forward(request, response);
        
    }


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
