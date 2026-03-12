<%@ page import="model.Ticket" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Comment" %>

<%
Ticket t = (Ticket) request.getAttribute("ticket");
List<Comment> comments = (List<Comment>) request.getAttribute("comments");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Ticket Details</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eef2f7;
            margin: 0;
            padding: 40px;
        }

        .container {
            width: 700px;
            margin: auto;
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .ticket-info p {
            font-size: 16px;
            margin: 8px 0;
        }

        hr {
            margin: 30px 0;
        }

        textarea, select {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            padding: 10px 20px;
            background: #3b73d1;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background: #2d5cad;
        }

        .comment-box {
            background: #f5f8fd;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 6px;
        }

        .back {
            display: block;
            margin-top: 25px;
            text-align: center;
            font-weight: bold;
            text-decoration: none;
            color: #3b73d1;
        }

        .back:hover {
            text-decoration: underline;
        }

        .section-title {
            margin-top: 20px;
            margin-bottom: 10px;
        }
    </style>

</head>
<body>

<div class="container">

<h2>Ticket Details</h2>

<div class="ticket-info">
    <p><strong>Title:</strong> <%= t.getTitle() %></p>
    <p><strong>Description:</strong> <%= t.getDescription() %></p>
    <p><strong>Status:</strong> <%= t.getStatus() %></p>
    <p><strong>Priority:</strong> <%= t.getPriority() %></p>
</div>

<hr>

<h3 class="section-title">Comments</h3>

<%
if (comments != null && !comments.isEmpty()) {
    for (Comment c : comments) {
%>
    <div class="comment-box">
        <%= c.getMessage() %>
    </div>
<%
    }
} else {
%>
    <p>No comments yet.</p>
<%
}
%>

<hr>

<h3 class="section-title">Update Status</h3>

<form action="<%= request.getContextPath() %>/updateTicket" method="post">
    <input type="hidden" name="ticketId" value="<%= t.getId() %>">

    <select name="status">
        <option value="Open">Open</option>
        <option value="In-Progress">In-Progress</option>
        <option value="Closed">Closed</option>
    </select>

    <button type="submit">Update</button>
</form>

<hr>

<h3 class="section-title">Add Comment</h3>

<form action="<%= request.getContextPath() %>/addComment" method="post">
    <input type="hidden" name="ticketId" value="<%= t.getId() %>">
    <textarea name="message" rows="4" required></textarea>
    <button type="submit">Add Comment</button>
</form>

<a href="<%= request.getContextPath() %>/viewTickets" class="back">
    Back to Tickets
</a>

</div>

</body>
</html>
