CREATE OR REPLACE FUNCTION fn_is_triangle_area_even_01 (
    p_side   IN NUMBER,
    p_height IN NUMBER
) RETURN VARCHAR2 IS
    v_area NUMBER;
    v_is_even VARCHAR2(3);
BEGIN
    -- Supone que fn_calculate_area_01 calcula (p_side * p_height) / 2
    v_area := fn_calculate_area_01(p_side, p_height);
    
    -- Supone que fn_is_even_03 retorna 'YES' o 'NO' según si el número es par
    v_is_even := fn_is_even_03(v_area);
    
    RETURN v_is_even;
END fn_is_triangle_area_even_01;
/