package com;

import DB.DBContext;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {
    public static String find = "";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        List<Product> products;
        HttpSession session = request.getSession();

        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            products = searchProducts(searchQuery);
            session.setAttribute("searchQuery", searchQuery); // Lưu từ khóa tìm kiếm vào session
            find += searchQuery;
        } else {
            products = getFirstTwoProducts();
            session.removeAttribute("searchQuery"); // Xóa từ khóa tìm kiếm khỏi session nếu không có
        }

        request.setAttribute("products", products);
        request.getRequestDispatcher("userDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if ("addToCart".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            double price = Double.parseDouble(request.getParameter("price"));
            String image = request.getParameter("image");
            List<Product> cart = (List<Product>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
            }
            cart.add(new Product(productId, productName, price, image));
            session.setAttribute("cart", cart);
        } else if ("removeFromCart".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            List<Product> cart = (List<Product>) session.getAttribute("cart");
            if (cart != null) {
                // Tìm và xóa chỉ một lần đặt hàng của sản phẩm có productId
            for (Product product : cart) {
                if (product.getProductID() == productId) {
                    cart.remove(product);
                    break; // Sau khi xóa, thoát vòng lặp
                }
            }
            }
            session.setAttribute("cart", cart);
        }
        if(find!=""){
        response.sendRedirect("product?search=" + find);
        find = "";
        }else{
            response.sendRedirect("product?");
        }
    }

    private List<Product> getFirstTwoProducts() {
        List<Product> products = new ArrayList<>();
        DBContext dbContext = new DBContext();
        try (Connection conn = dbContext.getConnection()) {
            String sql = "SELECT * FROM products";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setDescription(rs.getString("Description"));
                product.setPrice(rs.getDouble("Price"));
                product.setImage(rs.getString("image"));
                products.add(product);
            }
            find = "";
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    private List<Product> searchProducts(String searchQuery) {
        List<Product> products = new ArrayList<>();
        DBContext dbContext = new DBContext();
        try (Connection conn = dbContext.getConnection()) {
            String sql = "SELECT * FROM products WHERE ProductName LIKE ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchQuery + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setDescription(rs.getString("Description"));
                product.setPrice(rs.getDouble("Price"));
                product.setImage(rs.getString("image"));
                products.add(product);
            }
            find = "";
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
