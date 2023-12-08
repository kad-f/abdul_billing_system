-- Table for user information
CREATE TABLE invoice_user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address TEXT,
    mobile VARCHAR(15),
    password VARCHAR(255) NOT NULL
);

-- Table for invoices
CREATE TABLE invoice_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_receiver_name VARCHAR(100) NOT NULL,
    order_receiver_address TEXT NOT NULL,
    order_total_before_tax DECIMAL(10, 2) NOT NULL,
    order_total_tax DECIMAL(10, 2) NOT NULL,
    order_tax_per DECIMAL(5, 2) NOT NULL,
    order_total_after_tax DECIMAL(10, 2) NOT NULL,
    order_amount_paid DECIMAL(10, 2) NOT NULL,
    order_total_amount_due DECIMAL(10, 2) NOT NULL,
    note TEXT,
    FOREIGN KEY (user_id) REFERENCES invoice_user(id)
);

-- Table for items in each invoice
CREATE TABLE invoice_order_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    item_code VARCHAR(50) NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    order_item_quantity INT NOT NULL,
    order_item_price DECIMAL(10, 2) NOT NULL,
    order_item_final_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES invoice_order(order_id)
);
