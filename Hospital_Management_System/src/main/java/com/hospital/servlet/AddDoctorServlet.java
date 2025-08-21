package com.hospital.servlet;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/addDoctor")
public class AddDoctorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String specialization = request.getParameter("specialization");

        try (Connection conn = DBConnect.getConn()) {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO doctors (name, specialization) VALUES (?, ?)");
            ps.setString(1, name);
            ps.setString(2, specialization);
            ps.executeUpdate();
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
