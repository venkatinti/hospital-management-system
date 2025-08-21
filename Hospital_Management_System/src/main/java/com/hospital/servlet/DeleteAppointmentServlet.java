package com.hospital.servlet;
import java.io.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/deleteAppointment")
public class DeleteAppointmentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection conn = DBConnect.getConn()) {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM appointments WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();
            response.sendRedirect("view_appointments.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
