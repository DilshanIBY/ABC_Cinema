public class Notification {
    private int id;
    private String message;
    private String recipient;
    private LocalDateTime date;

    public Notification() {}

    public Notification(int id, String message, String recipient, LocalDateTime date) {
        this.id = id;
        this.message = message;
        this.recipient = recipient;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Notification{" +
                "id=" + id +
                ", message='" + message + '\'' +
                ", recipient='" + recipient + '\'' +
                ", date=" + date +
                '}';
    }
}
