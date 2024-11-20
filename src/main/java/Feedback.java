public class Feedback {
    private int id;
    private String content;
    private String userEmail;
    private LocalDateTime date;

    public Feedback() {}

    public Feedback(int id, String content, String userEmail, LocalDateTime date) {
        this.id = id;
        this.content = content;
        this.userEmail = userEmail;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", date=" + date +
                '}';
    }
}
