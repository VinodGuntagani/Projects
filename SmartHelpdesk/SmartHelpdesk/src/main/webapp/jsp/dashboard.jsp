<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Smart Helpdesk</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eef2f7;
            margin: 0;
            padding: 0;
        }

        .header {
            background: #3b73d1;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            width: 500px;
            margin: 60px auto;
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .menu a {
            display: block;
            padding: 15px;
            margin-bottom: 15px;
            text-align: center;
            background: #3b73d1;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
        }

        .menu a:hover {
            background: #2d5cad;
        }

        .logout {
            background: #dc3545 !important;
        }

        .logout:hover {
            background: #a71d2a !important;
        }
    </style>

</head>
<body>

<div class="header">
    <h1>Smart Helpdesk</h1>
</div>

<div class="container">

    <h2>Welcome to Dashboard</h2>

    <div class="menu">
        <a href="<%= request.getContextPath() %>/jsp/createTicket.jsp">
            Create New Ticket
        </a>

        <a href="<%= request.getContextPath() %>/viewTickets">
            View My Tickets
        </a>

        <a href="<%= request.getContextPath() %>/jsp/login.jsp" class="logout">
            Logout
        </a>
    </div>

</div>

</body>
</html>
