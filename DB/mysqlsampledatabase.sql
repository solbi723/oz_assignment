USE classicmodels;
-- <1. 생성 (CREATE)>
-- (1) customers 테이블에 새 고객을 추가하세요.
-- INSERT INTO customers (
--     customerNumber, customerName, contactLastName, contactFirstName, 
--     phone, addressLine1, city, country
-- ) 
-- VALUES (
--     1001, 'John Doe', 'Doe', 'John', 
--     '123-456-7890', '123 Main St', 'Anytown', 'USA'
-- );

-- productlines 테이블에 'Vehicles' 값을 추가
-- INSERT INTO productlines (productLine, textDescription) 
-- VALUES ('Vehicles', 'Products related to vehicles');
-- (2) products 테이블에 새 제품을 추가하세요.
-- INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP) 
-- VALUES ('P1001', 'Toy Car', 'Vehicles', '1:24', 'Toy Company', 'A small toy car for kids.', 50, 19.99, 29.99);

-- (3) employees 테이블에 새 직원을 추가하세요.
-- INSERT INTO employees (employeeNumber, firstName, lastName, extension, email, officeCode, reportsTo, jobTitle) 
-- VALUES (1001, 'Alice', 'Johnson', 'x101', 'alice.johnson@example.com', '1', NULL, 'Sales Manager');

-- (4) offices 테이블에 새 사무실을 추가하세요.
-- INSERT INTO offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory) 
-- VALUES ('8', 'San Francisco', '123-456-7890', '123 Market St', NULL, 'CA', 'USA', '94105', 'West');

-- (5) orders 테이블에 새 주문을 추가하세요.
-- INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber) 
-- VALUES (1001, '2023-01-01', '2023-01-15', NULL, 'Shipped', 'First order of the year.', 125);

-- (6) orderdetails 테이블에 주문 상세 정보를 추가하세요.
-- INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber) 
-- VALUES (1001, 'P1001', 2, 20.00, 1);

-- (7) payments 테이블에 지불 정보를 추가하세요.
-- INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount) 
-- VALUES (125, 'CHK001', '2023-01-01', 200.00);

-- (8) productlines 테이블에 제품 라인을 추가하세요.
-- INSERT INTO productlines (productLine, textDescription) 
-- VALUES ('Electric Vehicles', 'Eco-friendly electric vehicle models');

-- (9) customers 테이블에 다른 지역의 고객을 추가하세요.
-- INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit) 
-- VALUES (2, 'Jane Smith', 'Smith', 'Jane', '555-1234', '456 Elm St', NULL, 'New York', 'NY', '10001', 'USA', NULL, NULL);

-- (10) products 테이블에 다른 카테고리의 제품을 추가하세요.
-- INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP) 
-- VALUES ('P3001', 'Electric Sports Car', 'Electric Vehicles', '1:24', 'Electric Company', 'A high-performance electric sports car model.', 40, 59.99, 89.99);

-- <2.읽기 (READ)>
-- 1) customers테이블에서 모든 고객 정보를 조회하세요.
-- SELECT * FROM customers;
-- 2) products 테이블에서 모든 제품 목록을 조회하세요.
-- SELECT firstName, lastName, jobTitle FROM employees;
-- 3) employees테이블에서 모든 직원의 이름과 직급을 조회하세요.
-- SELECT firstName, lastName, jobTitle FROM employees;
-- 4) offices 테이블에서 모든 사무실의 위치를 조회하세요.
-- SELECT city, addressLine1, addressLine2, phone FROM offices;
-- 5) orders 테이블에서 최근 10개의 주문을 조회하세요.
-- SELECT * FROM orders ORDER BY orderDate DESC LIMIT 10;
-- 6) orderdetails 테이블에서 특정 주문의 모든 상세 정보를 조회하세요.
-- SELECT * FROM orderdetails WHERE orderNumber = 1;
-- 7) payments 테이블에서 특정 고객의 모든 지불 정보를 조회하세요. 
-- SELECT * FROM payments WHERE customerNumber = 1;
-- (8) productlines 테이블에서 각 제품 라인의 설명을 조회하세요.
-- SELECT productLine, textDescription FROM productlines;
-- 9) customers 테이블에서 특정 지역의 고객을 조회하세요.
-- SELECT * FROM customers WHERE city = 'New York';
-- 10) products 테이블에서 특정 가격 범위의 제품을 조회하세요
-- SELECT * FROM products WHERE buyPrice BETWEEN 20 AND 50;

-- <3.갱신 (UPDATE)>
-- 1) customers 테이블에서 특정 고객의 주소를 갱신하세요.
-- UPDATE customers SET addressLine1 = '456 Updated St' WHERE customerNumber = 1;

-- 2) products 테이블에서 특정 제품의 가격을 갱신하세요.
-- UPDATE products SET buyPrice = 29.99 WHERE productCode = 'P1001';

-- 3) employees 테이블에서 특정 직원의 직급을 갱신하세요.
-- UPDATE employees SET jobTitle = 'Manager' WHERE employeeNumber = 1;

