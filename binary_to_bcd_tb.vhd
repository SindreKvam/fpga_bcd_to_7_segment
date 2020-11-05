
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity binary_to_bcd_tb is
end entity;


architecture tb of binary_to_bcd_tb is
  signal binary_tb : std_logic_vector(6 downto 0) := (others => '0');

  signal bcd_0_tb : std_logic_vector(3 downto 0); -- One
  signal bcd_1_tb : std_logic_vector(3 downto 0); -- Ten
begin

  dut : entity work.binary_to_bcd
  port map(
    binary => binary_tb,

    bcd_0 => bcd_0_tb,
    bcd_1 => bcd_1_tb
  );

  process is
  begin

    binary_tb <= "0100000";
    wait for 10 ns;

  end process;
end architecture;
