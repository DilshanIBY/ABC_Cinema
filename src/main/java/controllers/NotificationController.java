//package controllers;
//
//import utils.EmailUtil;
//import utils.SMSUtil;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.*;
//
//@RestController
//@RequestMapping("/notifications")
//public class NotificationController {
//
//    @Autowired
//    private EmailUtil emailUtil;
//
//    @Autowired
//    private SMSUtil smsUtil;
//
//    @PostMapping("/reservation")
//    public String notifyReservation(@RequestParam String userEmail, @RequestParam String userPhone) {
//        // Sending email notification
//        emailUtil.sendEmail(userEmail, "Reservation Successful", "Your reservation has been successfully made.");
//        // Sending SMS notification
//        smsUtil.sendSMS(userPhone, "Your reservation has been successfully made.");
//        return "Reservation notifications sent successfully!";
//    }
//
//    @PostMapping("/cancellation")
//    public String notifyCancellation(@RequestParam String userEmail, @RequestParam String userPhone) {
//        // Sending email notification
//        emailUtil.sendEmail(userEmail, "Reservation Cancelled", "Your reservation has been cancelled.");
//        // Sending SMS notification
//        smsUtil.sendSMS(userPhone, "Your reservation has been cancelled.");
//        return "Cancellation notifications sent successfully!";
//    }
//}

