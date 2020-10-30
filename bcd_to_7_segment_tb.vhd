
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity bcd_to_7_segment_tb is
end entity;


architecture tb of bcd_to_7_segment_tb is

	signal bcd_tb : std_logic_vector(3 downto 0) := (others => '0');
	signal seven_seg_tb : std_logic_vector(6 downto 0) := (others => '0');

begin
	dut : entity work.bcd_to_7_segment
	port map(

	bcd => bcd_tb,
	seven_seg => seven_seg_tb

	);
	process is
	begin
		bcd_tb <= std_logic_vector(to_unsigned(0, 4));
		wait for 1 ns;

		bcd_tb <= std_logic_vector(to_unsigned(1, 4));
		wait for 1 ns;

		bcd_tb <= std_logic_vector(to_unsigned(2, 4));
		wait for 1 ns;

		bcd_tb <= std_logic_vector(to_unsigned(3, 4));
		wait for 1 ns;

		bcd_tb <= std_logic_vector(to_unsigned(4, 4));
		wait for 1 ns;

		bcd_tb <= std_logic_vector(to_unsigned(5, 4));
		wait for 1 ns;

		bcd_tb <= std_logic_vector(to_unsigned(6, 4));
		wait for 1 ns;

		bcd_tb <= std_logic_vector(to_unsigned(7, 4));
		wait for 1 ns;

		bcd_tb <= std_logic_vector(to_unsigned(8, 4));
		wait for 1 ns;

		bcd_tb <= std_logic_vector(to_unsigned(9, 4));
		wait for 1 ns;

	end process;
end architecture;
