DELIMITER $$

CREATE FUNCTION `GetNumber` (field varchar(100))
RETURNS VARCHAR(100)
BEGIN
    DECLARE ls INTEGER;
    DECLARE i INTEGER;
    DECLARE str varchar(100);
    SET ls  = (select length(field));
    SET i   = 1;
    SET str = "";
    WHILE i <= ls DO            
        IF ((substring(field, i,1) REGEXP '[0-9]') <> 0) THEN
            SET str = CONCAT(str, convert(substring(field, i,1) USING UTF8));           
        END IF;
        SET i = i  + 1;
    END WHILE;
    RETURN str;
END;