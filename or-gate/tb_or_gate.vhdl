library IEEE;
  use IEEE.STD_LOGIC_1164.all;

entity Simulacion_or is
  --  
end entity;

architecture Behavioral of Simulacion_or is

  component or_gate
    port (A : in  STD_LOGIC;
          B : in  STD_LOGIC;
          S : out STD_LOGIC
         );
  end component;

  -- Senales de las entradas
  signal A_s : STD_LOGIC := '0';
  signal B_s : STD_LOGIC := '0';

  -- Senales de salidas
  signal S_s : STD_LOGIC;

begin

  UO: or_gate
    port map (
      A => A_s,
      B => B_s,
      S => S_s
    );

  process
  begin
    --- Estimulos de la simulacion wait for 100 ns;
    A_s <= '0';
    B_s <= '0';
    wait for 100 ns;

    A_s <= '0';
    B_s <= '1';
    wait for 100 ns;

    A_s <= '0';
    B_s <= '1';
    wait for 100 ns;

    A_s <= '1';
    B_s <= '1';
    wait for 100 ns;

    wait;
  end process;

end architecture;
