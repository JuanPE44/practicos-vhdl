library IEEE;
  use IEEE.STD_LOGIC_1164.all;

entity Simulacion_ej2 is
  --  
end entity;

architecture Behavioral of Simulacion_ej2 is

  component mux2_1_gate
    port (A : in  std_logic;
          B : in  std_logic;
          S : in  std_logic;
          O : out std_logic
         );
  end component;

  -- Senales de las entradas
  signal A_s : std_logic := '0';
  signal B_s : std_logic := '1';
  signal S_s : std_logic := '0';

  -- Senales de salidas
  signal O_s : std_logic;

begin

  UO: mux2_1_gate
    port map (
      A => A_s,
      B => B_s,
      S => S_s,
      O => O_s
    );

  process
  begin
    A_s <= '0';
    B_s <= '1';
    S_s <= '0';
    wait for 100 ns;
    S_s <= '1';
    wait for 100 ns;
    S_s <= '0';
    wait for 100 ns;
    wait;
  end process;

end architecture;