-- 4) offices 테이블에서 특정 사무실의 전화번호를 갱신하세요.
-- UPDATE offices SET phone = '123-456-7891' WHERE officeCode = '1';

-- 5) orders 테이블에서 특정 주문의 상태를 갱신하세요.
-- UPDATE orders SET status = 'Shipped' WHERE orderNumber = 1;

-- 6) orderdetails 테이블에서 특정 주문 상세의 수량을 갱신하세요.
-- UPDATE orderdetails SET quantityOrdered = 3 WHERE orderNumber = 1 AND productCode = 'P1001';

-- 7) payments 테이블에서 특정 지불의 금액을 갱신하세요.
-- UPDATE payments SET amount = 250.00 WHERE customerNumber = 1 AND paymentDate = '2023-01-01' AND checkNumber = 'CHK001';

-- 8) productlines 테이블에서 특정 제품 라인의 설명을 갱신하세요.
-- UPDATE productlines SET textDescription = 'Updated description for Classic Cars' WHERE productLine = 'Classic Cars';

-- 9) customers 테이블에서 특정 고객의 이메일을 갱신하세요.
--  customers 테이블에 이메일컬럼이 존재 하지 않음..

-- 10) products 테이블에서 여러 제품의 가격을 한 번에 갱신하세요.
-- 안전 업데이트 모드를 비활성화
-- SET SQL_SAFE_UPDATES = 0;
-- UPDATE products SET buyPrice = buyPrice * 1.1, MSRP = MSRP * 1.1;

-- <4. 삭제 (DELETE)>
-- 1) customers 테이블에서 특정 고객을 삭제하세요.
-- DELETE FROM customers WHERE customerNumber = 1;

-- 2) products 테이블에서 특정 제품을 삭제하세요
-- DELETE FROM orderdetails WHERE productCode = 'P1001';
-- DELETE FROM products WHERE productCode = 'P1001';

-- 3) employees 테이블에서 특정 직원을 삭제하세요.
-- DELETE FROM employees WHERE employeeNumber = 1;

-- 4) offices 테이블에서 특정 사무실을 삭제하세요.

-- CREATE TEMPORARY TABLE temp_employee_numbers AS 
-- SELECT employeeNumber FROM employees WHERE officeCode = '1';

-- DROP TEMPORARY TABLE IF EXISTS temp_employee_numbers;

-- CREATE TEMPORARY TABLE temp_employee_numbers AS 
-- SELECT employeeNumber FROM employees WHERE officeCode = '1';

-- UPDATE employees SET reportsTo = NULL WHERE reportsTo IN (SELECT employeeNumber FROM temp_employee_numbers);

-- UPDATE customers SET salesRepEmployeeNumber = NULL WHERE salesRepEmployeeNumber IN (SELECT employeeNumber FROM employees WHERE officeCode = '1');
-- CREATE TEMPORARY TABLE temp_reports AS SELECT employeeNumber FROM employees WHERE officeCode = '1';
-- UPDATE employees SET reportsTo = NULL WHERE reportsTo IN (SELECT employeeNumber FROM temp_reports);
-- DROP TEMPORARY TABLE temp_reports;

-- DELETE FROM employees WHERE officeCode = '1';
-- DELETE FROM offices WHERE officeCode = '1';

-- 5) orders 테이블에서 특정 주문을 삭제하세요.
-- DELETE FROM orderdetails WHERE orderNumber = 1; 
-- DELETE FROM orders WHERE orderNumber = 1; 

-- 6) orderdetails 테이블에서 특정 주문 상세를 삭제하세요.
-- DELETE FROM orderdetails WHERE orderNumber = 1; 

-- 7) payments 테이블에서 특정 지불 내역을 삭제하세요.
-- DELETE FROM payments WHERE customerNumber = 1;

-- 8) productlines 테이블에서 특정 제품 라인을 삭제하세요.
-- DELETE FROM orderdetails WHERE productCode IN (SELECT productCode FROM products WHERE productLiSELECTne = 'Classic Cars');
-- DELETE FROM products WHERE productLine = 'Classic Cars';
-- DELETE FROM productlines WHERE productLine = 'Classic Cars';

-- 9) customers 테이블에서 특정 지역의 모든 고객을 삭제하세요.
-- DELETE FROM payments WHERE customerNumber IN (SELECT customerNumber FROM customers WHERE city = 'San Francisco');
-- DELETE FROM orderdetails WHERE orderNumber IN (SELECT orderNumber FROM orders WHERE customerNumber IN (SELECT customerNumber FROM customers WHERE city = 'San Francisco'));
-- DELETE FROM orders WHERE customerNumber IN (SELECT customerNumber FROM customers WHERE city = 'San Francisco');
-- DELETE FROM customers WHERE city = 'San Francisco';

-- 10) products 테이블에서 특정 카테고리의 모든 제품을 삭제하세요.
-- DELETE FROM orderdetails WHERE productCode IN (SELECT productCode FROM products WHERE productLine = 'Ships');
-- DELETE FROM products WHERE productLine = 'Ships';



























































































