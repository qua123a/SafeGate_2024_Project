<%@ page import="java.util.List" %>
<%@ page import="com.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>ShoeStore - User Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <style>
        .container {
            width: 100%;
            height: 100%;
            margin: auto;
            text-align: center;
        }
        .menu-button {
            position: absolute;
            top: 10px;
            left: 20px;
        }
        .product {
            display: inline-block;
            margin: 20px;
            border: 1px solid #ddd;
            padding: 10px;
            width: 200px;
        }
        .product img {
            width: 100%;
            height: 30%;
            widows: 70%;
        }
        .product .description {
            font-size: 14px;
            margin: 10px 0;
        }
        .product .price {
            font-size: 16px;
            font-weight: bold;
        }
        .product .add-to-cart {
            margin-top: 10px;
        }
        .cart {
            margin-top: 60px;
            border-top: 10px solid #ddd;
            padding-top: 20px;
            max-height: 300px; /* Thêm thanh cuộn khi danh sách quá dài */
            overflow-y: auto; /* Thanh cuộn dọc */
        }
        .cart-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .checkout {
            text-align: right;
            margin-top: 20px;
        }
        .logout {
            position: absolute;
            top: 10px;
            right: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <%
            String username = (String) session.getAttribute("username");
            if (username == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <h1>Welcome to ShoeStore, <%= username %></h1>
        <form action="logout" method="post" class="logout">
            <button type="submit">Logout</button>
        </form>
        <!-- Menu Button -->
        <button class="menu-button" onclick="goToMenu()">Menu</button>
    </header>
    
    <main>
        <h2>Product Search</h2>
        <form action="product" method="get">
            <input type="text" name="search" placeholder="Search for products...">
            <button type="submit">Search</button>
        </form>
        
        <h2>Products</h2>
        <div id="product-list">
            <%
                List<Product> products = (List<Product>) request.getAttribute("products");
                if (products != null) {
                    for (Product product : products) {
            %>
                        <div class="product">
                            <img src="<%= product.getImage() %>" alt="<%= product.getProductName() %>">
                            <div class="productname"><%= product.getProductName() %></div>
                            <div class="description"><%= product.getDescription() %></div>
                            <div class="price">$<%= product.getPrice() %></div>
                            <div class="add-to-cart">
                                <form action="product" method="post">
                                    <input type="hidden" name="action" value="addToCart">
                                    <input type="hidden" name="productId" value="<%= product.getProductID() %>">
                                    <input type="hidden" name="productName" value="<%= product.getProductName() %>">
                                    <input type="hidden" name="price" value="<%= product.getPrice() %>">
                                    <input type="hidden" name="image" value="<%= product.getImage() %>">
                                    <button type="submit">Add to cart</button>
                                </form>
                            </div>
                        </div>
            <%
                    }
                }
            %>
        </div>
        
        <div class="cart">
            <h2>Shopping Cart</h2>
            <div id="cart-items">
                <%
                    List<Product> cart = (List<Product>) session.getAttribute("cart");
                    if (cart != null) {
                        for (Product item : cart) {
                %>
                            <div class="cart-item">
                                <span>
                                    <img src="<%= item.getImage() %>" alt="<%= item.getProductName() %>" style="width:50px; height:100px; vertical-align:middle;">
                                    <%= item.getProductName() %> - $<%= item.getPrice() %>
                                </span>
                                <form action="product" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="removeFromCart">
                                    <input type="hidden" name="productId" value="<%= item.getProductID() %>">
                                    <button type="submit">Delete Order</button>
                                </form>
                            </div>
                <%
                        }
                    }
                %>
            </div>
            <div class="checkout">
                <%
                    double totalAmount = 0;
                    if (cart != null) {
                        for (Product item : cart) {
                            totalAmount += item.getPrice();
                        }
                    }
                %>
                <span>Total: $<%= String.format("%.2f", totalAmount) %></span>
                <button onclick="checkout()">Checkout</button>
            </div>
        </div>
        
        <!-- Feedback Section -->
        <div class="feedback">
            <h2>Feedback</h2>
            <form action="feedback" method="post">
                <textarea name="message" placeholder="Enter your feedback..." rows="4" cols="50"></textarea><br>
                <button type="submit">Send Feedback</button>
            </form>
        </div>
        <%
    Boolean feedbackSent = (Boolean) session.getAttribute("feedbackSent");
    if (feedbackSent != null && feedbackSent) {
%>
    <script>
        alert("Feedback has been sent to the suppliers.");
    </script>
<%
    session.removeAttribute("feedbackSent"); // Remove the attribute after displaying the message
}
%>
    </main>
</div>

<script>
    function goToMenu() {
        // Điều hướng đến trang menu
        window.location.href = 'product?';
    }

    function checkout() {
        // Điều hướng đến trang thanh toán
        window.location.href = 'checkout.jsp';
    }
</script>
