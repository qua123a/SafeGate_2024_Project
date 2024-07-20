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
import jakarta.servlet.RequestDispatcher;

@WebServlet("/editUser")
public class EditUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        String userid = request.getParameter("userid");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phonenumber");
        String address = request.getParameter("address");

        String message;
        if (!userid.matches("\\d+")) {
            message = "You must enter ID with number, not character.";
        } else if (editUser(userid, username, password, fullname, email, phonenumber, address)) {
            message = "Edit User Successfully!";
        } else {
            message = "User ID is not in the database!";
        }
        
        request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminDashboard.jsp");
        dispatcher.forward(request, response);
    }

    private boolean editUser(String userid, String username, String password, String fullname, String email, String phonenumber, String address) {
        DBContext dbContext = new DBContext();
        try (Connection conn = dbContext.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("UPDATE users SET username = ?, password = ?, fullname = ?, email = ?, phonenumber = ?, address = ?, updated_at = NOW() WHERE userid = ?");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, fullname);
            ps.setString(4, email);
            ps.setString(5, phonenumber);
            ps.setString(6, address);
            ps.setString(7, userid);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
