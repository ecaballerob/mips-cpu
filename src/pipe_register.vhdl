library ieee;
use ieee.std_logic_1164.all;

entity pipe_register is 
  generic ( N : integer := 1);
  port (
    clk, clear, hold  : in std_logic;
    input             : in std_logic_vector(N downto 0);
    output            : out std_logic_vector(N downto 0)
  );
end entity;

architecture arch of pipe_register is 
  
  signal output_register : std_logic_vector(N downto 0);

begin
  process (clk)
  begin
    if rising_edge(clk) then 
      if clear = '1' then
        output_register <= (others => '0');
      else 
        if hold = '1' then
          output_register <= output_register;
        else
          output_register <= input;
        end if;
      end if;
    end if;
  end process;
  
  output <= output_register;

end arch;
