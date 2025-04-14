-- or_gate4

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity or_gate4 is
  port (A : in  std_logic_vector(3 downto 0);
        B : in  std_logic_vector(3 downto 0);
        O : out std_logic_vector(3 downto 0)
       );
end entity;

architecture Behavioral of or_gate4 is
begin
  O <= A or B;
end architecture;

-- and_gate4

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity and_gate4 is
  port (A : in  std_logic_vector(3 downto 0);
        B : in  std_logic_vector(3 downto 0);
        O : out std_logic_vector(3 downto 0)
       );
end entity;

architecture Behavioral of and_gate4 is
begin
  O <= A and B;
end architecture;

-- mux2_4_gate 

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity mux2_4_gate is
  port (A : in  std_logic_vector(3 downto 0);
        B : in  std_logic_vector(3 downto 0);
        S : in  std_logic_vector(3 downto 0);
        O : out std_logic_vector(3 downto 0)
       );
end entity;

architecture sentencias_concurrentes of mux2_4_gate is
begin
  O <= A when S = '0' else B;
end architecture;

architecture sentencias_secuenciales of mux2_4_gate is
begin
  process (A, B, S)
  begin
    if S = '0' then
      O <= A;
    else
      O <= B;
    end if;
  end process;
end architecture;

architecture instanciacion_componentes of mux2_4_gate is
  component and_gate4
    port (a, b : in std_logic; o : out std_logic);
  end component;

  component or_gate4
    port (a, b : in std_logic; o : out std_logic);
  end component;

  signal notS, out1, out2 : std_logic;
begin
  notS <= not S;
  U1: and_gate4 port map (a => A, b => notS, o => out1);
  U2: and_gate4 port map (a => B, b => S, o => out2);
  U3: or_gate4 port map (a => out1, b => out2, o => O);
end architecture;
