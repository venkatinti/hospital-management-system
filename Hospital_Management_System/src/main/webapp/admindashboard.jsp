<%@ page import="java.sql.*,com.hospital.servlet.DBConnect" %>
<%
    String name = (String) session.getAttribute("displayName");
    Connection c = DBConnect.getConn();
    long dc = 0, pc = 0, ac = 0, today = 0;
    PreparedStatement ps;
    ResultSet rs;

    ps = c.prepareStatement("SELECT COUNT(*) FROM doctors");
    rs = ps.executeQuery();
    if (rs.next()) dc = rs.getLong(1);
    rs.close(); ps.close();

    ps = c.prepareStatement("SELECT COUNT(*) FROM patients");
    rs = ps.executeQuery();
    if (rs.next()) pc = rs.getLong(1);
    rs.close(); ps.close();

    ps = c.prepareStatement("SELECT COUNT(*) FROM appointments");
    rs = ps.executeQuery();
    if (rs.next()) ac = rs.getLong(1);
    rs.close(); ps.close();

    ps = c.prepareStatement("SELECT COUNT(*) FROM appointments WHERE appointment_date = CURDATE()");
    rs = ps.executeQuery();
    if (rs.next()) today = rs.getLong(1);
    rs.close(); ps.close();

    c.close();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #dfe9f3, #ffffff);
            margin: 0;
            padding: 40px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .header h2 {
            color: #2c3e50;
        }

        .logout-link a {
            color: #e74c3c;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
        }

        .logout-link a:hover {
            text-decoration: underline;
        }

        .stats {
            display: flex;
            gap: 20px;
            margin-bottom: 40px;
            flex-wrap: wrap;
        }

        .stat-box {
            background-color: #fff;
            flex: 1;
            min-width: 220px;
            padding: 20px;
            border-left: 5px solid #4CAF50;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .stat-box strong {
            display: block;
            font-size: 18px;
            color: #333;
            margin-bottom: 6px;
        }

        .stat-box span {
            color: #666;
            font-size: 14px;
        }

        h3 {
            color: #444;
            margin-bottom: 15px;
        }

        .quick-links a {
            display: inline-block;
            margin: 8px 10px 8px 0;
            padding: 8px 14px;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-size: 14px;
            transition: 0.3s ease;
        }

        .quick-links a:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

<div class="header">
    <h2>Welcome, <%= name %> (Admin)</h2>
    <div class="logout-link">
        <a href="logout">Logout</a>
    </div>
</div>

<div class="stats">
    <div class="stat-box">
        <strong>Total Doctors:</strong>
        <span><%= dc %></span>
    </div>
    <div class="stat-box">
        <strong>Total Patients:</strong>
        <span><%= pc %></span>
    </div>
    <div class="stat-box">
        <strong>Total Appointments:</strong>
        <span><%= ac %> (Today: <%= today %>)</span>
    </div>
</div>

<h3>Quick Links</h3>
<div class="quick-links">
    <a href="add_doctor.jsp">Add Doctor</a>
    <a href="add_patient.jsp">Add Patient</a>
    <a href="book_appointment.jsp">Book Appointment</a>
    <a href="view_appointments.jsp">View All Appointments</a>
</div>

</body>
</html>
