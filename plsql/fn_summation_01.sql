create or replace function fn_sumation_01(p_min int, p_max int) 
returns int
  deterministic 
   begin 
    declare v_result int default 0;

    si: for i in p_min..p_max do   
    set v_result := v_result + i; 
    end for si;  
    return v_result; 
    end $$ 


