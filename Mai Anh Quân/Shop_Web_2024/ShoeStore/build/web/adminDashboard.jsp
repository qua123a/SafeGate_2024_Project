<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
         body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .header, .footer {
            background-color: black;
            color: white;
            text-align: center;
            padding: 10px 0;
        }
        .content {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 20px;
            margin: 20px;
            text-align: center;
        }
        .btn {
            padding: 10px 20px;
            color: white;
            background-color: black;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: grey;
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            top: 100%;
            left: 0;
        }
        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }
        .dropdown-content a:hover {
            background-color: #ddd;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .logout-btn {
            background-color: black;
        }
        .logout-btn:hover {
            background-color: darkred;
        }
        .form-container {
            display: none;
            margin-top: 20px;
        }
        .form-container input, .form-container button {
            display: block;
            margin: 10px auto;
            padding: 10px;
            width: 80%;
        }
        .form-container button {
            background-color: black;
            color: white;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: grey;
        }
        .message {
            color: green;
            font-weight: bold;
            margin-top: 20px;
        }
        .error {
            color: red;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
    <script>
        function toggleForm(formId) {
            var forms = document.getElementsByClassName('form-container');
            for (var i = 0; i < forms.length; i++) {
                forms[i].style.display = 'none';
            }
            var form = document.getElementById(formId);
            form.style.display = 'block';
        }
    </script>
</head>
<body>
    <div class="header">
        <h1>Welcome to Admin Dashboard</h1>
    </div>

    <div class="content">
        <div class="dropdown">
            <button class="btn">Manage Users</button>
            <div class="dropdown-content">
                <a href="javascript:void(0);" onclick="toggleForm('addUserForm')">Add Users</a>
                <a href="javascript:void(0);" onclick="toggleForm('editUserForm')">Edit Users</a>
                <a href="javascript:void(0);" onclick="toggleForm('deleteUserForm')">Delete Users</a>
            </div>
        </div>
        <div class="dropdown">
            <button class="btn">Manage Products</button>
            <div class="dropdown-content">
                <a href="javascript:void(0);" onclick="toggleForm('addProductForm')">Add Products</a>
                <a href="javascript:void(0);" onclick="toggleForm('editProductForm')">Edit Products</a>
                <a href="javascript:void(0);" onclick="toggleForm('deleteProductForm')">Delete Products</a>
            </div>
        </div>
        <form action="logout" method="post" style="display:inline;">
            <button type="submit" class="btn logout-btn">Log Out</button>
        </form>
    </div>

    <% 
        String message = (String) request.getAttribute("message");
        if (message != null) {
            if (message.contains("success") || message.contains("Successfully")) { 
    %>
                <div class="message"><%= message %></div>
    <% 
            } else { 
    %>
                <div class="error"><%= message %></div>
    <% 
            } 
        } 
    %>

    <div id="addUserForm" class="form-container">
        <h2>Add User</h2>
        <form action="addUser" method="post">
            <input type="text" name="userid" placeholder="User ID" required>
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="text" name="fullname" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" name="phonenumber" placeholder="Phone Number" required>
            <input type="text" name="address" placeholder="Address" required>
            <button type="submit">Add</button>
        </form>
    </div>

    <div id="editUserForm" class="form-container">
        <h2>Edit User</h2>
        <form action="editUser" method="post">
            <input type="text" name="userid" placeholder="User ID" required>
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="text" name="fullname" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" name="phonenumber" placeholder="Phone Number" required>
            <input type="text" name="address" placeholder="Address" required>
            <button type="submit">Edit</button>
        </form>
    </div>

    <div id="deleteUserForm" class="form-container">
        <h2>Delete User</h2>
        <form action="deleteUser" method="post">
            <input type="text" name="userid" placeholder="User ID" required>
            <button type="submit">Delete</button>
        </form>
    </div>

    <div id="addProductForm" class="form-container">
        <h2>Add Product</h2>
        <form action="addProduct" method="post" enctype="multipart/form-data">
            <input type="text" name="productid" placeholder="Product ID" required>
            <input type="text" name="productname" placeholder="Product Name" required>
            <input type="text" name="productdescription" placeholder="Product Description" required>
            <input type="number" name="productprice" placeholder="Product Price" required>
            <input type="file" name="productimage" accept="images/*" required>
            <button type="submit">Add</button>
        </form>
    </div>

    <div id="editProductForm" class="form-container">
        <h2>Edit Product</h2>
        <form action="editProduct" method="post" enctype="multipart/form-data">
            <input type="text" name="productid" placeholder="Product ID" required>
            <input type="text" name="productname" placeholder="Product Name" required>
            <input type="text" name="productdescription" placeholder="Product Description" required>
            <input type="number" name="productprice" placeholder="Product Price" required>
            <input type="file" name="productimage" accept="images/*" required>
            <button type="submit">Edit</button>
        </form>
    </div>

    <div id="deleteProductForm" class="form-container">
        <h2>Delete Product</h2>
        <form action="deleteProduct" method="post">
            <input type="text" name="productid" placeholder="Product ID" required>
            <button type="submit">Delete</button>
        </form>
    </div>

    <div class="footer">
        <p>&copy; 2024 ShoeStore. All rights reserved.</p>
    </div>
</body>
</html>
