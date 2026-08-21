DELIMITER $$

CREATE OR REPLACE FUNCTION fn_arithmetic_operation_01(p_val1 REAL, p_val2 REAL, p_operation VARCHAR(200))
RETURNS REAL
DETERMINISTIC
BEGIN
    DECLARE v_result REAL DEFAULT 0.0;
    
    IF p_operation = 'addition' THEN
        SET v_result := p_val1 + p_val2;
    ELSEIF p_operation = 'subtraction' THEN
        SET v_result := p_val1 - p_val2;
    ELSEIF p_operation = 'multiplication' THEN
        SET v_result := p_val1 * p_val2;
    ELSEIF p_operation = 'division' THEN
        IF p_val2 <> 0 THEN
            SET v_result := p_val1 / p_val2;
        ELSE
            SET v_result := 0.0; -- Avoid division by zero, or could raise exception
        END IF;
    ELSE
        SET v_result := 0.0;
    END IF;
    
    RETURN v_result;
END$$

DELIMITER ;
