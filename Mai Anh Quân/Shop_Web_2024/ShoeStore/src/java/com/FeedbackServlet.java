package com;

import DB.DBContext;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message = request.getParameter("message");
        
        // Save feedback to the database
        saveFeedback(message);
        
        // Set feedback sent message in session attribute
        request.getSession().setAttribute("feedbackSent", true);
        
        // Redirect back to userDashboard.jsp with feedback sent confirmation
        response.sendRedirect("product?");
    }
    
    private void saveFeedback(String message) {
        DBContext dbContext = new DBContext();
        try (Connection conn = dbContext.getConnection()) {
            String sql = "INSERT INTO feedback (Comment) VALUES (?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, message);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
