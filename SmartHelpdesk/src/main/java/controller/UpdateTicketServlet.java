package controller;

import dao.TicketDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/updateTicket")
public class UpdateTicketServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int ticketId = Integer.parseInt(request.getParameter("ticketId"));
        String status = request.getParameter("status");

        TicketDAO dao = new TicketDAO();
        dao.updateStatus(ticketId, status);

        response.sendRedirect("ticketDetails?id=" + ticketId);
    }
}
