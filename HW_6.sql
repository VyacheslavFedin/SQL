USE lesson3;
-- 1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.

DELIMITER //
DROP FUNCTION IF EXISTS days_in_sec;
CREATE FUNCTION days_in_sec
(
sec INT
)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
DECLARE days VARCHAR(50);
SET days = CONCAT ('days=',ROUND(sec/60/60/24),
'   hours=',ROUND((sec/60/60)%24),'   min=',ROUND((sec/60%60%24),0),'  sec=',ROUND(sec%60%60%24));
RETURN days;

END//

SELECT days_in_sec(1234567);

-- 2.	Выведите только четные числа от 1 до 10 включительно. (Через функцию / процедуру)



DROP PROCEDURE IF EXISTS numbers;

DELIMITER //
CREATE PROCEDURE numbers
(
IN input_num INT
)
BEGIN
	DECLARE n INT;
	DECLARE result VARCHAR(50) DEFAULT '';
	SET n=input_num;
    REPEAT
		IF (n%2=0 ) THEN 
			SET result = CONCAT(result,' ',n);
		END IF;
        SET n=n-1 ;
		UNTIL n<=1
    END REPEAT;
    SELECT result;
END//
CALL numbers(10);
