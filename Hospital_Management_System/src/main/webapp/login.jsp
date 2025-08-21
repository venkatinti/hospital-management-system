<%
String err = request.getParameter("error");
String reg = request.getParameter("registered");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Hospital Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #e0f2f1, #ffffff);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        form {
            background-color: #fff;
            width: 320px;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 12px 0 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #388e3c;
        }

        .message {
            text-align: center;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .message.error {
            color: #e74c3c;
        }

        .message.success {
            color: #27ae60;
        }

        p {
            text-align: center;
            margin-top: 20px;
            font-size: 15px;
        }

        a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<h2>Login</h2>

<% if ("1".equals(err)) { %>
    <div class="message error">Invalid credentials</div>
<% } %>

<% if ("doctor".equals(reg)) { %>
    <div class="message success">Doctor registered. Please login.</div>
<% } else if ("patient".equals(reg)) { %>
    <div class="message success">Patient registered. Please login.</div>
<% } %>

<form action="login" method="post">
    <input type="text" name="username" placeholder="Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Login</button>
</form>

<p>New user? Register as <a href="register_doctor.jsp">Doctor</a> or <a href="register_patient.jsp">Patient</a></p>

</body>
</html>
