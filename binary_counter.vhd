
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity counter is
port(
	clk : in std_logic;
	rst_n : in std_logic;
	cnt : in std_logic_vector(31 downto 0); -- Just needs to hold 50 million because we're operating at 50 MHz

	binary_h : out std_logic_vector(7 downto 0) := (others => '0');
	binary_m : out std_logic_vector(7 downto 0) := (others => '0');
	binary_s : out std_logic_vector(7 downto 0) := (others => '0')
	);

end entity;


architecture rtl of counter is
	signal current_count : natural;
begin
	process(clk) is
	begin

		if rising_edge(clk) then
			if rst_n = '0' then
				current_count <= 0;
			else

				if current_count < to_integer(unsigned(cnt)) then
					current_count <= current_count + 1;
				else
					current_count <= 0;

					if unsigned(binary_s) >= 59 then
						binary_s <= (others => '0');

						if unsigned(binary_m) >= 59 then
							binary_m <= (others => '0');

							if unsigned(binary_h) >= 23 then
								binary_h <= (others => '0');

							else
								binary_h <= std_logic_vector(unsigned(binary_h) +1);
							end if;

						else
							binary_m <= std_logic_vector(unsigned(binary_m) +1);
						end if;

					else
						binary_s <= std_logic_vector(unsigned(binary_s) + 1);

					end if;

				end if;
			end if;
		end if;

	end process;
end architecture;
