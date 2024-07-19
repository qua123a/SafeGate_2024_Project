create database cuongstore;
USE `cuongstore`;

DROP TABLE IF EXISTS `Accounts`;
CREATE TABLE `Accounts`(
    `AccountID` int AUTO_INCREMENT NOT NULL,
    `Username` varchar(100) NOT NULL,
    `Password` varchar(100) NOT NULL,
    `Email` varchar(50) NOT NULL,
    `Name` varchar(100) NULL,
    `Phone` varchar(100) NULL,
    `Adress` varchar(300) NULL,
    `Is_Staff` Tinyint NOT NULL,
    `Payments` decimal,
    PRIMARY KEY (AccountID) 
);
UPDATE `Accounts`
SET `Payments` = 1000000
where AccountID between 3 and 100;

DROP TABLE IF EXISTS `Publishers`;
CREATE TABLE `Publishers`(
    `PublisherID` int AUTO_INCREMENT NOT NULL,
    `PublisherName` varchar(100) NOT NULL,
    PRIMARY KEY (PublisherID) 
);

DROP TABLE IF EXISTS `Categories`;
CREATE TABLE `Categories`(
    `CategoryID` int AUTO_INCREMENT NOT NULL,
    `CategoryName` varchar(50) NULL,
    `Description` varchar(300) NULL,
    PRIMARY KEY (CategoryID) 
);

DROP TABLE IF EXISTS `Orders`;
CREATE TABLE `Orders`(
    `OrderID` int AUTO_INCREMENT NOT NULL,
    `AccountID` int NOT NULL,
    `Total_Price` double NULL,
    `OrderDate` date NULL,
    `Status` varchar(50) NULL,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`)
);

DROP TABLE IF EXISTS `Books`;
CREATE TABLE `Books`(
    `BookID` int AUTO_INCREMENT NOT NULL,
    `Title` varchar(250) NOT NULL,
    `PublisherID` int NOT NULL,
    `Price` decimal NOT NULL,
    `Quantity` int NOT NULL,
    `Image_Link` varchar(100) NULL,
    PRIMARY KEY (BookID),
    FOREIGN KEY (`PublisherID`) REFERENCES `Publishers` (`PublisherID`)
);


DROP TABLE IF EXISTS `Books_Categories`;
CREATE TABLE `Books_Categories`(
    `Book_CategoryID` int AUTO_INCREMENT NOT NULL,
    `CategoryID` int NOT NULL,
    `BookID` int NOT NULL,
    PRIMARY KEY (Book_CategoryID),
    FOREIGN KEY (`BookID`) REFERENCES `Books` (`BookID`),
    FOREIGN KEY (`CategoryID`) REFERENCES `Categories` (`CategoryID`)
);

DROP TABLE IF EXISTS `OrderItems`;
CREATE TABLE `OrderItems`(
    `OrderItemID` int AUTO_INCREMENT NOT NULL,
    `OrderID` int NOT NULL,
    `BookID` int NOT NULL,
    `Quantity` int NULL,
    `Unit_Price` double NULL,
    PRIMARY KEY (OrderItemID),
    FOREIGN KEY (`BookID`) REFERENCES `Books` (`BookID`),
    FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`)
);


DROP TABLE IF EXISTS `Cart`;
CREATE TABLE `Cart`(
    `CartID` int AUTO_INCREMENT NOT NULL,
    `AccountID` int NOT NULL,
    `BookID` int NOT NULL,
    `Quantity` int NOT NULL,
    `AddedDate` datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`CartID`),
    FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`),
    FOREIGN KEY (`BookID`) REFERENCES `Books` (`BookID`)
);

DROP TABLE IF EXISTS `Feedbacks`;
CREATE TABLE `Feedbacks`(
    `FeedbackID` int AUTO_INCREMENT NOT NULL,
    `AccountID` int NOT NULL,
    `BookID` int NOT NULL,
    `Feedback` text NOT NULL,
    `FeedbackDate` datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`FeedbackID`),
    FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`),
    FOREIGN KEY (`BookID`) REFERENCES `Books` (`BookID`)
);



