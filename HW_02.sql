-- 1. Используя операторы языка SQL, 
-- создайте таблицу “sales”. Заполните ее данными.

CREATE DATABASE IF NOT EXISTS hw_02;

USE hw_02;
DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    order_date VARCHAR(45), 
    count_product INT
);

INSERT INTO sales (order_date,count_product)
VALUES 
		("2022-01-01",156),
        ("2022-01-02",180),
        ("2022-01-03",21),
        ("2022-01-04",124),
        ("2022-01-05",341);
SELECT * FROM sales;

-- 2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
-- меньше 100  -    Маленький заказ
-- от 100 до 300 - Средний заказ
-- больше 300  -     Большой заказ

SELECT 
	id AS "номер заказа",
    order_date AS "дата заказа",
    count_product AS "размер заказа",

	IF( count_product < 100, "Маленький заказ",
		IF((count_product >= 100 AND count_product <= 300), "Средний заказ",
			IF (count_product > 300, "Большой заказ"," оч.большой заказ")))
    AS "тип заказа"
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями
-- Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
-- OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED -  «Order is cancelled»

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders
(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    employee_id VARCHAR(3), 
    amount DECIMAL(6,2),
    order_status VARCHAR(9)
);

INSERT INTO orders (employee_id,amount,order_status)
VALUES 
		("e03",15.00,"OPEN"),
        ("e1",25.50,"OPEN"),
        ("e5",100.70,"CLOSED"),
        ("e2",22.18,"OPEN"),
        ("e4",9.50,"CANCELLED");
SELECT * FROM orders;

SELECT 
	id,
    employee_id,
    amount,
    order_status,
CASE
	WHEN order_status = "OPEN" THEN "Order is in open state"
    WHEN order_status = "CLOSED" THEN "Order is closed"
    WHEN order_status = "CANCELLED" THEN "Order is cancelled"
    ELSE "Error"
END AS full_order_status
FROM orders;