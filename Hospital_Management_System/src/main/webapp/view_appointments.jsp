<%@ page import="java.sql.*,com.hospital.servlet.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
  <title>All Appointments</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f9f9f9;
      padding: 40px;
    }

    h2 {
      text-align: center;
      color: #2c3e50;
      margin-bottom: 30px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background-color: #fff;
      box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }

    th, td {
      padding: 12px 15px;
      border: 1px solid #ddd;
      text-align: center;
      color: #333;
    }

    th {
      background-color: #4CAF50;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    tr:hover {
      background-color: #f9f9f9;
    }

    a {
      color: #4CAF50;
      text-decoration: none;
      font-weight: bold;
      margin: 0 5px;
    }

    a:hover {
      text-decoration: underline;
    }

    .container {
      max-width: 1000px;
      margin: 0 auto;
    }
  </style>
</head>
<body>

<div class="container">
  <h2>All Appointments</h2>
  <table>
    <tr>
      <th>ID</th>
      <th>Doctor</th>
      <th>Patient</th>
      <th>Date</th>
      <th>Action</th>
    </tr>
    <%
      Connection conn = DBConnect.getConn();
      PreparedStatement ps = conn.prepareStatement("SELECT * FROM appointments ORDER BY appointment_date DESC");
      ResultSet rs = ps.executeQuery();
      while(rs.next()) {
    %>
    <tr>
      <td><%= rs.getInt("id") %></td>
      <td><%= rs.getString("doctor_name") %></td>
      <td><%= rs.getString("patient_name") %></td>
      <td><%= rs.getDate("appointment_date") %></td>
      <td>
        <a href="edit_appointment.jsp?id=<%= rs.getInt("id") %>">Edit</a> |
        <a href="deleteAppointment?id=<%= rs.getInt("id") %>" onclick="return confirm('Are you sure you want to delete this appointment?');">Delete</a>
      </td>
    </tr>
    <% 
      }
      rs.close(); ps.close(); conn.close();
    %>
  </table>
</div>

</body>
</html>
