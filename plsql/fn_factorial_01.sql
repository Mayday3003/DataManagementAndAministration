CREATE OR REPLACE FUNCTION fn_factorial_01 (
    p_val1 IN INT
) RETURN INT IS
    v_resultado INT := 1;
    v_i         INT;
BEGIN
    -- Si el número es 0 o negativo, retorna 0
    IF p_val1 <= 0 THEN
        RETURN 0;
    END IF;

    -- Calcula el factorial usando un bucle
    FOR v_i IN 1..p_val1 LOOP
        v_resultado := v_resultado * v_i;
    END LOOP;

    RETURN v_resultado;
END fn_factorial_01;
/
