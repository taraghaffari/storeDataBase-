CREATE DATABASE IF NOT EXISTS shop;
USE shop;

CREATE TABLE IF NOT EXISTS customers (
    email VARCHAR(50) PRIMARY KEY,
    fname VARCHAR(20),
    lname VARCHAR(20),
    loginpassword VARCHAR(100),  
    address VARCHAR(1000),
    postalcode VARCHAR(20),     
    phonenumber BIGINT,     
    province VARCHAR(20),
    city VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS admins (
    adminId INT PRIMARY KEY,
    fname VARCHAR(20),
    lname VARCHAR(20),
    loginpassword VARCHAR(100), 
    phonenumber VARCHAR(15),
    province VARCHAR(20),
    city VARCHAR(20),
    branch VARCHAR(10),
    workingtime VARCHAR(10)
);
CREATE TABLE IF NOT EXISTS products (
    imageUrl VARCHAR(300) ,
    productCode VARCHAR(20) PRIMARY KEY,
    productName VARCHAR(20),
    weight DOUBLE,
  color VARCHAR(10),
    category VARCHAR(20),  
    banner VARCHAR(15),
    stock INT,
    productInfo VARCHAR(500)
);
CREATE TABLE IF NOT EXISTS orders (
    orderCode BIGINT PRIMARY KEY,
    email VARCHAR(50),
    paymentStatus VARCHAR(10),
    price BIGINT,
    purchaseType VARCHAR(20),
    shippingStatus VARCHAR(20),
    ordersDateTime DATETIME,
    FOREIGN KEY (email) REFERENCES customers(email)
);
CREATE TABLE IF NOT EXISTS cartItems (
    orderCode BIGINT,
    productCode VARCHAR(20),
    price BIGINT,
    orderQuantity INT,
    shoppingDateTime DATETIME,
    PRIMARY KEY (orderCode, productCode),  
    FOREIGN KEY (orderCode) REFERENCES orders(orderCode),
    FOREIGN KEY (productCode) REFERENCES products(productCode)
);

CREATE TABLE IF NOT EXISTS store_transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orderCode BIGINT,
    email VARCHAR(50),
    sourceCard BIGINT,  
    amount BIGINT,
    transactionsDateTime DATETIME,
    FOREIGN KEY (orderCode) REFERENCES orders(orderCode),
    FOREIGN KEY (email) REFERENCES customers(email)
);

CREATE TABLE IF NOT EXISTS stock (
    productCode VARCHAR(20),
    branch VARCHAR(10),
    shelf INT,
    rowP INT,
    PRIMARY KEY (productCode, branch), 
    FOREIGN KEY (productCode) REFERENCES products(productCode)
);