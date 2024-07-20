package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import DB.DBContext;
import jakarta.servlet.http.HttpSession;
import java.io.File;

@WebServlet("/addProduct")
@MultipartConfig
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        String productId = request.getParameter("productid");
        String productName = request.getParameter("productname");
        String description = request.getParameter("productdescription");
        String price = request.getParameter("productprice");
        String categoryId = request.getParameter("categoryid");
        Part productImage = request.getPart("productimage");

        // Process the image part
        String fileName = extractFileName(productImage);
        String savePath = "images/" + fileName; // Lưu trữ chỉ phần tên ảnh

        // Lưu ảnh vào thư mục trên server
        String appPath = request.getServletContext().getRealPath("");
        String saveDirectory = appPath + File.separator + "images";
        File fileSaveDir = new File(saveDirectory);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        productImage.write(saveDirectory + File.separator + fileName);

        // Save the product details to the database
        try (Connection conn = new DBContext().getConnection()) {
            String sql = "INSERT INTO products (ProductID, ProductName, Description, Price, CategoryID, CreatedAt, Image) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, productId);
                ps.setString(2, productName);
                ps.setString(3, description);
                ps.setDouble(4, Double.parseDouble(price));
                ps.setString(5, categoryId);
                ps.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
                ps.setString(7, savePath);

                int rowsInserted = ps.executeUpdate();
                if (rowsInserted > 0) {
                    request.setAttribute("message", "Product added successfully");
                } else {
                    request.setAttribute("message", "Failed to add product");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred: " + e.getMessage());
        }

        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
