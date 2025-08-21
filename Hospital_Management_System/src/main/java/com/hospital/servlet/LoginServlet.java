package com.hospital.servlet;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try (Connection conn = DBConnect.getConn()) {
            PreparedStatement ps = conn.prepareStatement(
                "SELECT id, role, display_name FROM users WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession session = req.getSession(true);
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("username", username);
                session.setAttribute("role", rs.getString("role"));
                session.setAttribute("displayName", rs.getString("display_name"));

                String role = rs.getString("role");
                if ("ADMIN".equals(role)) resp.sendRedirect("admindashboard.jsp");
                else if ("DOCTOR".equals(role)) resp.sendRedirect("doctordashboard.jsp");
                else resp.sendRedirect("patientdashboard.jsp");
            } else {
                resp.sendRedirect("login.jsp?error=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("login.jsp?error=1");
        }
    }
}
