package com.teamaxcafe;

import java.sql.*;

public class DBConnection {

    // Method jo Connection return kare
    public static Connection getConnection() throws Exception {
        Connection conn = null;
        try {
            // 1️⃣ Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 2️⃣ Connect to Database
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/cafe_qr", "root", "G@jju2003"); // apna DB username/password
        } catch (Exception e) {
            throw e; // agar error aaye to propagate kare
        }
        return conn;
    }
}

