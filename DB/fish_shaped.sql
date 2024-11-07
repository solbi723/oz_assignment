CREATE DATABASE IF NOT EXISTS fish_shaped_bun_shop;

USE fish_shaped_bun_shop;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS raw_materials;
DROP TABLE IF EXISTS stocks;
DROP TABLE IF EXISTS daily_records;
DROP TABLE IF EXISTS order_records;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS sales_records;
DROP TABLE IF EXISTS sales_items;

CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY, -- 인덱싱
	first_name VARCHAR(50), -- 이름
	last_name VARCHAR(20) NOT NULL, -- 성
	email VARCHAR(50) NOT NULL UNIQUE, -- 이메일
    gender BOOLEAN NOT NULL, -- 성별 
	password VARCHAR(255) NOT NULL UNIQUE, -- 비밀번호
	address VARCHAR(255), -- 주소
	contact VARCHAR(50), -- 전화번호
	is_active BOOLEAN NOT NULL DEFAULT TRUE, -- 활성화된 계정인지 확인하는 컬럼
	is_staff BOOLEAN NOT NULL DEFAULT FALSE, -- 직원인지 확인하는 컬럼
	is_orderable BOOLEAN NOT NULL DEFAULT FALSE -- 주문 권한이 있는지 확인하는 컬럼
);

CREATE TABLE raw_materials (
	id INT AUTO_INCREMENT PRIMARY KEY, -- 인덱싱
	name VARCHAR(50) NOT NULL, -- 원재료 이름
	price DECIMAL(10, 2) NOT NULL -- 원재료 가격
);

CREATE TABLE stocks(
	id INT AUTO_INCREMENT PRIMARY KEY, -- 인덱싱
	raw_material_id INT NOT NULL, -- 원재료 id
	quantity INT NOT NULL, -- 수량
	last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 마지막 업데이트 시간
	FOREIGN KEY (raw_material_id) REFERENCES raw_materials(id)
);

CREATE TABLE daily_records(
	id INT AUTO_INCREMENT PRIMARY KEY, -- 인덱싱
	stock_id INT,-- stocks 테이블의 id
	change_quantity INT, -- 변경된 수량
	change_type ENUM('IN', 'OUT', 'RETURNED', 'DISCARDED'), -- 입고(IN) 출고(OUT) 반품(RETURNED) 폐기(DISCARDED)
	change_date DATETIME DEFAULT CURRENT_TIMESTAMP, -- 변경된 시간
	FOREIGN KEY (stock_id) REFERENCES stocks(id)
);

CREATE TABLE order_records(
	id INT AUTO_INCREMENT PRIMARY KEY, -- 인덱싱
	user_id INT, -- users 테이블의 id
	raw_material_id INT, -- raw_material 테이블의 id
	quantity INT NOT NULL, -- 수량
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP, -- 변경된 시간
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (raw_material_id) REFERENCES raw_materials(id)
);

CREATE TABLE products(
	id INT AUTO_INCREMENT PRIMARY KEY, -- 인덱싱
	name VARCHAR(50) NOT NULL, -- 상품 이름
	description TEXT, -- 상품 설명
	price DECIMAL(7, 2) NOT NULL -- 상품 가격
);