-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` (`AccountID`, `Username`, `Password`, `Email`, `Is_Staff`) VALUES (1, 'cuong1', '123', 'cuong1@gmail.com', 1);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` (`Username`, `Password`, `Email`, `Is_Staff`) VALUES ( 'kieu21', '123', 'kieu1@gmail.com', 1);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` ( `Username`, `Password`, `Email`, `Is_Staff`) VALUES ( 'hieu1', '123', 'hieu1@gmail.com', 1);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` (`AccountID`, `Username`, `Password`, `Email`, `Is_Staff`) VALUES (5, 'khach1', '123', 'khach1@gmail.com', 0);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` (`AccountID`, `Username`, `Password`, `Email`, `Is_Staff`) VALUES (6, 'khach2', '123', 'khach2@gmail.com', 0);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` (`AccountID`, `Username`, `Password`, `Email`, `Is_Staff`) VALUES (7, 'khach3', '123', 'khach3@gmail.com', 0);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` (`AccountID`, `Username`, `Password`, `Email`, `Is_Staff`) VALUES (9, 'khach4', '123', 'khach4@gmail.com', 0);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` (`AccountID`, `Username`, `Password`, `Email`, `Is_Staff`) VALUES (11, 'khach5', '123', 'khach5@gmail.com', 0);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` (`AccountID`, `Username`, `Password`, `Email`, `Is_Staff`) VALUES (12, 'khach6', '123', 'khach6@gmail.com', 0);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` (`AccountID`, `Username`, `Password`, `Email`, `Is_Staff`) VALUES (13, 'khach7', '123', 'khach7@gmail.com', 0);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` (`AccountID`, `Username`, `Password`, `Email`, `Is_Staff`) VALUES (14, 'khach8', '123', 'khach8@gmail.com', 0);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` (`AccountID`, `Username`, `Password`, `Email`, `Is_Staff`) VALUES (15, 'khach9', '123', 'khach9@gmail.com', 0);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` (`AccountID`, `Username`, `Password`, `Email`, `Is_Staff`) VALUES (30, 'long1', '123', 'long1@gmail.com', 0);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` (`AccountID`, `Username`, `Password`, `Email`, `Is_Staff`) VALUES (31, 'long6', '123', 'long6@gmail.com', 0);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` (`AccountID`, `Username`, `Password`, `Email`, `Is_Staff`) VALUES (32, 'long12', '123', 'long12@gmail.com', 0);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` (`AccountID`, `Username`, `Password`, `Email`, `Is_Staff`) VALUES (33, 'long10', '123', 'long10@gmail.com', 0);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Accounts` (`AccountID`, `Username`, `Password`, `Email`, `Is_Staff`) VALUES (34, 'cuong', '123', 'cuong19@gmail.com', 0);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Categories` (`CategoryID`, `CategoryName`, `Description`) VALUES (1, 'Trinh thám', NULL);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Categories` (`CategoryID`, `CategoryName`, `Description`) VALUES (2, 'Hài hước', NULL);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Categories` (`CategoryID`, `CategoryName`, `Description`) VALUES (3, 'Viễn tưởng', NULL);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Categories` (`CategoryID`, `CategoryName`, `Description`) VALUES (4, 'Lãng mạn', NULL);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Categories` (`CategoryID`, `CategoryName`, `Description`) VALUES (5, 'Trưởng thành', NULL);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Categories` (`CategoryID`, `CategoryName`, `Description`) VALUES (6, 'Học đường', NULL);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Categories` (`CategoryID`, `CategoryName`, `Description`) VALUES (7, 'Hành động', NULL);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Categories` (`CategoryID`, `CategoryName`, `Description`) VALUES (8, 'Đời thường', NULL);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Categories` (`CategoryID`, `CategoryName`, `Description`) VALUES (9, 'Kinh điển', NULL);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Categories` (`CategoryID`, `CategoryName`, `Description`) VALUES (10, 'Triết lý', NULL);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Publishers` (`PublisherID`, `PublisherName`) VALUES (1, 'Kim Đồng');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Publishers` (`PublisherID`, `PublisherName`) VALUES (2, 'Trẻ');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Publishers` (`PublisherID`, `PublisherName`) VALUES (3, 'IPM');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Publishers` (`PublisherID`, `PublisherName`) VALUES (4, 'Amak');
INSERT `Publishers` (`PublisherID`, `PublisherName`) VALUES (5, 'Nhất Hạnh');
INSERT `Publishers` (`PublisherID`, `PublisherName`) VALUES (6, 'USUK');
INSERT `Publishers` (`PublisherID`, `PublisherName`) VALUES (7, 'Giáo dục');
INSERT `Publishers` (`PublisherID`, `PublisherName`) VALUES (8, 'Văn học');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Dragonball Super tập 1', 1, CAST(85000.00 AS Decimal(10, 2)), 23, 'images/book/dragonball/super1.jfif');
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Dragonball Super tập 2', 1, CAST(55000.00 AS Decimal(10, 2)), 54, 'images/book/dragonball/super2.jfif');
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Dragonball Super tập 3', 2, CAST(60000.00 AS Decimal(10, 2)), 44, 'images/book/dragonball/super3.jfif');
INSERT `Books` ( `Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Dragonball Super tập 15', 1, CAST(105000.00 AS Decimal(10, 2)), 53, 'images/book/dragonball/super15.jfif');






INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Thám Tử Lừng Danh Conan - Tập 1', 1, CAST(25000.00 AS Decimal(10, 2)), 22, 'images/book/conan/co1.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Thám Tử Lừng Danh Conan - Tập 2', 1, CAST(25000.00 AS Decimal(10, 2)), 23, 'images/book/conan/co2.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` ( `Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Thám Tử Lừng Danh Conan - Tập 3', 1, CAST(25000.00 AS Decimal(10, 2)), 23, 'images/book/conan/co3.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Thám Tử Lừng Danh Conan - Tập 4', 1, CAST(25000.00 AS Decimal(10, 2)), 23, 'images/book/conan/co4.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` ( `Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Thám Tử Lừng Danh Conan - Tập 5', 1, CAST(25000.00 AS Decimal(10, 2)), 23, 'images/book/conan/co5.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Thám Tử Lừng Danh Conan - Tập 6', 1, CAST(25000.00 AS Decimal(10, 2)), 23, 'images/book/conan/co6.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Thám Tử Lừng Danh Conan - Tập 7', 1, CAST(25000.00 AS Decimal(10, 2)), 23, 'images/book/conan/co7.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Thám Tử Lừng Danh Conan - Tập 8', 1, CAST(25000.00 AS Decimal(10, 2)), 26, 'images/book/conan/co8.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Thám Tử Lừng Danh Conan - Tập 9', 1, CAST(25000.00 AS Decimal(10, 2)), 26, 'images/book/conan/co9.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Thám Tử Lừng Danh Conan - Tập 10', 1, CAST(25000.00 AS Decimal(10, 2)), 23, 'images/book/conan/co10.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Thám Tử Lừng Danh Conan - Tập 11', 1, CAST(25000.00 AS Decimal(10, 2)), 23, 'images/book/conan/co11.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Thám Tử Lừng Danh Conan - Tập 12', 1, CAST(25000.00 AS Decimal(10, 2)), 23, 'images/book/conan/co12.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Thám Tử Lừng Danh Conan - Tập 13', 1, CAST(25000.00 AS Decimal(10, 2)), 23, 'images/book/conan/co13.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ( 'Thám Tử Lừng Danh Conan - Tập 14', 1, CAST(25000.00 AS Decimal(10, 2)), 20, 'images/book/conan/co14.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Thám Tử Lừng Danh Conan - Tập 15', 1, CAST(25000.00 AS Decimal(10, 2)), 23, 'images/book/conan/co15.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ( 'Thám Tử Lừng Danh Conan - Tập 16', 1, CAST(25000.00 AS Decimal(10, 2)), 32, 'images/book/conan/co16.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Thám Tử Lừng Danh Conan - Tập 17', 1, CAST(25000.00 AS Decimal(10, 2)), 32, 'images/book/conan/co17.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books` (`Title`, `PublisherID`, `Price`, `Quantity`, `Image_Link`) VALUES ('Thám Tử Lừng Danh Conan - Tập 18', 1, CAST(25000.00 AS Decimal(10, 2)), 38, 'images/book/conan/co18.jpg');
-- SQLINES LICENSE FOR EVALUATION USE ONLY

-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (324, 2, 3);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (325, 1, 3);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (326, 4, 3);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (327, 6, 3);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (328, 2, 4);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (329, 1, 4);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (330, 4, 4);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (331, 6, 4);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (332, 2, 5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (333, 1, 5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (334, 4, 5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (335, 6, 5);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (336, 2, 6);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (337, 1, 6);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (338, 4, 6);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (339, 6, 6);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (340, 2, 7);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (341, 1, 7);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (342, 4, 7);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (343, 6, 7);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (344, 2, 8);
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Books_Categories` (`Book_CategoryID`, `CategoryID`, `BookID`) VALUES (345, 1, 8);


INSERT `Orders` (`OrderID`, `AccountID`, `Total_Price`, `OrderDate`, `Status`) VALUES (1, 5, CAST(4400000.00 AS Decimal(12, 2)), CAST('2023-07-07' AS Date), 'Đã hoàn thành');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Orders` (`OrderID`, `AccountID`, `Total_Price`, `OrderDate`, `Status`) VALUES (2, 5, CAST(2700000.00 AS Decimal(12, 2)), CAST('2023-07-07' AS Date), 'Đã hoàn thành');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Orders` (`OrderID`, `AccountID`, `Total_Price`, `OrderDate`, `Status`) VALUES (9, 6, CAST(3675000.00 AS Decimal(12, 2)), CAST('2023-07-07' AS Date), 'Đã hoàn thành');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Orders` (`OrderID`, `AccountID`, `Total_Price`, `OrderDate`, `Status`) VALUES (10, 6, CAST(1200000.00 AS Decimal(12, 2)), CAST('2023-07-07' AS Date), 'Đã hoàn thành');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Orders` (`OrderID`, `AccountID`, `Total_Price`, `OrderDate`, `Status`) VALUES (11, 6, CAST(1560000.00 AS Decimal(12, 2)), CAST('2023-07-07' AS Date), 'Đã hoàn thành');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Orders` (`OrderID`, `AccountID`, `Total_Price`, `OrderDate`, `Status`) VALUES (12, 6, CAST(20304000.00 AS Decimal(12, 2)), CAST('2023-07-07' AS Date), 'Đã hoàn thành');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Orders` (`OrderID`, `AccountID`, `Total_Price`, `OrderDate`, `Status`) VALUES (13, 6, CAST(6075000.00 AS Decimal(12, 2)), CAST('2023-07-07' AS Date), 'Đã hoàn thành');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Orders` (`OrderID`, `AccountID`, `Total_Price`, `OrderDate`, `Status`) VALUES (14, 6, CAST(6075000.00 AS Decimal(12, 2)), CAST('2023-07-07' AS Date), 'Đã hoàn thành');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Orders` (`OrderID`, `AccountID`, `Total_Price`, `OrderDate`, `Status`) VALUES (15, 6, CAST(486000.00 AS Decimal(12, 2)), CAST('2023-07-07' AS Date), 'Đã hoàn thành');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Orders` (`OrderID`, `AccountID`, `Total_Price`, `OrderDate`, `Status`) VALUES (16, 6, CAST(216000.00 AS Decimal(12, 2)), CAST('2023-07-07' AS Date), 'Đã hoàn thành');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `Orders` (`OrderID`, `AccountID`, `Total_Price`, `OrderDate`, `Status`) VALUES (18, 7, CAST(3675000.00 AS Decimal(12, 2)), CAST('2023-07-07' AS Date), 'Đã hoàn thành');

-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `OrderItems` (`OrderItemID`, `OrderID`, `BookID`, `Quantity`, `Unit_Price`) VALUES (1, 1, 3, 3, CAST(25000.00 AS Decimal(8, 2)));
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `OrderItems` (`OrderItemID`, `OrderID`, `BookID`, `Quantity`, `Unit_Price`) VALUES (2, 1, 3, 1, CAST(25000.00 AS Decimal(8, 2)));
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `OrderItems` (`OrderItemID`, `OrderID`, `BookID`, `Quantity`, `Unit_Price`) VALUES (3, 1, 4, 3, CAST(25000.00 AS Decimal(8, 2)));
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `OrderItems` (`OrderItemID`, `OrderID`, `BookID`, `Quantity`, `Unit_Price`) VALUES (4, 1, 5, 3, CAST(25000.00 AS Decimal(8, 2)));
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `OrderItems` (`OrderItemID`, `OrderID`, `BookID`, `Quantity`, `Unit_Price`) VALUES (5, 1, 6, 3, CAST(25000.00 AS Decimal(8, 2)));
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `OrderItems` (`OrderItemID`, `OrderID`, `BookID`, `Quantity`, `Unit_Price`) VALUES (6, 1, 7, 3, CAST(25000.00 AS Decimal(8, 2)));
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `OrderItems` (`OrderItemID`, `OrderID`, `BookID`, `Quantity`, `Unit_Price`) VALUES (7, 1, 8, 3, CAST(25000.00 AS Decimal(8, 2)));
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `OrderItems` (`OrderItemID`, `OrderID`, `BookID`, `Quantity`, `Unit_Price`) VALUES (8, 1, 9, 3, CAST(25000.00 AS Decimal(8, 2)));
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `OrderItems` (`OrderItemID`, `OrderID`, `BookID`, `Quantity`, `Unit_Price`) VALUES (9, 2, 10, 3, CAST(25000.00 AS Decimal(8, 2)));
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT `OrderItems` (`OrderItemID`, `OrderID`, `BookID`, `Quantity`, `Unit_Price`) VALUES (10, 2, 11, 3, CAST(25000.00 AS Decimal(8, 2)));


INSERT INTO `Feedbacks` (`AccountID`, `BookID`, `Feedback`, `FeedbackDate`)
VALUES 
(32, 22, 'Sách viết tâm đắc', '2023-07-13 23:00:00'),
(32, 13, 'Just okay.', '2023-07-18 23:00:00'),
(5, 3, 'Great book!', '2023-07-07 12:00:00'),
(6, 4, 'Interesting read.', '2023-07-08 13:00:00'),
(7, 5, 'Loved it!', '2023-07-09 14:00:00'),
(9, 6, 'Not my favorite.', '2023-07-10 15:00:00'),
(11, 7, 'Fantastic story!', '2023-07-11 16:00:00'),
(12, 8, 'Pretty good.', '2023-07-12 17:00:00'),
(13, 9, 'Could be better.', '2023-07-13 18:00:00'),
(14, 10, 'Amazing book!', '2023-07-14 19:00:00'),
(15, 11, 'Very enjoyable.', '2023-07-15 20:00:00'),
(30, 12, 'Excellent read.', '2023-07-16 21:00:00'),
(31, 13, 'Highly recommended.', '2023-07-17 22:00:00'),
(32, 14, 'Just okay.', '2023-07-18 23:00:00'),
(33, 15, 'Not bad.', '2023-07-19 00:00:00'),
(34, 16, 'Well written.', '2023-07-20 01:00:00');

INSERT INTO `Feedbacks` (`AccountID`, `BookID`, `Feedback`)
VALUES 
(32, 22, 'Sách viết tâm đắc');