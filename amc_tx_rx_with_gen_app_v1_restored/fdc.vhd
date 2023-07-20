library ieee;
use ieee.std_logic_1164.all;

--pragma translate_off
library unisim ;
use unisim.vcomponents.all ;
--pragma translate_on

entity fdc is port (
	d 		: in std_logic;
	c 		: in std_logic;
	clr   : in std_logic;
	q 		: out std_logic
	) ; 
end fdc;

architecture arch_fdc of fdc is
begin

process (c, clr)
begin
    if (clr = '1') then
       q  <= '0';
    elsif (c'event and c = '1') then
	   q  <= d;
    end if ;
end process ;

end arch_fdc;