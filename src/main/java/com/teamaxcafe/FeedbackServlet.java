package com.teamaxcafe;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class FeedbackServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String feedback = request.getParameter("feedback");

        int rating = 0;
        String ratingStr = request.getParameter("rating");
        if(ratingStr != null && !ratingStr.isEmpty()){
            rating = Integer.parseInt(ratingStr);
        }

        boolean isExisting = false;

        try (Connection conn = DBConnection.getConnection()) {

            // Check if mobile already exists
            PreparedStatement psCheck = conn.prepareStatement(
                "SELECT * FROM customers WHERE mobile=?"
            );
            psCheck.setString(1, mobile);
            ResultSet rs = psCheck.executeQuery();

            if (rs.next()) {
                // Already exists
                isExisting = true;

            } else {
                // Insert only if NOT existing
                PreparedStatement psInsert = conn.prepareStatement(
                    "INSERT INTO customers (name, mobile, email, rating, feedback, is_existing) VALUES (?, ?, ?, ?, ?, ?)"
                );

                psInsert.setString(1, name);
                psInsert.setString(2, mobile);
                psInsert.setString(3, email);
                psInsert.setInt(4, rating);
                psInsert.setString(5, feedback);
                psInsert.setBoolean(6, false);

                psInsert.executeUpdate();
            }

            request.setAttribute("isExisting", isExisting);
            request.getRequestDispatcher("feedback_result.jsp")
                   .forward(request, response);

        } catch(Exception e){
            e.printStackTrace();
            response.getWriter().println("Error: "+e.getMessage());
        }
    }
}


