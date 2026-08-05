

create or replace function fn_triangle_area( p_side real, p_height real)

returns real

deterministic 

begin 
declare v_area real; 

set v_area  := (p_height * p_side) / 2

return v_area;
end;
$$