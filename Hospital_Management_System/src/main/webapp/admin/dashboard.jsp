<%@ page import="java.sql.*,com.hospital.servlet.DBConnect" %>
<%
 String name = (String) session.getAttribute("displayName");
 Connection c = DBConnect.getConn();
 long dc=0, pc=0, ac=0, today=0;
 PreparedStatement ps;
 ResultSet rs;

 ps = c.prepareStatement("SELECT COUNT(*) FROM doctors"); rs=ps.executeQuery(); if(rs.next()) dc=rs.getLong(1); rs.close(); ps.close();
 ps = c.prepareStatement("SELECT COUNT(*) FROM patients"); rs=ps.executeQuery(); if(rs.next()) pc=rs.getLong(1); rs.close(); ps.close();
 ps = c.prepareStatement("SELECT COUNT(*) FROM appointments"); rs=ps.executeQuery(); if(rs.next()) ac=rs.getLong(1); rs.close(); ps.close();
 ps = c.prepareStatement("SELECT COUNT(*) FROM appointments WHERE appointment_date=CURDATE()");
 rs=ps.executeQuery(); if(rs.next()) today=rs.getLong(1); rs.close(); ps.close();
 c.close();
%>
<html><head><title>Admin Dashboard</title></head>
<body>
<h2>Welcome, <%= name %> (Admin)</h2>
<p><a href="../logout">Logout</a></p>
<ul>
  <li>Total Doctors: <%= dc %></li>
  <li>Total Patients: <%= pc %></li>
  <li>Total Appointments: <%= ac %> (Today: <%= today %>)</li>
</ul>

<h3>Quick Links</h3>
<a href="../add_doctor.jsp">Add Doctor</a> |
<a href="../add_patient.jsp">Add Patient</a> |
<a href="../book_appointment.jsp">Book Appointment</a> |
<a href="../view_appointments.jsp">View All Appointments</a>
</body></html>
