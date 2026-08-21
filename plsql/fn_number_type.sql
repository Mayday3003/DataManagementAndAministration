CREATE OR REPLACE FUNCTION fn_number_type_01 (p_number IN NUMBER)
RETURN VARCHAR2 IS
BEGIN
    IF MOD(p_number, 2) = 0 THEN
        RETURN 'EVEN';
    ELSE
        RETURN 'ODD';
    END IF;
END fn_number_type_01;
/
