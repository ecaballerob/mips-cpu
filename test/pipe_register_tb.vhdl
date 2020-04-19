library ieee;
use ieee.std_logic_1164.all;

entity pipe_register_tb is
end entity;

architecture arch of pipe_register_tb is
  component pipe_register is 
    generic ( N : integer := 1);
    port (
      clk, clear, hold  : in std_logic;
      input             : in std_logic_vector(N downto 0);
      output            : out std_logic_vector(N downto 0)
    );
  end component;

  constant N : integer := 7;
  constant period : time := 10 ns;

  signal clk, clear, hold : std_logic;
  signal input, output : std_logic_vector(N downto 0);

begin

  clk_process : process 
  begin
    clk <= '0';
    wait for period/2;
    clk <= '1';
    wait for period/2;
  end process;

  UTT : pipe_register 
        generic map (N)
        port map (clk, clear, hold, input, output);

  input <= x"00", x"AA" after period, x"34" after period*2, x"53" after period*3;
  hold <= '0', '1' after period*2, '0' after period*3;
  clear <= '0', '1' after period*4;


end arch;
