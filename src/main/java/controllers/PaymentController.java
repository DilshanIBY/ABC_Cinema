package controllers;

import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import java.util.ArrayList;
import java.util.List;

public class PaymentController {

    private static final String CLIENT_ID = "AYqthyAdDarp-Z_ViTwz9mGIjuGJVyffKtFKM_JzQwV21Hsl3qmRZiamcq11SStA1zuMZKy7IXKP8BlK";
    private static final String CLIENT_SECRET = "EJZU_nCOLVsl_0xIdZSTYVIB09E73r0UNa1oy0w-50gj0jEkMHHYWUlX4svW_F-BKZzUmgnLmodCrHs1";
    private static final String MODE = "sandbox";

    private String paypalPaymentId;  // Store the PayPal payment ID

    public String createPayment(String reservationId, double amount) {
        Amount payAmount = new Amount();
        payAmount.setCurrency("USD");
        payAmount.setTotal(String.format("%.2f", amount));

        Transaction transaction = new Transaction();
        transaction.setAmount(payAmount);
        transaction.setDescription("Payment for reservation ID: " + reservationId);

        List<Transaction> transactions = new ArrayList<>();
        transactions.add(transaction);

        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/ABC_Cinema_Reservation/cancel");
        redirectUrls.setReturnUrl("http://localhost:8080/ABC_Cinema_Reservation/ConfirmPayment");

        Payment payment = new Payment();
        payment.setIntent("sale");
        payment.setPayer(payer);
        payment.setTransactions(transactions);
        payment.setRedirectUrls(redirectUrls);

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        try {
            Payment createdPayment = payment.create(apiContext);
            // Store the PayPal payment ID for later use
            this.paypalPaymentId = createdPayment.getId();

            for (Links link : createdPayment.getLinks()) {
                if (link.getRel().equals("approval_url")) {
                    return link.getHref(); // Return PayPal approval URL
                }
            }
        } catch (PayPalRESTException e) {
            System.out.printf("Error: "+e.getMessage());
        }

        return null;
    }

    public String executePayment(String paymentId, String payerId) {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        Payment payment = new Payment();
        payment.setId(paymentId);

        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);

        try {
            Payment executedPayment = payment.execute(apiContext, paymentExecution);
            return executedPayment.getState(); // Return payment status (approved, completed)
        } catch (PayPalRESTException e) {
            System.out.printf("Error: "+e.getMessage());
        }

        return null;
    }

    // Getter for PayPal payment ID
    public String getPayPalPaymentId() {
        return this.paypalPaymentId;
    }
}
