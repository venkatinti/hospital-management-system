<!DOCTYPE html>
<html>
<head>
  <title>Hospital Management</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(to right, #e0f7fa, #ffffff);
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
    }

    h1 {
      color: #2c3e50;
      margin-bottom: 30px;
      font-size: 36px;
    }

    .container {
      background-color: #ffffff;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.15);
      text-align: center;
      width: 320px;
    }

    .btn, .link {
      display: inline-block;
      background-color: #4CAF50;
      color: white;
      padding: 12px 20px;
      margin: 15px 0;
      text-decoration: none;
      border-radius: 6px;
      font-size: 16px;
      transition: background-color 0.3s ease;
    }

    .btn:hover, .link:hover {
      background-color: #388e3c;
    }

    .register-links {
      margin-top: 20px;
    }

    .register-links p {
      margin-bottom: 8px;
      font-size: 16px;
      color: #555;
    }

    ul {
      list-style: none;
      padding: 0;
    }

    ul li {
      margin: 8px 0;
    }

    ul li a {
      color: #4CAF50;
      font-weight: bold;
      font-size: 16px;
      text-decoration: none;
    }

    ul li a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <h1>Hospital Management System</h1>

  <div class="container">
    <a href="login.jsp" class="btn">Login</a>

    <div class="register-links">
      <p>Register as:</p>
      <ul>
        <li><a href="register_doctor.jsp">Doctor</a></li>
        <li><a href="register_patient.jsp">Patient</a></li>
      </ul>
    </div>
  </div>

</body>
</html>
