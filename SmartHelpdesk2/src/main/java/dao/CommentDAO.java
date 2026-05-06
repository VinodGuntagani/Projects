package dao;

import model.Comment;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {

    public boolean addComment(Comment comment) {
        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO comments(ticket_id, user_id, message) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, comment.getTicketId());
            ps.setInt(2, comment.getUserId());
            ps.setString(3, comment.getMessage());

            ps.executeUpdate();
            status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Comment> getCommentsByTicket(int ticketId) {
        List<Comment> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM comments WHERE ticket_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, ticketId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Comment c = new Comment();
                c.setId(rs.getInt("id"));
                c.setTicketId(rs.getInt("ticket_id"));
                c.setUserId(rs.getInt("user_id"));
                c.setMessage(rs.getString("message"));
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
