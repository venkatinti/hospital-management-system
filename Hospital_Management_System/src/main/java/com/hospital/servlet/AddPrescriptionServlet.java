package com.hospital.servlet;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/addPrescription")
public class AddPrescriptionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String doctor = (String) req.getSession().getAttribute("displayName");
        String patient = req.getParameter("patient_name");
        String medicine = req.getParameter("medicine");
        String notes = req.getParameter("notes");

        try (Connection conn = DBConnect.getConn()) {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO prescriptions(patient_name, doctor_name, medicine, notes) VALUES(?,?,?,?)");
            ps.setString(1, patient);
            ps.setString(2, doctor);
            ps.setString(3, medicine);
            ps.setString(4, notes);
            ps.executeUpdate();
            resp.sendRedirect("doctordashboard.jsp?prescribed=1");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("doctordashboard.jsp?error=1");
        }
    }
}
