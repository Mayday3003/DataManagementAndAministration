CREATE OR REPLACE FUNCTION fn_summation_02 (
    p_min IN NUMBER,
    p_max IN NUMBER
) RETURN INT IS
    v_suma INT := 0;
    v_tipo VARCHAR2(20);
BEGIN
    FOR i IN p_min..p_max LOOP
        -- Se asume que fn_number_type_01 retorna una cadena como 'IMPAR' o 'PAR'
        v_tipo := fn_number_type_01(i);
        
        IF UPPER(v_tipo) = 'IMPAR' THEN
            v_suma := v_suma + i;
        END IF;
    END LOOP;
    
    RETURN v_suma;
END fn_summation_02;
/
