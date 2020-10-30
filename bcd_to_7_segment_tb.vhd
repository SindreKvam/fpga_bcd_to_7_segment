
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity bcd_to_7_segment_tb is
end entity;


architecture tb of bcd_to_7_segment_tb is
--	signal D0_tb : std_logic;
--	signal D1_tb : std_logic;
--	signal D2_tb : std_logic;
--	signal D3_tb : std_logic;
	signal digit_tb : std_logic_vector(3 downto 0) := (others => '0');

	signal a_tb : std_logic;
	signal b_tb : std_logic;
	signal c_tb : std_logic;
	signal d_tb : std_logic;
	signal e_tb : std_logic;
	signal f_tb : std_logic;
	signal g_tb : std_logic;
begin
	dut : entity work.bcd_to_7_segment
	port map(
--	D0	=> D0_tb,
--	D1	=> D1_tb,
--	D2	=> D2_tb,
--	D3	=> D3_tb,
	digit => digit_tb,

	a 	=> a_tb,
	b 	=> b_tb,
	c 	=> c_tb,
	d 	=> d_tb,
	e 	=> e_tb,
	f 	=> f_tb,
	g 	=> g_tb
	);
	process is
	begin
		digit_tb <= std_logic_vector(to_unsigned(0, 4));
		wait for 1 ns;

		digit_tb <= std_logic_vector(to_unsigned(1, 4));
		wait for 1 ns;

		digit_tb <= std_logic_vector(to_unsigned(2, 4));
		wait for 1 ns;

		digit_tb <= std_logic_vector(to_unsigned(3, 4));
		wait for 1 ns;

		digit_tb <= std_logic_vector(to_unsigned(4, 4));
		wait for 1 ns;

		digit_tb <= std_logic_vector(to_unsigned(5, 4));
		wait for 1 ns;

		digit_tb <= std_logic_vector(to_unsigned(6, 4));
		wait for 1 ns;

		digit_tb <= std_logic_vector(to_unsigned(7, 4));
		wait for 1 ns;

		digit_tb <= std_logic_vector(to_unsigned(8, 4));
		wait for 1 ns;

		digit_tb <= std_logic_vector(to_unsigned(9, 4));
		wait for 1 ns;
--	D0_tb <= '0';
--	D1_tb <= '0';
--	D2_tb <= '0';
--	D3_tb <= '0';
--	wait for 1 ns;
--
--	D0_tb <= '0';
--	D1_tb <= '0';
--	D2_tb <= '0';
--	D3_tb <= '1';
--	wait for 1 ns;
--
--	D0_tb <= '0';
--	D1_tb <= '0';
--	D2_tb <= '1';
--	D3_tb <= '0';
--	wait for 1 ns;
--
--	D0_tb <= '0';
--	D1_tb <= '0';
--	D2_tb <= '1';
--	D3_tb <= '1';
--	wait for 1 ns;
--
--	D0_tb <= '0';
--	D1_tb <= '1';
--	D2_tb <= '0';
--	D3_tb <= '0';
--	wait for 1 ns;
--
--	D0_tb <= '0';
--	D1_tb <= '1';
--	D2_tb <= '0';
--	D3_tb <= '1';
--	wait for 1 ns;
--
--	D0_tb <= '0';
--	D1_tb <= '1';
--	D2_tb <= '1';
--	D3_tb <= '0';
--	wait for 1 ns;
--
--	D0_tb <= '0';
--	D1_tb <= '1';
--	D2_tb <= '1';
--	D3_tb <= '1';
--	wait for 1 ns;
--
--	D0_tb <= '1';
--	D1_tb <= '0';
--	D2_tb <= '0';
--	D3_tb <= '0';
--	wait for 1 ns;
--
--	D0_tb <= '1';
--	D1_tb <= '0';
--	D2_tb <= '0';
--	D3_tb <= '1';
--	wait for 1 ns;

	end process;
end architecture;
