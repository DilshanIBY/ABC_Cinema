package controllers;

import utils.EmailUtil;
import utils.SMSUtil;

public class ReservationController {

    public void makeReservation(String userEmail, String userPhone, String reservationDetails) {
        // Logic for making a reservation
        System.out.println("Reservation made successfully!");

        // Send Email Notification
        EmailUtil.sendEmail(userEmail, "Reservation Confirmed", "Your reservation: " + reservationDetails);

        // Send SMS Notification
        SMSUtil.sendSMS(userPhone, "Your reservation is confirmed: " + reservationDetails);
    }

    public void cancelReservation(String userEmail, String userPhone, String reservationDetails) {
        // Logic for canceling a reservation
        System.out.println("Reservation canceled successfully!");

        // Send Email Notification
        EmailUtil.sendEmail(userEmail, "Reservation Canceled", "Your reservation has been canceled: " + reservationDetails);

        // Send SMS Notification
        SMSUtil.sendSMS(userPhone, "Your reservation has been canceled: " + reservationDetails);
    }
}
