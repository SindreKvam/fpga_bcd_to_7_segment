
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_tb is
end entity;


architecture tb of counter_tb is
	signal clk_tb 	: std_logic := '0';
	signal rst_n_tb : std_logic := '0';
	signal cnt_tb 	: std_logic_vector(31 downto 0) := (others => '0');

	signal binary_h_tb : std_logic_vector(7 downto 0);
	signal binary_m_tb : std_logic_vector(7 downto 0);
	signal binary_s_tb : std_logic_vector(7 downto 0);

begin
	dut : entity work.counter
	port map(

	binary_h => binary_h_tb,
	binary_m => binary_m_tb,
	binary_s => binary_s_tb,

	clk	=> clk_tb,
	rst_n	=> rst_n_tb,
	cnt	=> cnt_tb

	);
	process is
	begin
		wait for 10 ns;
		clk_tb <= not clk_tb;

		rst_n_tb <= '1' after 13 ns;

		cnt_tb <= X"000000F0";

	end process;
end architecture;
