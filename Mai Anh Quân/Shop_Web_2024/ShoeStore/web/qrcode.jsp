<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>ShoeStore - QR Code Payment</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <style>
        .container {
            width: 80%;
            margin: auto;
            text-align: center;
        }
        .logout {
            position: absolute;
            top: 10px;
            right: 20px;
        }
        header, footer {
            margin: 20px 0;
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
            <h1>ShoeStore - Payment</h1>
            <form action="logout" method="post" class="logout">
                <button type="submit">Logout</button>
            </form>
        </header>   
        
        <main>
            <h2>If you have a bank account, here is our QR code:</h2>
            <img src="images/qrcode.jpg" alt="QR Code for Payment">
            <p>Or you can proceed payment by cash with our employee, we accept cash.</p>
        </main>
        
        <footer>
            <p>&copy; 2024 ShoeStore. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>
