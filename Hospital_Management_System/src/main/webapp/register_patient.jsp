<!DOCTYPE html>
<html>
<head>
  <title>Patient Registration</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f2f2f2;
      padding: 50px;
    }

    h2 {
      text-align: center;
      color: #2c3e50;
      margin-bottom: 30px;
    }

    form {
      background-color: #fff;
      width: 400px;
      margin: 0 auto;
      padding: 25px 30px;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }

    label {
      display: block;
      margin-bottom: 6px;
      font-weight: bold;
      color: #555;
    }

    input[type="text"],
    input[type="password"],
    input[type="number"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 18px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 14px;
    }

    button {
      width: 100%;
      padding: 12px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 15px;
      cursor: pointer;
    }

    button:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>

<h2>Patient Registration</h2>
<form action="registerPatient" method="post">
  <label for="username">Username:</label>
  <input type="text" name="username" id="username" required>

  <label for="password">Password:</label>
  <input type="password" name="password" id="password" required>

  <label for="name">Name:</label>
  <input type="text" name="name" id="name" required>

  <label for="age">Age:</label>
  <input type="number" name="age" id="age" required>

  <button type="submit">Register</button>
</form>

</body>
</html>
