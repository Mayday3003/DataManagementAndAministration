create or replace function fn_arihmetic_operation_01( p_val1 real, p_val2 real, p_operation varchar(200))  
returns real  
deterministic 

begin 

    declare v_respuesta real; 

    if p_operation 9