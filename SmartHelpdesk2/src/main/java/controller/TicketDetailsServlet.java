package controller;

import dao.TicketDAO;
import model.Ticket;
import dao.CommentDAO;
import java.util.List;
import model.Comment;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/ticketDetails")
public class TicketDetailsServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    int id = Integer.parseInt(request.getParameter("id"));

	    TicketDAO dao = new TicketDAO();
	    Ticket ticket = dao.getTicketById(id);

	    CommentDAO commentDAO = new CommentDAO();
	    List<Comment> comments = commentDAO.getCommentsByTicket(id);

	    request.setAttribute("ticket", ticket);
	    request.setAttribute("comments", comments);

	    RequestDispatcher rd = request.getRequestDispatcher("jsp/ticketDetails.jsp");
	    rd.forward(request, response);
	}
}
