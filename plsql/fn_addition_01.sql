DELIMITER $$

CREATE OR REPLACE FUNCTION fn_addition_01(p_min INT, p_max INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_suma INT;
    SET v_suma := p_min + p_max;
    RETURN v_suma;
END$$

DELIMITER ;
