package com.hospital.servlet;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/registerDoctor")
public class RegisterDoctorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String specialization = req.getParameter("specialization");

        try (Connection conn = DBConnect.getConn()) {
            conn.setAutoCommit(false);
            PreparedStatement u = conn.prepareStatement(
                "INSERT INTO users(username,password,role,display_name) VALUES(?,?, 'DOCTOR',?)");
            u.setString(1, username);
            u.setString(2, password);
            u.setString(3, name);
            u.executeUpdate();

            PreparedStatement d = conn.prepareStatement(
                "INSERT INTO doctors(name, specialization) VALUES(?,?)");
            d.setString(1, name);
            d.setString(2, specialization);
            d.executeUpdate();

            conn.commit();
            resp.sendRedirect("login.jsp?registered=doctor");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("register_doctor.jsp?error=1");
        }
    }
}
