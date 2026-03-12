<%@ page import="java.util.List" %>
<%@ page import="model.Ticket" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Tickets</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eef2f7;
            margin: 0;
            padding: 40px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .table-container {
            width: 90%;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #3b73d1;
            color: white;
            padding: 12px;
        }

        td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f2f6fc;
        }

        a {
            text-decoration: none;
            color: #3b73d1;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .back {
            display: block;
            margin-top: 25px;
            text-align: center;
            font-weight: bold;
        }
    </style>

</head>
<body>

<h2>My Tickets</h2>

<div class="table-container">

<table>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Status</th>
        <th>Priority</th>
        <th>Action</th>
    </tr>

<%
List<Ticket> tickets = (List<Ticket>) request.getAttribute("ticketList");

if (tickets != null && !tickets.isEmpty()) {
    for (Ticket t : tickets) {
%>
<tr>
    <td><%= t.getId() %></td>
    <td><%= t.getTitle() %></td>
    <td><%= t.getStatus() %></td>
    <td><%= t.getPriority() %></td>
    <td>
        <a href="<%= request.getContextPath() %>/ticketDetails?id=<%= t.getId() %>">
            View
        </a>
    </td>
</tr>
<%
    }
} else {
%>
<tr>
    <td colspan="5">No tickets found.</td>
</tr>
<%
}
%>

</table>

<%
String role = (String) session.getAttribute("role");
%>

<% if ("admin".equals(role)) { %>
    <a href="<%= request.getContextPath() %>/jsp/adminDashboard.jsp" class="back">
        Back to Admin Dashboard
    </a>
<% } else { %>
    <a href="<%= request.getContextPath() %>/jsp/dashboard.jsp" class="back">
        Back to Dashboard
    </a>
<% } %>

</div>

</body>
</html>
