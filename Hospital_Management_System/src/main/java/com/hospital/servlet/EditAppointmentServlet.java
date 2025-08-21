package com.hospital.servlet;
import java.io.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/editAppointment")
public class EditAppointmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String doctor = request.getParameter("doctor_name");
        String patient = request.getParameter("patient_name");
        String date = request.getParameter("appointment_date");

        try (Connection conn = DBConnect.getConn()) {
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE appointments SET doctor_name=?, patient_name=?, appointment_date=? WHERE id=?");
            ps.setString(1, doctor);
            ps.setString(2, patient);
            ps.setString(3, date);
            ps.setInt(4, id);
            ps.executeUpdate();
            response.sendRedirect("view_appointments.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
