library IEEE;
  use IEEE.STD_LOGIC_1164.all;

entity Simulacion_ej3 is
  --  
end entity;

architecture Behavioral of Simulacion_ej3 is

  component dmux2_1_gate
    port (X  : in  std_logic;
          S  : in  std_logic;
          O1 : out std_logic;
          O2 : out std_logic
         );
  end component;

  -- Senales de las entradas
  signal X_s : std_logic := '1';
  signal S_s : std_logic := '0';

  -- Senales de salidas
  signal O1_s : std_logic;
  signal O2_s : std_logic;

begin

  UO: dmux2_1_gate
    port map (
      X  => X_s,
      S  => S_s,
      O1 => O1_s,
      O2 => O2_s
    );

  process
  begin
    X_s <= '1';
    S_s <= '0';
    wait for 100 ns;
    S_s <= '1';
    wait for 100 ns;
    S_s <= '0';
    wait for 100 ns;
    wait;
  end process;

end architecture;
