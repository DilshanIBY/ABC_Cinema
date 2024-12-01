package utils;

import com.google.gson.Gson;

import java.util.HashMap;
import java.util.Map;

public class ResponseUtils {

    private static final Gson gson = new Gson();

    public static String success(Object data) {
        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("data", data);
        return gson.toJson(response);
    }

    public static String successMessage(String message) {
        Map<String, String> response = new HashMap<>();
        response.put("status", "success");
        response.put("message", message);
        return gson.toJson(response);
    }

    public static String errorMessage(String message) {
        Map<String, String> response = new HashMap<>();
        response.put("status", "error");
        response.put("message", message);
        return gson.toJson(response);
    }
}
