
library ieee;
use ieee.std_logic_1164.all;

entity top is
	port(
		MAX10_CLK1_50 : in  std_logic;
		KEY           : in  std_logic_vector(1 downto 0);
		SW            : in  std_logic_vector(9 downto 0);
		LEDR          : out std_logic_vector(9 downto 0);
		HEX0          : out std_logic_vector(7 downto 0);
		HEX1          : out std_logic_vector(7 downto 0);
		HEX2          : out std_logic_vector(7 downto 0);
		HEX3          : out std_logic_vector(7 downto 0);
		HEX4          : out std_logic_vector(7 downto 0);
		HEX5          : out std_logic_vector(7 downto 0)
	);
end entity;

architecture rtl of top is
	signal internal_clock : std_logic;

	signal binary_h : std_logic_vector(6 downto 0);
	signal binary_m : std_logic_vector(6 downto 0);
	signal binary_s : std_logic_vector(6 downto 0);

	signal bcd_0_h : std_logic_vector(3 downto 0); -- One
	signal bcd_1_h : std_logic_vector(3 downto 0); -- Ten
	signal bcd_0_m : std_logic_vector(3 downto 0); -- One
	signal bcd_1_m : std_logic_vector(3 downto 0); -- Ten
	signal bcd_0_s : std_logic_vector(3 downto 0); -- One
	signal bcd_1_s : std_logic_vector(3 downto 0); -- Ten

begin
	system_clock : entity work.clock
		port map(
			areset => '0',
			inclk0 => MAX10_CLK1_50,
			c0     => internal_clock,
			locked => open
		);

	counter_i : entity work.counter
		port map(
			clk        => internal_clock,
			rst_n      => KEY(0),
			multiplier => SW,
			led        => LEDR,
			cnt        => X"02FAF080",  --02FAF080 for 50MHz (50 000 000)

			binary_h   => binary_h,
			binary_m   => binary_m,
			binary_s   => binary_s
		);

	binary_to_bcd_h : entity work.binary_to_bcd
		port map(
			binary => binary_h,
			bcd_0  => bcd_0_h,
			bcd_1  => bcd_1_h
		);

	binary_to_bcd_m : entity work.binary_to_bcd
		port map(
			binary => binary_m,
			bcd_0  => bcd_0_m,
			bcd_1  => bcd_1_m
		);

	binary_to_bcd_s : entity work.binary_to_bcd
		port map(
			binary => binary_s,
			bcd_0  => bcd_0_s,
			bcd_1  => bcd_1_s
		);

	inputs_0_i : entity work.bcd_to_7_segment
		port map(
			bcd       => bcd_0_s,
			dot       => '1',
			seven_seg => HEX0
		);

	inputs_1_i : entity work.bcd_to_7_segment
		port map(
			bcd       => bcd_1_s,
			dot       => '1',
			seven_seg => HEX1
		);

	inputs_2_i : entity work.bcd_to_7_segment
		port map(
			bcd       => bcd_0_m,
			dot       => '0',
			seven_seg => HEX2
		);

	inputs_3_i : entity work.bcd_to_7_segment
		port map(
			bcd       => bcd_1_m,
			dot       => '1',
			seven_seg => HEX3
		);

	inputs_4_i : entity work.bcd_to_7_segment
		port map(
			bcd       => bcd_0_h,
			dot       => '0',
			seven_seg => HEX4
		);

	inputs_5_i : entity work.bcd_to_7_segment
		port map(
			bcd       => bcd_1_h,
			dot       => '1',
			seven_seg => HEX5
		);

end architecture;
