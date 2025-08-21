<%@ page import="java.sql.*,com.hospital.servlet.DBConnect" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection conn = DBConnect.getConn();
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM appointments WHERE id=?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
    rs.next();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Appointment</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f2f2f2;
            padding: 60px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }
        form {
            background-color: #fff;
            width: 400px;
            margin: 0 auto;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #444;
        }
        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        input[type="hidden"] {
            display: none;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
        }
        button:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

<h2>Edit Appointment</h2>
<form action="editAppointment" method="post">
    <input type="hidden" name="id" value="<%= id %>">

    <label for="doctor_name">Doctor:</label>
    <input type="text" name="doctor_name" id="doctor_name" value="<%= rs.getString("doctor_name") %>" required>

    <label for="patient_name">Patient:</label>
    <input type="text" name="patient_name" id="patient_name" value="<%= rs.getString("patient_name") %>" required>

    <label for="appointment_date">Date:</label>
    <input type="date" name="appointment_date" id="appointment_date" value="<%= rs.getDate("appointment_date") %>" required>

    <button type="submit">Update Appointment</button>
</form>

</body>
</html>
<%
    rs.close();
    ps.close();
    conn.close();
%>
