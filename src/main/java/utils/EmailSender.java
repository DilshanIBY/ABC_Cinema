package utils;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Properties;

@WebServlet("/SendEmail")
public class EmailSender extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve email details from request parameters
        String recipientEmail = request.getParameter("recipientEmail");
        String subject = request.getParameter("subject");
        String messageContent = request.getParameter("messageContent");

        try {
            // Send email
            boolean emailSent = sendEmail(recipientEmail, subject, messageContent);

            if (emailSent) {
                response.getWriter().write("Email sent successfully.");
            } else {
                response.getWriter().write("Failed to send email.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error occurred: " + e.getMessage());
        }
    }

    // Method to send email
    private boolean sendEmail(String recipientEmail, String subject, String messageContent) {
        // Sender's email credentials (replace with environment variables or config file in production)
        String senderEmail = "ust.webhost@gmail.com"; // my test email
        String senderPassword = "19991014@Idilshan";  // my test password

        // Email properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        // Create session with authentication
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            // Compose the email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject(subject);
            message.setText(messageContent);

            // Send the email
            Transport.send(message);
            System.out.println("Email sent successfully.");
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("Failed to send email.");
            return false;
        }
    }
}
