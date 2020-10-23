
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity counter is
port(
	clk : in std_logic;
	rst_n : in std_logic;
	cnt : in std_logic_vector(31 downto 0);

	D0 : out std_logic;
	D1 : out std_logic;
	D2 : out std_logic;
	D3 : out std_logic);

end entity;


architecture rtl of counter is
	signal current_count : natural;
	signal output_digit : std_logic_vector(3 downto 0);
begin

	process(clk) is
	begin
		if rising_edge(clk) then
			if rst_n = '0' then
				current_count <= 0;
				output_digit <= (others => '0');
			else

				if current_count < to_integer(unsigned(cnt)) then
					current_count <= current_count + 1;
				else
					current_count <= 0;
					output_digit <= std_logic_vector(unsigned(output_digit) + 1);
					if unsigned(output_digit) > 8 then
						output_digit <= (others => '0');
					end if;
				end if;
			end if;
		end if;

	end process;
	D0 <= output_digit(0);
	D1 <= output_digit(1);
	D2 <= output_digit(2);
	D3 <= output_digit(3);
end architecture;
