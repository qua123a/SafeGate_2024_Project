<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>ShoeStore - Home</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <style>
        .shoe-images {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin: 20px 0;
        }
        .shoe-images img {
            max-width: 300px;
            height: 100px;
            margin: 10px;
            border: 2px solid #ccc;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Welcome to ShoeStore - Home</h1>
        </header>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
                <li><a href="about.jsp">About Us</a></li>
            </ul>
        </nav>
        <main>
            <div class="shoe-images">
                <img src="images/nike_air_max.jpg" alt="Shoe 1">
                <img src="images/timberland_boots.jpg" alt="Shoe 2">
                <img src="images/birkenstock_sandals.jpg" alt="Shoe 3">
                <img src="images/curry.jpg" alt="Shoe 4">
                <img src="images/kyrie.jpg" alt="Shoe 5">
            </div>
            <h2>Login</h2>
            <form action="login" method="post">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <button type="submit">Login</button>
            </form>
            <p>Don't have an account? <a href="register.jsp">Register here</a></p>
        </main>
        <footer>
            <p>&copy; 2024 ShoeStore. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>
