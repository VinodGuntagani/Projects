package controller;

import dao.TicketDAO;
import model.Ticket;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewTickets")
public class ViewTicketServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // not logged in
        if (session == null || session.getAttribute("role") == null) {
            response.sendRedirect("jsp/login.jsp");
            return;
        }

        String role = (String) session.getAttribute("role");

        TicketDAO dao = new TicketDAO();
        List<Ticket> tickets;

        if ("admin".equals(role)) {
            // ADMIN → all tickets
            tickets = dao.getAllTickets();
        } else {
            // USER → own tickets
            int userId = (int) session.getAttribute("userId");
            tickets = dao.getTicketsByUser(userId);
        }

        request.setAttribute("ticketList", tickets);
        RequestDispatcher rd = request.getRequestDispatcher("jsp/viewTickets.jsp");
        rd.forward(request, response);
    }
}
