// Placeholder content for Seat.java
public class Seat {
    private int seatId;
    private int rowNumber;
    private int seatNumber;
    private boolean isBooked;

    public Seat(int seatId, int rowNumber, int seatNumber, boolean isBooked) {
        this.seatId = seatId;
        this.rowNumber = rowNumber;
        this.seatNumber = seatNumber;
        this.isBooked = isBooked;
    }

    public int getSeatId() {
        return seatId;
    }

    public void setSeatId(int seatId) {
        this.seatId = seatId;
    }

    public int getRowNumber() {
        return rowNumber;
    }

    public void setRowNumber(int rowNumber) {
        this.rowNumber = rowNumber;
    }

    public int getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(int seatNumber) {
        this.seatNumber = seatNumber;
    }

    public boolean isBooked() {
        return isBooked;
    }

    public void setBooked(boolean booked) {
        isBooked = booked;
    }

    @Override
    public String toString() {
        return "Seat{" +
                "seatId=" + seatId +
                ", rowNumber=" + rowNumber +
                ", seatNumber=" + seatNumber +
                ", isBooked=" + isBooked +
                '}';
    }
}
