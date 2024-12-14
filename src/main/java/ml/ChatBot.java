package ml;
import utils.DatabaseReader;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;


@WebServlet("/chat")
public class ChatBot extends HttpServlet {

    private final String API_KEY = "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";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        System.out.println("ChatBot invoked successfully!");

        try {
            // Parse user input from request
            StringBuilder requestBody = new StringBuilder();
            try (BufferedReader reader = request.getReader()) {
                String line;
                while ((line = reader.readLine()) != null) {
                    requestBody.append(line);
                }
            }

            System.out.println("Received payload: " + requestBody);

            // Validate JSON payload
            JsonObject requestBodyJson = new Gson().fromJson(requestBody.toString(), JsonObject.class);
            if (requestBodyJson == null || !requestBodyJson.has("message")) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"error\":\"Invalid payload. 'message' field is required.\"}");
                return;
            }

            // Extract the user message
            String userMessage = requestBodyJson.get("message").getAsString();

            // Add system-level messages to guide the assistant
            JsonArray messages = new JsonArray();
            messages.add(createMessage("system", "Assume that, Your name is 'Any'. You're a virtual assistant that runs on a 'Seats Reservation Website' called ABC CINEMA. You're a very friendly and funny assistant."));
            messages.add(createMessage("system", "Answer to the last message based on the below data. Make sure to gratefully call the user by his/her name on appropriate occasions."));
            messages.add(createMessage("system", "If the user is asking a question from you, act by thinking that you're now in the middle of the conversation with him. Not in the beginning."));
            messages.add(createMessage("system", "Don't ask 'How can I assist you' every time. Be creative and random."));
            messages.add(createMessage("system", "If user is asking something that needs to do an ADD, UPDATE, or DELETE operation to the database, make sure to format your response as this-> ['THE SQL QUERY TO PERFORM THE ACTION','YOUR MESSAGE TO THE USER ASSUMING THAT THE OPERATION IS COMPLETE']"));
            messages.add(createMessage("system", "Never output SQL queries for SELECT type operations. Do the search by your own from below database."));
            messages.add(createMessage("system", "The whole database: " + new DatabaseReader().allDatabase()));
            messages.add(createMessage("system", "This user's user_id:1 FirstName:Zandya"));
            messages.add(createMessage("system", "Last message from you to this user 'last_msg':" + new DatabaseReader().lastMsg(1)));
            messages.add(createMessage("user", userMessage));

            // Prepare OpenAI API payload
            JsonObject payload = new JsonObject();
            payload.addProperty("model", "gpt-3.5-turbo");
            payload.add("messages", messages);

            // Call OpenAI API
            URL url = new URL("https://api.openai.com/v1/chat/completions");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Authorization", "Bearer " + API_KEY);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);

            // Send payload
            try (OutputStream os = connection.getOutputStream()) {
                os.write(payload.toString().getBytes(StandardCharsets.UTF_8));
            }

            // Handle response
            int statusCode = connection.getResponseCode();
            StringBuilder apiResponse = new StringBuilder();

            if (statusCode == 200) {
                try (BufferedReader apiReader = new BufferedReader(new java.io.InputStreamReader(connection.getInputStream()))) {
                    String line;
                    while ((line = apiReader.readLine()) != null) {
                        apiResponse.append(line);
                    }
                }

                // Extract and handle SQL queries if present in the response
                JsonObject responseJson = new Gson().fromJson(apiResponse.toString(), JsonObject.class);
                String messageContent = responseJson.getAsJsonArray("choices").get(0).getAsJsonObject().get("message").getAsJsonObject().get("content").getAsString();

                if (messageContent.contains("[")) {
                    String[] parts = messageContent.substring(messageContent.indexOf("[") + 1, messageContent.indexOf("]")).split(",");
                    String query = parts[0].replace("'", "").trim();
                    String userMessageResponse = parts[1].replace("'", "").trim();

                    // Perform the database operation
                    new DatabaseReader().runQuery(query);

                    // Respond to the user
                    new DatabaseReader().updateLastMsg(1, messageContent);
                    response.setContentType("application/json");
                    response.setStatus(HttpServletResponse.SC_OK);
                    response.getWriter().write("{\"response\":\"" + escapeJsonString(userMessageResponse) + "\"}");
                } else {
                    // Standard response
                    new DatabaseReader().updateLastMsg(1, messageContent);
                    response.setContentType("application/json");
                    response.setStatus(HttpServletResponse.SC_OK);
                    response.getWriter().write("{\"response\":\"" + escapeJsonString(messageContent) + "\"}");
                }

            } else {
                // Capture error details from OpenAI
                try (BufferedReader errorReader = new BufferedReader(new java.io.InputStreamReader(connection.getErrorStream()))) {
                    String line;
                    while ((line = errorReader.readLine()) != null) {
                        apiResponse.append(line);
                    }
                }
                System.err.println("OpenAI API Error: " + apiResponse);

                // Respond with error details
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"error\":\"Failed to get a valid response from OpenAI API.\"}");
            }

        } catch (Exception e) {
            System.out.print(e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            try (PrintWriter writer = response.getWriter()) {
                writer.write("{\"error\":\"Internal server error: " + e.getMessage() + "\"}");
            } catch (Exception writeEx) {
                System.out.print(writeEx.getMessage());
            }
        }
    }
    
    private String escapeJsonString(String input) {
        return input.replace("\\", "\\\\")
                    .replace("\"", "\\\"")
                    .replace("\n", "<br>")
                    .replace("**", " ")
                    .replace("\r", "\\r");
    }


    private JsonObject createMessage(String role, String content) {
        JsonObject message = new JsonObject();
        message.addProperty("role", role);
        message.addProperty("content", content);
        return message;
    }
}
