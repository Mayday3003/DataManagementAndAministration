delimiter $$

create function fn_addition_01(p_min int, p_max int)
returns int
deterministic 

begin 
declare v_suma int;

set v_suma := p_min + p_max;

return v_suma; 

end; 

$$