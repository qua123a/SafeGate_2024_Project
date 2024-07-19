DROP DATABASE IF EXISTS mobile_store ;
CREATE DATABASE mobile_store;
USE mobile_store;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    fullname VARCHAR(100),
    money DECIMAL(15, 2) NOT NULL DEFAULT 0,
    role ENUM('customer', 'admin') DEFAULT 'customer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(15, 2) NOT NULL,
    stock INT NOT NULL,
    image_url VARCHAR(255),
    category_id INT,
    type ENUM('hidden', 'appear') DEFAULT 'appear', 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE carts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total DECIMAL(15, 2) NOT NULL,
    status ENUM('pending', 'transporting', 'completed', 'cancelled') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO users (username, email, password, fullname, role) VALUES
('cuonglz', 'cuong@example.com', 'cuong123', 'John Doe', 'customer'),
('hieudz', 'hieu@example.com', 'hieu123', 'Jane Smith', 'customer'),
('admin', 'admin@example.com', 'admin', 'Admin User', 'admin');

INSERT INTO categories (name) VALUES
('Xiaomi'),
('Apple'),
('Samsung'),
('Realme'),
('Vivo');

INSERT INTO products (name, description, price, stock, image_url, category_id) VALUES
('iPhone 13', 'Hiệu năng vượt trội nhờ chip Apple A15 Bionic', 14190000, 50, 'img/iphone-13.jpg', 2),
('iPhone 15 Pro Max', 'Hiệu năng Pro chiến game thả ga - Chip A17 Pro', 29490000, 50, 'img/iphone-15-promax.jpg', 2),
('Samsung Galaxy S21', 'Màn hình vô cực Infinity-O siêu mượt', 16890000, 30, 'img/samsung-s21.jpg', 3),
('iPhone 12 Pro Max', 'Mạnh mẽ, siêu nhanh với chip A14', 23490000, 20, 'img/iphone-12-promax.jpg', 2),
('Samsung Galaxy S24', 'Màn hình viền mỏng đều 4 cạnh trải nghiệm cực đã', 18990000, 15, 'img/samsung-s24.jpg', 3),
('Xiaomi 14 Ultra', 'Mượt mà với tần số quét 120Hz', 29990000, 20, 'img/xiaomi-14-ultra.png', 1),
('Xiaomi Redmi Note 13 Pro Plus', 'Camera 200MP cho khả năng nhiếp ảnh đỉnh cao', 9290000, 13, 'img/xiaomi-note-13.png', 1),
('Xiaomi Redmi A3', 'Nối tiếp bất ngờ với mặt lưng ấn tượng ', 2990000, 8, 'img/xiaomi-a3.jpg', 1),
('Realme C60', 'Trải nghiệm xem ấn tượng với 90Hz', 2490000, 15, 'img/realme-c60.jpg', 4),
('Realme 11 Pro', 'Màn hình hiển thị siêu rực rỡ, mượt mà', 4490000, 25, 'img/realme-11-pro.jpg', 4),
('Vivo iQOO Z9 Turbo', 'Hiệu năng mạnh mẽ cùng thiết kế hiện đại', 7190000, 12, 'img/vivo-iqoo-z9.jpg', 5),
('Samsung Galaxy A55', 'Sự kết hợp hoàn hảo giữa sắc màu và khung máy bền bỉ', 9690000, 30, 'img/samsung-a55.png', 3);

INSERT INTO comments (user_id, product_id, comment) VALUES
(2,1,'IPhone tốt vl');

INSERT INTO carts (user_id, product_id, quantity) VALUES
(2,1,3),
(2,3,1),
(2,6,2);

INSERT INTO orders (user_id, status, total) VALUES
(2, 'transporting', 3000000),
(2, 'pending', 10000000);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(2, 2, 2, 3000000),
(2, 1, 2, 3500000),
(1, 2, 1, 3000000);