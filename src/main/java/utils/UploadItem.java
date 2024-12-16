package utils;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadItem")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class UploadItem extends HttpServlet {

    private static final String UPLOAD_DIR = "assets/img/upload";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve parameters from the request
        String itemId = request.getParameter("itemId");
        String tableName = request.getParameter("tableName");
        String fieldName = request.getParameter("fieldName");

        // Validate required parameters
        if (itemId == null || tableName == null || itemId.isEmpty() || tableName.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameters.");
            return;
        }

        // Get the upload directory path
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;

        // Create the upload directory if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String fileName = null;

        // Process the uploaded file
        for (jakarta.servlet.http.Part part : request.getParts()) {
            String contentDisposition = part.getHeader("content-disposition");
            if (contentDisposition != null && contentDisposition.contains("filename")) {
                fileName = extractFileName((Part) part);

                if (fileName != null && !fileName.isEmpty()) {
                    String filePath = uploadPath + File.separator + fileName;
                    part.write(filePath);

                    // Save the file path relative to the project root
                    String relativePath = UPLOAD_DIR + "/" + fileName;

                    // Update the database
                    updateDatabase(tableName, fieldName, relativePath, itemId);

                    response.getWriter().write(relativePath);
                    return;
                }
            }
        }

        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "File upload failed.");
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String content : contentDisposition.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
    }

    private void updateDatabase(String tableName, String fieldName, String filePath, String itemId) {
        String defaultField = "Image";
        if (fieldName == null || fieldName.isEmpty()) {
            fieldName = defaultField;
        }

        String query = "UPDATE " + tableName + " SET " + fieldName + " = ? WHERE Id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(query)) {

            preparedStatement.setString(1, filePath);
            preparedStatement.setString(2, itemId);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            System.out.print("Error: "+e.getMessage());
        }
    }
}
