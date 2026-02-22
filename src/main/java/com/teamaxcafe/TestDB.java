package com.teamaxcafe;

import java.sql.*;

public class TestDB {
    public static void main(String[] args) {
        try {
            Connection conn = DBConnection.getConnection();
            if(conn != null) {
                System.out.println("Database Connected Successfully! ✅");
                conn.close();
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}

