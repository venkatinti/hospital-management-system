<%@ page import="java.sql.*,com.hospital.servlet.DBConnect" %>
<%
    String doctorName = (String) session.getAttribute("displayName");
    Connection conn = DBConnect.getConn();
    PreparedStatement ps = conn.prepareStatement(
        "SELECT id, patient_name, appointment_date FROM appointments WHERE doctor_name=? ORDER BY appointment_date DESC");
    ps.setString(1, doctorName);
    ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Doctor Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 40px;
        }
        h2, h3 {
            color: #333;
        }
        a {
            color: #4CAF50;
            text-decoration: none;
            margin-right: 10px;
        }
        a:hover {
            text-decoration: underline;
        }
        .section {
            background-color: #fff;
            padding: 25px;
            margin-bottom: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        form {
            margin-top: 20px;
        }
        select, input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
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
            border-radius: 6px;
            cursor: pointer;
            font-size: 15px;
        }
        button:hover {
            background-color: #388e3c;
        }
        .footer-links {
            text-align: right;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="section">
    <h2>Welcome Dr. <%= doctorName %></h2>
</div>

<div class="section">
    <h3>Your Appointments</h3>
    <table>
        <tr><th>ID</th><th>Patient</th><th>Date</th></tr>
        <% while(rs.next()) { %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("patient_name") %></td>
                <td><%= rs.getDate("appointment_date") %></td>
            </tr>
        <% } rs.close(); ps.close(); %>
    </table>
</div>

<div class="section">
    <h3>Add Prescription</h3>
    <form action="addPrescription" method="post">
        <label for="patient_name">Patient:</label>
        <select name="patient_name" id="patient_name" required>
            <%
                PreparedStatement ps2 = conn.prepareStatement("SELECT name FROM patients");
                ResultSet rs2 = ps2.executeQuery();
                while(rs2.next()) {
            %>
                <option><%= rs2.getString("name") %></option>
            <%
                }
                rs2.close(); ps2.close(); conn.close();
            %>
        </select>

        <label for="medicine">Medicine:</label>
        <input type="text" name="medicine" id="medicine" required>

        <label for="notes">Notes:</label>
        <textarea name="notes" id="notes" rows="4"></textarea>

        <button type="submit">Save Prescription</button>
    </form>
</div>

<div class="footer-links">
    <a href="view_appointments.jsp">View All Appointments</a> |
    <a href="logout">Logout</a>
</div>

</body>
</html>
