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
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        String userid = request.getParameter("userid");
        String message;

        if (!isNumeric(userid)) {
            message = "You must enter ID with numbers, not character.";
            request.setAttribute("message", message);
            request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
            return;
        }

        if (deleteUser(userid)) {
            message = "User Deleted Successfully.";
        } else {
            message = "Failed to delete user.";
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }

    private boolean isNumeric(String str) {
        return str != null && str.matches("\\d+");
    }

    private boolean deleteUser(String userid) {
        DBContext dbContext = new DBContext();
        try (Connection conn = dbContext.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM users WHERE userid = ?");
            ps.setString(1, userid);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
