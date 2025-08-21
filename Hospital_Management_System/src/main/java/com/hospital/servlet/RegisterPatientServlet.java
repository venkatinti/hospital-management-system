package com.hospital.servlet;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/registerPatient")
public class RegisterPatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));

        try (Connection conn = DBConnect.getConn()) {
            conn.setAutoCommit(false);
            PreparedStatement u = conn.prepareStatement(
                "INSERT INTO users(username,password,role,display_name) VALUES(?,?, 'PATIENT',?)");
            u.setString(1, username);
            u.setString(2, password);
            u.setString(3, name);
            u.executeUpdate();

            PreparedStatement p = conn.prepareStatement(
                "INSERT INTO patients(name, age) VALUES(?,?)");
            p.setString(1, name);
            p.setInt(2, age);
            p.executeUpdate();

            conn.commit();
            resp.sendRedirect("login.jsp?registered=patient");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("register_patient.jsp?error=1");
        }
    }
}
