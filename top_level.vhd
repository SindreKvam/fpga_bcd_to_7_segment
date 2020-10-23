
library ieee;
use ieee.std_logic_1164.all;


entity top_level is
port(
	clk : in std_logic;
	rst_n : in std_logic;

	a : out std_logic;
	b : out std_logic;
	c : out std_logic;
	d : out std_logic;
	e : out std_logic;
	f : out std_logic;
	g : out std_logic);
end entity;


architecture rtl of top_level is
	signal internal_clock : std_logic;
	signal D0 : std_logic;
	signal D1 : std_logic;
	signal D2 : std_logic;
	signal D3 : std_logic;
	
begin
system_clock : entity work.clock
	port map
	(
		areset => not rst_n,
		inclk0 => clk,
		c0 => internal_clock,
		locked => open
	);
	
counter_i : entity work.counter
port map(
	clk => internal_clock,
	rst_n => rst_n,
	cnt => X"02FAF080",

	D0 => D0,
	D1 => D1,
	D2 => D2,
	D3 => D3
	);

inputs_i : entity work.bcd_to_7_segment
port map(
	D0 => D3,
	D1 => D2,
	D2 => D1,
	D3 => D0,

	a => a,
	b => b,
	c => c,
	d => d,
	e => e,
	f => f,
	g => g);

end architecture;

