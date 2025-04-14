library IEEE;
  use IEEE.STD_LOGIC_1164.all;

entity Simulacion_ej4 is
  --  
end entity;

architecture Behavioral of Simulacion_ej3 is

  component dmux2_1_gate
    port (A  : in  std_logic;
          B  : in  std_logic;
          C : in std_logic;
          D : in std_logic;
          S : in std_logic_vector(1 downto 0);
          O : out std_logic;
         );
  end component;

  -- Senales de las entradas
  signal A_s : std_logic := '0';
  signal B_s : std_logic := '1';
  signal C_s : std_logic := '1';
  signal D_s : std_logic := '1';

  signal S_s : std_logic := "00";
  -- Senales de salidas
  signal O_s : std_logic;

begin

  UO: dmux2_1_gate
    port map (
      A => A_s,
      B => B_s,
      C => C_s,
      D => D_s,
      S => S_s,
      S => S_s
    );

  process
  begin
    A_s = '0';
    B_s = '1';
    B_s = '0';
    D_s = '1';
    S_s = "00";
    wait for 100 ns;
    S_s <= "01";
    wait for 100 ns;
    S_s <= "11";
    wait for 100 ns;
    wait;
  end process;

end architecture;
