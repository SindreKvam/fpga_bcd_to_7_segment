
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity bcd_to_7_segment is
port(
--	D0 : in std_logic;
--	D1 : in std_logic;
--	D2 : in std_logic;
--	D3 : in std_logic;
	digit : in std_logic_vector(3 downto 0);

	a : out std_logic;
	b : out std_logic;
	c : out std_logic;
	d : out std_logic;
	e : out std_logic;
	f : out std_logic;
	g : out std_logic
	);
end entity;


architecture rtl of bcd_to_7_segment is
begin

	process(digit) is
	begin

			-- The not on every output is because the 7-segment display is using common anode instead of cathode
--		a <= not (D0 or D2 or (D1 and D3) or (not D1 and not D3));
--		b <= not (not D1 or (not D2 and not D3) or (D2 and D3));
--		c <= not (D1 or not D2 or D3);
--		d <= not ((D2 and not D1) or (not D1 and not D3) or (D2 and not D3) or D0 or (D1 and not D2 and D3));
--		e <= not ((not D1 and not D3) or (D2 and not D3));
--		f <= not (D0 or (not D2 and not D3) or (D1 and not D2) or (D1 and not D3));
--		g <= not (D0 or (D1 and not D2) or (not D1 and D2) or (D2 and not D3));

		a <= not (digit(0) or digit(2) or (digit(1) and digit(3)) or (not digit(1) and not digit(3)));
		b <= not (not digit(1) or (not digit(2) and not digit(3)) or (digit(2) and digit(3)));
		c <= not (digit(1) or not digit(2) or digit(3));
		d <= not ((digit(2) and not digit(1)) or (not digit(1) and not digit(3)) or (digit(2) and not digit(3)) or digit(0) or (digit(1) and not digit(2) and digit(3)));
		e <= not ((not digit(1) and not digit(3)) or (digit(2) and not digit(3)));
		f <= not (digit(0) or (not digit(2) and not digit(3)) or (digit(1) and not digit(2)) or (digit(1) and not digit(3)));
		g <= not (digit(0) or (digit(1) and not digit(2)) or (not digit(1) and digit(2)) or (digit(2) and not digit(3)));

	end process;

end architecture;
