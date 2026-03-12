package model;

public class Comment {

    private int id;
    private int ticketId;
    private int userId;
    private String message;

    public Comment() {}

    public Comment(int ticketId, int userId, String message) {
        this.ticketId = ticketId;
        this.userId = userId;
        this.message = message;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getTicketId() { return ticketId; }
    public void setTicketId(int ticketId) { this.ticketId = ticketId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
}
