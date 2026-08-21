CREATE OR REPLACE FUNCTION fn_factorial_summation_01 (
    p_val1 IN INT
) RETURN INT IS
    v_factorial NUMBER := 1;
    v_suma      INT := 0;
    v_temp      NUMBER;
BEGIN
    -- Validar si el número es negativo
    IF p_val1 < 0 THEN
        RETURN 0;
    END IF;

    -- Calcular el factorial del número
    FOR i IN 1..p_val1 LOOP
        v_factorial := v_factorial * i;
    END LOOP;

    -- Copiar el valor para extraer los dígitos
    v_temp := v_factorial;

    -- Sumar los dígitos del factorial obtenido
    WHILE v_temp > 0 LOOP
        v_suma := v_suma + MOD(v_temp, 10);
        v_temp := TRUNC(v_temp / 10);
    END LOOP;

    RETURN v_suma;
END fn_factorial_summation_01;
/
