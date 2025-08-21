package com.hospital.servlet;
import java.io.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/addPatient")
public class AddPatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));

        try (Connection conn = DBConnect.getConn()) {
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO patients (name, age) VALUES (?, ?)");
            ps.setString(1, name);
            ps.setInt(2, age);
            ps.executeUpdate();
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
