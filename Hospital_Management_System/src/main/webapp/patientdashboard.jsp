<%@ page import="java.sql.*,com.hospital.servlet.DBConnect" %>
<%
  String patientName = (String) session.getAttribute("displayName");
  Connection conn = DBConnect.getConn();

  PreparedStatement ps = conn.prepareStatement(
    "SELECT id, doctor_name, appointment_date FROM appointments WHERE patient_name=? ORDER BY appointment_date DESC");
  ps.setString(1, patientName);
  ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
  <title>Patient Dashboard</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f2f2f2;
      padding: 40px;
      color: #333;
    }

    h2, h3 {
      text-align: center;
      margin-bottom: 20px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background-color: #fff;
      margin-bottom: 40px;
    }

    table, th, td {
      border: 1px solid #ccc;
    }

    th, td {
      padding: 12px;
      text-align: center;
    }

    form {
      background-color: #fff;
      width: 400px;
      margin: 0 auto 50px;
      padding: 25px;
      border-radius: 8px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    label {
      display: block;
      margin-bottom: 6px;
      font-weight: bold;
    }

    select, input[type="date"], input[type="text"], textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
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

    a {
      color: #4CAF50;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }

    .link-center {
      text-align: center;
      margin-top: 20px;
    }
  </style>
</head>
<body>

<h2>Welcome, <%= patientName %></h2>

<h3>Your Appointments</h3>
<table>
  <tr><th>ID</th><th>Doctor</th><th>Date</th></tr>
  <% while(rs.next()) { %>
  <tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("doctor_name") %></td>
    <td><%= rs.getDate("appointment_date") %></td>
  </tr>
  <% } rs.close(); ps.close(); %>
</table>

<h3>Book New Appointment</h3>
<form action="bookAppointment" method="post">
  <label for="doctor">Doctor:</label>
  <select name="doctor_name" id="doctor" required>
    <%
      PreparedStatement d = conn.prepareStatement("SELECT name FROM doctors");
      ResultSet rd = d.executeQuery();
      while(rd.next()) {
    %>
      <option><%= rd.getString("name") %></option>
    <% } rd.close(); d.close(); %>
  </select>

  <input type="hidden" name="patient_name" value="<%= patientName %>">

  <label for="date">Date:</label>
  <input type="date" name="appointment_date" id="date" required>

  <button type="submit">Book Appointment</button>
</form>

<h3>Your Prescriptions</h3>
<table>
  <tr><th>Date</th><th>Doctor</th><th>Medicine</th><th>Notes</th></tr>
  <%
    PreparedStatement p2 = conn.prepareStatement(
      "SELECT date, doctor_name, medicine, notes FROM prescriptions WHERE patient_name=? ORDER BY date DESC");
    p2.setString(1, patientName);
    ResultSet rp = p2.executeQuery();
    while(rp.next()) {
  %>
    <tr>
      <td><%= rp.getDate("date") %></td>
      <td><%= rp.getString("doctor_name") %></td>
      <td><%= rp.getString("medicine") %></td>
      <td><%= rp.getString("notes") %></td>
    </tr>
  <% } rp.close(); p2.close(); conn.close(); %>
</table>

<div class="link-center">
  <p><a href="view_appointments.jsp">All Appointments (Read-only)</a></p>
  <p><a href="logout">Logout</a></p>
</div>

</body>
</html>
