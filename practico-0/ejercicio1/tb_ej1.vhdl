library IEEE;
  use IEEE.STD_LOGIC_1164.all;

entity Simulacion_ej1 is
  --  
end entity;

architecture Behavioral of Simulacion_ej1 is

  component nombre_entidad
    port (A : in  std_logic_vector(2 downto 0);
          S : out std_logic
         );
  end component;

  -- Senales de las entradas
  signal A_s : std_logic_vector(2 downto 0) := "000";

  -- Senales de salidas
  signal S_s : std_logic;

begin

  UO: nombre_entidad
    port map (
      A => A_s,
      S => S_s
    );

  process
  begin

    A_s <= "010";
    wait for 100 ns;

    A_s <= "001";
    wait for 100 ns;

    A_s <= "000";
    wait for 100 ns;

    wait;
  end process;

end architecture;
