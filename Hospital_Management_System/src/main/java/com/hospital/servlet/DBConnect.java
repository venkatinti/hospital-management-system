package com.hospital.servlet;
import java.sql.*;

public class DBConnect {
    private static final String URL = "jdbc:mysql://localhost:3307/hospital_db";
    private static final String USER = "root";
    private static final String PASS = "8897613177"; // change if needed

    public static Connection getConn() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
