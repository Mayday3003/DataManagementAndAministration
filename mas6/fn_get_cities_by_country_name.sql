CREATE OR REPLACE FUNCTION fn_get_cities_by_country_name(p_country_name TEXT)
RETURNS TEXT AS $$
DECLARE
    v_country_id INT;
    v_cities TEXT := '';
    v_city_name TEXT;
    
    cur_cities CURSOR (c_id INT) FOR 
        SELECT name FROM city WHERE country_id = c_id;
BEGIN
    SELECT id INTO v_country_id 
    FROM country 
    WHERE name = p_country_name;

    IF v_country_id IS NULL THEN
        RETURN NULL;
    END IF;

    OPEN cur_cities(v_country_id);
    LOOP
        FETCH cur_cities INTO v_city_name;
        EXIT WHEN NOT FOUND;
        
        IF v_cities = '' THEN
            v_cities := v_city_name;
        ELSE
            v_cities := v_cities || ', ' || v_city_name;
        END IF;
    END LOOP;
    CLOSE cur_cities;

    RETURN v_cities;
END;
$$ LANGUAGE plpgsql;
