package ml;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class TestChatBot {

    public static void main(String[] args) {
        String endpoint = "http://localhost:8080/ABC_Cinema_Reservation/chat"; // Update as needed
        String requestPayload = "{\"message\": \"movies available to watch in these days\"}";

        try {
            HttpURLConnection connection = createConnection(endpoint);

            // Send the JSON payload
            sendRequest(connection, requestPayload);

            // Handle the response
            handleResponse(connection);

        } catch (Exception e) {
            System.err.println("An unexpected error occurred:");
            e.printStackTrace();
        }
    }

    private static HttpURLConnection createConnection(String endpoint) throws IOException {
        URL url = new URL(endpoint);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setDoOutput(true);
        System.out.println("Connection Created!");
        return connection;
    }

    private static void sendRequest(HttpURLConnection connection, String payload) {
        try (OutputStream os = connection.getOutputStream()) {
            byte[] input = payload.getBytes(StandardCharsets.UTF_8);
            os.write(input, 0, input.length);
            System.out.println("Request Sent!");
        } catch (IOException e) {
            System.err.println("Error while sending request:");
            e.printStackTrace();
        }
    }

    private static void handleResponse(HttpURLConnection connection) {
        try {
            int statusCode = connection.getResponseCode();
            System.out.println("Response Received!");

            // Use appropriate stream based on the status code
            InputStream inputStream = (statusCode == 200) ? connection.getInputStream() : connection.getErrorStream();

            String response = readResponse(inputStream);
            System.out.println("Status Code: " + statusCode);
            System.out.println("Response: " + response);

        } catch (IOException e) {
            System.err.println("Error while handling response:");
            e.printStackTrace();
        }
    }

    private static String readResponse(InputStream inputStream) {
        StringBuilder response = new StringBuilder();
        System.out.println("Reading Response!");
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
        } catch (IOException e) {
            System.err.println("Error while reading response:");
            e.printStackTrace();
        }
        return response.toString();
    }
}
