package controller;

import dao.TicketDAO;
import model.Ticket;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/createTicket")
public class CreateTicketServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String priority = request.getParameter("priority");

        // get userId from session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("jsp/login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        Ticket ticket = new Ticket(title, description, priority, "Open", userId);

        TicketDAO dao = new TicketDAO();
        boolean status = dao.createTicket(ticket);

        if (status) {
            response.sendRedirect("jsp/dashboard.jsp");
        } else {
            response.getWriter().println("Ticket creation failed");
        }
    }
}
