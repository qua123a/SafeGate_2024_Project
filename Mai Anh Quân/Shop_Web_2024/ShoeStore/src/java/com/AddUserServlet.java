package com;

import DB.DBContext;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/addUser")
public class AddUserServlet extends HttpServlet {

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
        }else if(addUser(userid, username, password, fullname, email, phonenumber, address)){
            message = "User added Sucessfully!";
        }
        else {
            message = "User ID already exists!";
        }
        
        request.setAttribute("message", message);
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminDashboard.jsp");
        dispatcher.forward(request, response);
    }

    private boolean addUser(String userid, String username, String password, String fullname, String email, String phonenumber, String address) {
        DBContext dbContext = new DBContext();
        try (Connection conn = dbContext.getConnection()) {
            // Check if the user ID already exists
            PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM users WHERE userid = ?");
            checkStmt.setString(1, userid);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                return false; // User ID already exists
            }

            // Insert new user
            PreparedStatement ps = conn.prepareStatement("INSERT INTO users (userid, username, password, fullname, email, phonenumber, address, createdat) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())");
            ps.setString(1, userid);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.setString(4, fullname);
            ps.setString(5, email);
            ps.setString(6, phonenumber);
            ps.setString(7, address);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
