CREATE TABLE category (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    characteristic TEXT
);

CREATE TABLE brand (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100)
);

CREATE TABLE goods (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    brand_id INT NOT NULL,
    availability INT DEFAULT 0,
    CONSTRAINT fk_goods_category FOREIGN KEY (category_id) REFERENCES category(id),
    CONSTRAINT fk_goods_brand FOREIGN KEY (brand_id) REFERENCES brand(id)
);

CREATE TABLE "user" (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(50)
);

CREATE TABLE "order" (
    id INT PRIMARY KEY,
    user_id INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    delivery_address TEXT,
    CONSTRAINT fk_order_user FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE order_item (
    id INT PRIMARY KEY,
    order_id INT NOT NULL,
    goods_id INT NOT NULL,
    quantity INT NOT NULL,
    final_price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_order_item_order FOREIGN KEY (order_id) REFERENCES "order"(id) ON DELETE CASCADE,
    CONSTRAINT fk_order_item_goods FOREIGN KEY (goods_id) REFERENCES goods(id)
);
