
library ieee;
use ieee.std_logic_1164.all;


entity bcd_to_7_segment_tb is
end entity;


architecture tb of bcd_to_7_segment_tb is
	signal D0_tb : std_logic;
	signal D1_tb : std_logic;
	signal D2_tb : std_logic;
	signal D3_tb : std_logic;

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
	D0	=> D0_tb,
	D1	=> D1_tb,
	D2	=> D2_tb,
	D3	=> D3_tb,
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
	D0_tb <= '0';
	D1_tb <= '0';
	D2_tb <= '0';
	D3_tb <= '0';
	wait for 1 ns;

	D0_tb <= '0';
	D1_tb <= '0';
	D2_tb <= '0';
	D3_tb <= '1';
	wait for 1 ns;

	D0_tb <= '0';
	D1_tb <= '0';
	D2_tb <= '1';
	D3_tb <= '0';
	wait for 1 ns;

	D0_tb <= '0';
	D1_tb <= '0';
	D2_tb <= '1';
	D3_tb <= '1';
	wait for 1 ns;

	D0_tb <= '0';
	D1_tb <= '1';
	D2_tb <= '0';
	D3_tb <= '0';
	wait for 1 ns;

	D0_tb <= '0';
	D1_tb <= '1';
	D2_tb <= '0';
	D3_tb <= '1';
	wait for 1 ns;

	D0_tb <= '0';
	D1_tb <= '1';
	D2_tb <= '1';
	D3_tb <= '0';
	wait for 1 ns;

	D0_tb <= '0';
	D1_tb <= '1';
	D2_tb <= '1';
	D3_tb <= '1';
	wait for 1 ns;

	D0_tb <= '1';
	D1_tb <= '0';
	D2_tb <= '0';
	D3_tb <= '0';
	wait for 1 ns;

	D0_tb <= '1';
	D1_tb <= '0';
	D2_tb <= '0';
	D3_tb <= '1';
	wait for 1 ns;

	end process;
end architecture;
