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

@WebServlet(name = "LoginServlet", urlPatterns = {"/login", "/register"})
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        if ("/login".equals(action)) {
            handleLogin(request, response);
        } else if ("/register".equals(action)) {
            handleRegister(request, response);
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Kiểm tra thông tin đăng nhập từ cơ sở dữ liệu
        String userType = getUserType(username, password);
        if (userType != null) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

            if (userType.equals("admin")) {
                response.sendRedirect("adminDashboard.jsp");
            } else {
                response.sendRedirect("product");
            }
        } else {
            response.sendRedirect("loginFailed.jsp");
        }
    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String phonenumber = request.getParameter("phonenumber");
        String address = request.getParameter("address");
        // Thêm người dùng mới vào cơ sở dữ liệu
        if (registerUser(username, password, email, fullname, phonenumber, address)) {
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("registerFailed.jsp");
        }
    }

    private String getUserType(String username, String password) {
        DBContext dbContext = new DBContext();
        try (Connection conn = dbContext.getConnection()) {
            // Kiểm tra trong bảng admin trước
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM admin WHERE username = ? AND password = ?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return "admin";
            }

            // Kiểm tra trong bảng users
            ps = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                return "user";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private boolean registerUser(String username, String password, String email, String fullname, String phonenumber, String address) {
        DBContext dbContext = new DBContext();
        try (Connection conn = dbContext.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO users (username, password, email, fullname, phonenumber, address) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, fullname);
            ps.setString(5, phonenumber);
            ps.setString(6, address);
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
