library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Simulacion_ej8 is
  --  
end entity;

architecture Behavioral of Simulacion_ej8 is

  component sumador8
    port (A : in  std_logic_vector(7 downto 0);
          B : in  std_logic_vector(7 downto 0);
          S : out  std_logic_vector(8 downto 0)
    );
  end component;

  -- Senales de las entradas
  signal A_s : std_logic_vector(7 downto 0) := "00110101";
  signal B_s : std_logic_vector(7 downto 0) := "11010011";

  -- Senales de salidas
  signal S_s : std_logic_vector(8 downto 0);

begin

  UO: sumador8
    port map (
      A => A_s,
      B => B_s,
      S => S_s
    );

  process
  begin
    A_s <= "00000000";
    B_s <= "00100101";
    wait for 100 ns;
    A_s <= "00000001";
    B_s <= "00000001";
    wait for 100 ns;
    A_s <= "11111111";
    B_s <= "11111111";
    wait for 100 ns;
    wait;
  end process;

end architecture;