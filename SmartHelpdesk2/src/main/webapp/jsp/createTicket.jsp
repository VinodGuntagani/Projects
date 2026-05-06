<!DOCTYPE html>
<html>
<head>
    <title>Create Ticket</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eef2f7;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 500px;
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            font-weight: bold;
        }

        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #3b73d1;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #2d5cad;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #3b73d1;
            font-weight: bold;
        }

        .back:hover {
            text-decoration: underline;
        }
    </style>

</head>
<body>

<div class="container">

<h2>Create New Ticket</h2>

<form action="<%= request.getContextPath() %>/createTicket" method="post">

    <label>Title:</label>
    <input type="text" name="title" required>

    <label>Description:</label>
    <textarea name="description" rows="5" required></textarea>

    <label>Priority:</label>
    <select name="priority">
        <option value="Low">Low</option>
        <option value="Medium">Medium</option>
        <option value="High">High</option>
    </select>

    <button type="submit">Submit Ticket</button>

</form>

<a href="<%= request.getContextPath() %>/jsp/dashboard.jsp" class="back">
    Back to Dashboard
</a>

</div>

</body>
</html>
