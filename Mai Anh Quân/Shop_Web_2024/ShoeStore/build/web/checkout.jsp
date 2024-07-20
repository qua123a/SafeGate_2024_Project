<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>ShoeStore - Checkout</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <style>
        .container {
            width: 100%;
            height: 100%;
            margin: auto;
            text-align: center;
        }
        .checkout-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }
        .checkout-item img {
            width: 50px;
            height: 50px;
            margin-right: 10px;
        }
        .checkout-item span {
            flex-grow: 1;
        }
        .total {
            font-weight: bold;
            font-size: 18px;
            margin-top: 20px;
        }
        .logout {
            position: absolute;
            top: 10px;
            right: 20px;
        }
        .checkout-button {
            margin-top: 10px;
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
            <h1>Checkout - ShoeStore, <%= username %></h1>
            <form action="logout" method="post" class="logout">
                <button type="submit">Logout</button>
            </form>
        </header>

        <main>
            <h2>Your Order Summary</h2>
            <div id="checkout-list">
                <%
                    List<Product> cart = (List<Product>) session.getAttribute("cart");
                    double overallTotal = 0;
                    if (cart != null) {
                        // Count quantities of each product
                        Map<Integer, Integer> productQuantities = new HashMap<>();
                        for (Product item : cart) {
                            productQuantities.put(item.getProductID(), productQuantities.getOrDefault(item.getProductID(), 0) + 1);
                        }
                        
                        // Display products with quantities
                        for (Map.Entry<Integer, Integer> entry : productQuantities.entrySet()) {
                            int productId = entry.getKey();
                            int quantity = entry.getValue();
                            Product product = null;
                            for (Product item : cart) {
                                if (item.getProductID() == productId) {
                                    product = item;
                                    break;
                                }
                            }
                            if (product != null) {
                                double total = product.getPrice() * quantity;
                                overallTotal += total;
                %>
                                <div class="checkout-item">
                                    <img src="<%= product.getImage() %>" alt="<%= product.getProductName() %>">
                                    <span><%= product.getProductName() %> - $<%= product.getPrice() %> x <%= quantity %> = $<%= String.format("%.2f", total) %></span>
                                </div>
                <%
                            }
                        }
                    }
                %>
            </div>
            <div class="total">
                <span>Total Amount: $<%= String.format("%.2f", overallTotal) %></span>
            </div>
            <div class="checkout-button">
                <button onclick="processPayment()">Proceed to Payment</button>
            </div>
        </main>
    </div>

    <script>
         function processPayment() {
        // Navigate to the checkout.jsp page for payment processing
        window.location.href = 'qrcode.jsp';
    }
    </script>
</body>
</html>
