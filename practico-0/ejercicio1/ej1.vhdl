library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity nombre_entidad is
  port (A : in  std_logic_vector(2 downto 0);
        S : out std_logic
       );
end entity;

architecture Behavioral of nombre_entidad is

begin

  PrOR: process (A)
  begin
    S <= A(2) or A(1) or A(0);
  end process;
end architecture;
