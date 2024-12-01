package models;

import java.util.ArrayList;
import java.util.List;

public class ContactUs {
    private int id;
    private String name;
    private String email;
    private String message;

    private static List<ContactUs> contactUsEntries = new ArrayList<>();

    public ContactUs(int id, String name, String email, String message) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.message = message;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    // Simulate fetching data from a database
    public static List<ContactUs> getAllEntries() {
        // Sample data
        contactUsEntries.add(new ContactUs(1, "John Doe", "john@example.com", "Hello, I need help!"));
        contactUsEntries.add(new ContactUs(2, "Jane Smith", "jane@example.com", "How can I book tickets?"));
        return contactUsEntries;
    }
}
