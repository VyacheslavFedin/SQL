USE hw_01;
SELECT * FROM hw_01.phones;

-- 2. 	Выведите название, производителя и цену для товаров, количество которых превышает 2

SELECT Manufacturer, Price
FROM hw_01.phones
WHERE ProductCount > 2;

-- 3.  	Выведите весь ассортимент товаров марки “Samsung”

SELECT *
FROM hw_01.phones
WHERE Manufacturer = "Samsung";

-- 4. 	Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**

SELECT *
FROM hw_01.phones
WHERE ProductCount * Price < 145000 AND ProductCount * Price > 100000;

