library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity nombre_entidad is
  port (a : in  std_logic_vector(2 downto 0);
        s : out std_logic
       );
end entity;

architecture Behavioral of nombre_entidad is
  -- COMPONENTS SIGNALS
  signal i : std_logic_vector(3 downto 0);

begin
  --DISENO
  PrOR: process (a)
  begin
    i(0) <= '0';
    for j in 1 to 3 loop
      i(j) <= i(j - 1) or a(j - 1);
    end loop;
    s <= i(3);
  end process;
end architecture;
