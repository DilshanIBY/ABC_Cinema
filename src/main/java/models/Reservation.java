// Placeholder content for Reservation.java
import java.time.LocalDateTime;

public class Reservation {
    private int reservationId;
    private int seatId;
    private int theaterId;
    private String customerName;
    private LocalDateTime reservationTime;

    public Reservation(int reservationId, int seatId, int theaterId, String customerName, LocalDateTime reservationTime) {
        this.reservationId = reservationId;
        this.seatId = seatId;
        this.theaterId = theaterId;
        this.customerName = customerName;
        this.reservationTime = reservationTime;
    }

    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public int getSeatId() {
        return seatId;
    }

    public void setSeatId(int seatId) {
        this.seatId = seatId;
    }

    public int getTheaterId() {
        return theaterId;
    }

    public void setTheaterId(int theaterId) {
        this.theaterId = theaterId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public LocalDateTime getReservationTime() {
        return reservationTime;
    }

    public void setReservationTime(LocalDateTime reservationTime) {
        this.reservationTime = reservationTime;
    }

    @Override
    public String toString() {
        return "Reservation{" +
                "reservationId=" + reservationId +
                ", seatId=" + seatId +
                ", theaterId=" + theaterId +
                ", customerName='" + customerName + '\'' +
                ", reservationTime=" + reservationTime +
                '}';
    }
}
