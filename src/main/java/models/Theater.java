// Placeholder content for Theater.java
import java.util.ArrayList;
import java.util.List;

public class Theater {
    private int theaterId;
    private String theaterName;
    private int totalSeats;
    private List<Seat> seats;

    public Theater(int theaterId, String theaterName, int totalSeats) {
        this.theaterId = theaterId;
        this.theaterName = theaterName;
        this.totalSeats = totalSeats;
        this.seats = new ArrayList<>();
    }

    public int getTheaterId() {
        return theaterId;
    }

    public void setTheaterId(int theaterId) {
        this.theaterId = theaterId;
    }

    public String getTheaterName() {
        return theaterName;
    }

    public void setTheaterName(String theaterName) {
        this.theaterName = theaterName;
    }

    public int getTotalSeats() {
        return totalSeats;
    }

    public void setTotalSeats(int totalSeats) {
        this.totalSeats = totalSeats;
    }

    public List<Seat> getSeats() {
        return seats;
    }

    public void addSeat(Seat seat) {
        this.seats.add(seat);
    }

    @Override
    public String toString() {
        return "Theater{" +
                "theaterId=" + theaterId +
                ", theaterName='" + theaterName + '\'' +
                ", totalSeats=" + totalSeats +
                ", seats=" + seats +
                '}';
    }
}
