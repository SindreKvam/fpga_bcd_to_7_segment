
library ieee;
use ieee.std_logic_1164.all;


entity bcd_to_7_segment is
port(
	D0 : in std_logic;
	D1 : in std_logic;
	D2 : in std_logic;
	D3 : in std_logic;

	a : out std_logic;
	b : out std_logic;
	c : out std_logic;
	d : out std_logic;
	e : out std_logic;
	f : out std_logic;
	g : out std_logic);
end entity;


architecture rtl of bcd_to_7_segment is
begin

	process(D0, D1, D2, D3) is
	begin


		a <= D0 or D2 or (D1 and D3) or (not D1 and not D3);
		b <= not D1 or (not D2 and not D3) or (D2 and D3);
		c <= D1 or not D2 or D3;
		d <= (D2 and not D1) or (not D1 and not D3) or (D2 and not D3) or D0 or (D1 and not D2 and D3);
		e <= (not D1 and not D3) or (D2 and not D3);
		f <= D0 or (not D2 and not D3) or (D1 and not D2) or (D1 and not D3);
		g <= D0 or (D1 and not D2) or (not D1 and D2) or (D2 and not D3);

	end process;

end architecture;
