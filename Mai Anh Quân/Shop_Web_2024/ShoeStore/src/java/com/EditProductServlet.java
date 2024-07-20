package com;
import java.sql.ResultSet;
import DB.DBContext;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/editProduct")
@MultipartConfig
public class EditProductServlet extends HttpServlet {

    private static final String SAVE_DIR = "C:\\Users\\admin\\Documents\\ShoeStore\\web\\images";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        String productIdStr = request.getParameter("productid");
        String productName = request.getParameter("productname");
        String productDescription = request.getParameter("productdescription");
        String productPriceStr = request.getParameter("productprice");
        Part productImagePart = request.getPart("productimage");
        
         // Validate if ProductID is a number
        int productId;
        try {
            productId = Integer.parseInt(productIdStr);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "You must enter ProductID with number, not character.");
            request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
            return;
        }

        // Validate if ProductID exists in the database
        try (Connection conn = new DBContext().getConnection()) {
            String checkSql = "SELECT COUNT(*) FROM products WHERE ProductID = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                checkStmt.setInt(1, productId);
                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (rs.next() && rs.getInt(1) == 0) {
                        request.setAttribute("message", "ProductID not in the database.");
                        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
                        return;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
            return;
        }

        double productPrice;
        try {
            productPrice = Double.parseDouble(productPriceStr);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "You must enter a valid number for the product price.");
            request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
            return;
        }

        String imagePath = null;
        if (productImagePart != null && productImagePart.getSize() > 0) {
            String fileName = new File(productImagePart.getSubmittedFileName()).getName();
            File fileSaveDir = new File(SAVE_DIR);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
            }
            productImagePart.write(SAVE_DIR + File.separator + fileName);
            imagePath = "images/" + fileName;
        }

        try (Connection conn = new DBContext().getConnection()) {
            String sql = "UPDATE products SET ProductName = ?, Description = ?, Price = ?, image = ?, UpdatedAt = ? WHERE ProductID = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, productName);
                stmt.setString(2, productDescription);
                stmt.setDouble(3, productPrice);
                stmt.setString(4, imagePath);
                stmt.setTimestamp(5, Timestamp.from(Instant.now()));
                stmt.setInt(6, productId);

                int rowsUpdated = stmt.executeUpdate();
                if (rowsUpdated > 0) {
                    request.setAttribute("message", "Product updated successfully!");
                } else {
                    request.setAttribute("message", "Failed to update product.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error: " + e.getMessage());
        }

        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }
}