CREATE TABLE sales_records(
	id INT AUTO_INCREMENT PRIMARY KEY, -- 인덱싱
	user_id INT, -- users 테이블의 id
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- 생성 시간
	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE sales_items(
	id INT AUTO_INCREMENT PRIMARY KEY, -- 인덱싱
	sales_record_id INT, -- sales_records의 id
	product_id INT, -- products의 id
	quantity INT NOT NULL, -- 수량
	FOREIGN KEY (sales_record_id) REFERENCES sales_records(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);

SELECT * FROM products WHERE name = 'Dumpling bun';

INSERT INTO 
users(
    first_name,
    last_name,
    email,
    password,
    address,
    contact,
    gender
)
VALUES(
    "Banana",
    "Milk",
    "banana123@banana.com",
    "ekfjabsgjb1l4",
    "oz-coding-school",
    "010-1234-5678",
    TRUE
);

UPDATE users
SET address = "new-oz-coding-school"
WHERE id = 201;


SELECT * FROM users WHERE id=201;

-- 1. sales_records 데이터 생성 (Banana Milk의 주문)
INSERT INTO sales_records(user_id)
VALUES(201);
-- 확인: sales_records에서 Banana Milk의 주문이 제대로 생성되었는지 확인
SELECT * FROM sales_records;

-- 2. sales_items 데이터 생성 (팥 붕어빵, 크림 붕어빵, 시그니처 메뉴)
-- 팥 붕어빵 3개
INSERT INTO sales_items(sales_record_id, product_id, quantity)
VALUES(
    (SELECT id FROM sales_records WHERE user_id = 201 ORDER BY id DESC LIMIT 1), 
    (SELECT id FROM products WHERE name = "Red Bean Bun"), 
    3
);
-- 크림 붕어빵 2개
INSERT INTO sales_items(sales_record_id, product_id, quantity)
VALUES(
    (SELECT id FROM sales_records WHERE user_id = 201 ORDER BY id DESC LIMIT 1), 
    (SELECT id FROM products WHERE name = "Fish Bun"), 
    2
);
-- 시그니처 메뉴 5개 (Dumpling Bun)
INSERT INTO sales_items(sales_record_id, product_id, quantity)
VALUES(
    (SELECT id FROM sales_records WHERE user_id = 201 ORDER BY id DESC LIMIT 1), 
    (SELECT id FROM products WHERE name = "Dumpling Bun"), 
    5
);

SELECT * FROM sales_items;

SELECT * FROM raw_materials;

INSERT INTO order_records(
    user_id,
    raw_material_id,
    quantity
)
VALUES(
    201,  -- "Banana Milk"의 유저 아이디
    22,  
    10
);

INSERT INTO order_records(
    user_id,
    raw_material_id,
    quantity
)
VALUES(
    201,  -- "Banana Milk"의 유저 아이디
    23,  -- 설탕 (raw_material_id 23)
    20
);

INSERT INTO order_records(
    user_id,
    raw_material_id,
    quantity
)
VALUES(
    201,  -- "Banana Milk"의 유저 아이디
    25,  -- 팥 (raw_material_id 25)
    15
);
-- 확인하기: 발주 이력 확인
SELECT * FROM order_records WHERE user_id=201;


-- 현재 stocks 테이블의 데이터 확인
SELECT * FROM stocks;

INSERT INTO daily_records (
stock_id, 
change_quantity, 
change_type
)
VALUES (
  69, 
  (SELECT quantity FROM stocks WHERE id = 69) + 100,  -- 120 + 100 = 220
  'IN'
);
-- 두 번째 원재료 출고 이력 추가
INSERT INTO daily_records (
    stock_id,
    change_quantity,
    change_type
)
VALUES (
    62,  -- stock_id가 62인 재고 (raw_material_id = 24)
    (SELECT quantity FROM stocks WHERE id = 62) - 50,  -- 현재 재고에서 50을 뺌
    'OUT'
);

-- 세 번째 원재료 입고 이력 추가
INSERT INTO daily_records (
    stock_id,
    change_quantity,
    change_type
)
VALUES (
    66,  -- stock_id가 66인 재고 (raw_material_id = 25)
    (SELECT quantity FROM stocks WHERE id = 66) + 200,  -- 현재 재고에 200을 더함
    'IN'
);

-- 첫 번째 재고 반영 (stock_id = 69)
UPDATE stocks
SET quantity = quantity + 100
WHERE id = 69;

-- 두 번째 재고 반영 (stock_id = 62)
UPDATE stocks
SET quantity = quantity - 50
WHERE id = 62;

-- 세 번째 재고 반영 (stock_id = 66)
UPDATE stocks
SET quantity = quantity + 200
WHERE id = 66;

SELECT * FROM daily_records;

SELECT 
    sr.id AS sales_record_id,   -- 판매 기록 ID
    sr.created_at,              -- 주문 날짜
    u.first_name,               -- 유저의 이름
    u.last_name,                -- 유저의 성
    si.product_id,              -- 상품 ID
    SUM(si.quantity) AS total_quantity, -- 총 구매 수량
    p.price                     -- 상품 가격
FROM 
    sales_items AS si
JOIN 
    sales_records AS sr ON si.sales_record_id = sr.id  -- 판매 기록과 연관된 판매 항목
JOIN 
    users AS u ON sr.user_id = u.id  -- 유저 정보와 연관
JOIN 
    products AS p ON si.product_id = p.id  -- 상품 정보와 연관
WHERE 
    u.first_name = "Banana"   -- 이름이 Banana인 유저만 조회
    AND u.last_name = "Milk"  -- 성이 Milk인 유저만 조회
GROUP BY 
    si.product_id, sr.id, sr.created_at, u.first_name, u.last_name, p.price
ORDER BY 
    p.price DESC;  -- 상품 가격 내림차순으로 정렬

















