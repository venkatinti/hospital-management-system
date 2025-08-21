<%@ page import="java.sql.*,com.hospital.servlet.DBConnect" %>
<%
    Connection conn = DBConnect.getConn();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Book Appointment</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #fceabb, #f8b500);
            padding: 50px;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            width: 380px;
            padding: 30px 25px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #555;
            font-weight: 500;
        }

        select, input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

<form action="bookAppointment" method="post">
    <h2>Book Appointment</h2>

    <div class="form-group">
        <label for="doctor_name">Doctor:</label>
        <select name="doctor_name" id="doctor_name" required>
            <%
                PreparedStatement ps = conn.prepareStatement("SELECT name FROM doctors");
                ResultSet rs = ps.executeQuery();
                while(rs.next()) {
            %>
                <option><%= rs.getString("name") %></option>
            <%
                }
                rs.close(); ps.close();
            %>
        </select>
    </div>

    <div class="form-group">
        <label for="patient_name">Patient:</label>
        <select name="patient_name" id="patient_name" required>
            <%
                ps = conn.prepareStatement("SELECT name FROM patients");
                rs = ps.executeQuery();
                while(rs.next()) {
            %>
                <option><%= rs.getString("name") %></option>
            <%
                }
                rs.close(); ps.close(); conn.close();
            %>
        </select>
    </div>

    <div class="form-group">
        <label for="appointment_date">Date:</label>
        <input type="date" name="appointment_date" id="appointment_date" required>
    </div>

    <button type="submit">Book</button>
</form>

</body>
</html>
