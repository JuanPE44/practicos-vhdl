library IEEE;
  use IEEE.STD_LOGIC_1164.all;

entity Simulacion_ej6 is
  --  
end entity;

architecture Behavioral of Simulacion_ej6 is

  component full_adder1
    port (A : in  std_logic;
          B : in  std_logic;
          C0 : in  std_logic;
          C1 : out std_logic;
          S0 : out std_logic
          );
  end component;

  -- Senales de las entradas
  signal A_s : std_logic := '0';
  signal B_s : std_logic := '1';
  signal C0_s : std_logic := '0';

  -- Senales de salidas
  signal C1_s : std_logic;
  signal S0_s : std_logic;

begin

  UO: full_adder1
    port map (
      A => A_s,
      B => B_s,
      C0 => C0_s,
      S0 => S0_s,
      C1 => C1_s
    );

  process
  begin
    C0_s <= '0';
    A_s <= '0';
    B_s <= '0';
    wait for 100 ns;
    A_s <= '0';
    B_s <= '1';
    wait for 100 ns;
    A_s <= '1';
    B_s <= '0';
    wait for 100 ns;
    A_s <= '1';
    B_s <= '1';
    wait for 100 ns;
    wait;
  end process;

end architecture;