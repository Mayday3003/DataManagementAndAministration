DELIMITER $$

CREATE OR REPLACE FUNCTION fn_triangle_area(p_side REAL, p_height REAL)
RETURNS REAL
DETERMINISTIC
BEGIN
    DECLARE v_area REAL;
    SET v_area := (p_side * p_height) / 2.0;
    RETURN v_area;
END$$

DELIMITER ;
