
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_tb is
end entity;


architecture tb of counter_tb is
	signal clk_tb 	: std_logic := '0';
	signal rst_n_tb : std_logic := '1';
	signal cnt_tb 	: std_logic_vector(31 downto 0) := (others => '0');
	signal multiplier_tb : std_logic_vector(9 downto 0) := (others => '1');

	signal binary_h_tb : std_logic_vector(6 downto 0);
	signal binary_m_tb : std_logic_vector(6 downto 0);
	signal binary_s_tb : std_logic_vector(6 downto 0);

begin
	dut : entity work.counter
	port map(

	binary_h => binary_h_tb,
	binary_m => binary_m_tb,
	binary_s => binary_s_tb,

	clk	=> clk_tb,
	rst_n	=> rst_n_tb,
	cnt	=> cnt_tb,
	multiplier => multiplier_tb

	);
	process is
	begin
		wait for 100 ps;
		clk_tb <= not clk_tb;
		cnt_tb <= X"0000000F";

		multiplier_tb <= std_logic_vector(to_unsigned(0,10)) after 20 ns;
	--	rst_n_tb <= '1'



	end process;
end architecture;
