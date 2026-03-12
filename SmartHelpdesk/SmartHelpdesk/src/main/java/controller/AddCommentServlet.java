package controller;

import dao.CommentDAO;
import model.Comment;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/addComment")
public class AddCommentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int ticketId = Integer.parseInt(request.getParameter("ticketId"));
        String message = request.getParameter("message");

        // temporary user id
        int userId = 1;

        Comment comment = new Comment(ticketId, userId, message);

        CommentDAO dao = new CommentDAO();
        dao.addComment(comment);

        response.sendRedirect("ticketDetails?id=" + ticketId);
    }
}
