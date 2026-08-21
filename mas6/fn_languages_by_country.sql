CREATE OR REPLACE FUNCTION fn_get_languages_by_country_name(p_country_name TEXT)
RETURNS TEXT AS $$
DECLARE
    v_country_id INT;
    v_languages TEXT := '';
    v_lang_name TEXT;
    
    -- Cursor que recibe el ID del país y busca sus idiomas correspondientes
    cur_languages CURSOR (c_id INT) FOR 
        SELECT language FROM country_language WHERE country_id = c_id;
BEGIN
    -- 1. Buscar el ID del país por su nombre
    SELECT id INTO v_country_id 
    FROM country 
    WHERE name = p_country_name;

    -- Si el país no existe, retornar NULL
    IF v_country_id IS NULL THEN
        RETURN NULL;
    END IF;

    -- 2. Recorrer los idiomas con el cursor y concatenarlos
    OPEN cur_languages(v_country_id);
    LOOP
        FETCH cur_languages INTO v_lang_name;
        EXIT WHEN NOT FOUND;
        
        IF v_languages = '' THEN
            v_languages := v_lang_name;
        ELSE
            v_languages := v_languages || ', ' || v_lang_name;
        END IF;
    END LOOP;
    CLOSE cur_languages;

    RETURN v_languages;
END;
$$ LANGUAGE plpgsql;

