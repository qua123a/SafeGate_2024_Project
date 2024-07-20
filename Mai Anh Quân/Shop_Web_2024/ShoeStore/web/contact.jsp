<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>ShoeStore - Contact Us</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <style>
       .social-links {
            display: flex;
            gap: 20px; /* Khoảng cách giữa các biểu tượng */
            justify-content: center; /* Căn giữa các biểu tượng */
        }

        .social-link img {
            width: 40px; /* Đặt chiều rộng của biểu tượng */
            height: 40px; /* Đặt chiều cao của biểu tượng */
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Welcome to ShoeStore - Contact Us</h1>
        </header>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
                <li><a href="about.jsp">About Us</a></li>
            </ul>
        </nav>
        <main>
            <div class="social-links">
                <a class="social-link" href="https://www.facebook.com/yourpage" target="_blank">
                    <img src="images/face.jpg" alt="Facebook">
                </a>
                <a class="social-link" href="https://www.instagram.com/yourpage" target="_blank">
                    <img src="images/instagram.jpg" alt="Instagram">
                </a>
            </div>
        </main>
        <footer>
            <p>&copy; 2024 ShoeStore. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>
