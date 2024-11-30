package controllers;

import models.ContactUs;
import utils.ResponseUtils;

import java.util.List;

public class ContactUsController {

    // Simulate a database for Contact Us entries
    private static List<ContactUs> contactList = ContactUs.getAllEntries();

    // API to fetch all contact requests
    public static String getAllContacts() {
        return ResponseUtils.success(contactList);
    }

    // API to add a new contact request
    public static String addContact(ContactUs contact) {
        contactList.add(contact);
        return ResponseUtils.successMessage("Contact request added successfully!");
    }

    // API to delete a contact request
    public static String deleteContact(int id) {
        contactList.removeIf(contact -> contact.getId() == id);
        return ResponseUtils.successMessage("Contact request deleted successfully!");
    }
}
