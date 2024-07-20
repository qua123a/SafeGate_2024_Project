package com;

import DB.DBContext;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteProduct")
@MultipartConfig
public class DeleteProductServlet extends HttpServlet {

    private static final String IMAGE_DIRECTORY = "C:\\Users\\admin\\Documents\\ShoeStore\\web\\images\\";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        String productIdStr = request.getParameter("productid");

        // Validate if ProductID is a number
        int productId;
        try {
            productId = Integer.parseInt(productIdStr);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "You must enter ProductID with number, not character.");
            request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement checkStmt = null;
        ResultSet rs = null;

        try {
            conn = new DBContext().getConnection();
            String checkSql = "SELECT image FROM products WHERE ProductID = ?";
            checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setInt(1, productId);
            rs = checkStmt.executeQuery();

            if (!rs.next()) {
                request.setAttribute("message", "ProductID is not in the database.");
                request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
                return;
            }

            // Get the image file name
            String imageFileName = rs.getString("image");

            // Delete the image file from the file system
            File imageFile = new File(IMAGE_DIRECTORY + imageFileName);
            if (imageFile.exists() && imageFile.isFile()) {
                imageFile.delete();
            }

            // Delete the product from the database
            String deleteSql = "DELETE FROM products WHERE ProductID = ?";
            try (PreparedStatement deleteStmt = conn.prepareStatement(deleteSql)) {
                deleteStmt.setInt(1, productId);
                int rowsDeleted = deleteStmt.executeUpdate();
                if (rowsDeleted > 0) {
                    request.setAttribute("message", "Product deleted successfully!");
                } else {
                    request.setAttribute("message", "Failed to delete product.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (checkStmt != null) checkStmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }
}
