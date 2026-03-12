<!DOCTYPE html>
<html>
<head>
    <title>Register - Smart Helpdesk</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #dfe7f2;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 400px;
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

        input {
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
            background: #28a745;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #1e7e34;
        }

        p {
            text-align: center;
        }

        a {
            color: #3b73d1;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>

</head>
<body>

<div class="container">

<h2>User Registration</h2>

<form action="<%= request.getContextPath() %>/register" method="post">

    <label>Name:</label>
    <input type="text" name="name" required>

    <label>Email:</label>
    <input type="email" name="email" required>

    <label>Password:</label>
    <input type="password" name="password" required>

    <button type="submit">Register</button>

</form>

<p>
Already have an account? 
<a href="<%= request.getContextPath() %>/jsp/login.jsp">Login here</a>
</p>

</div>

</body>
</html>
