CREATE OR REPLACE FUNCTION fn_get_country_attribute_by_id (
    p_country_id IN VARCHAR2,
    p_attribute  IN VARCHAR2
) RETURN VARCHAR2 IS
    v_result VARCHAR2(4000);
    v_clean_attr VARCHAR2(50);
BEGIN
    v_clean_attr := LOWER(TRIM(p_attribute));
    
    IF v_clean_attr NOT IN ('name', 'continent', 'region', 'population') THEN
        RETURN NULL;
    END IF;

    EXECUTE IMMEDIATE 
        'SELECT TO_CHAR(' || v_clean_attr || ') FROM country WHERE id = :1'
        INTO v_result
        USING p_country_id;

    RETURN v_result;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN OTHERS THEN
        RAISE;
END fn_get_country_attribute_by_id;
/
