-- or_gate

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity or_gate is
  port (A : in  std_logic;
        B : in  std_logic;
        O : out std_logic
       );
end entity;

architecture Behavioral of or_gate is
begin
  O <= A or B;
end architecture;

-- and_gate

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity and_gate is
  port (A : in  std_logic;
        B : in  std_logic;
        O : out std_logic
       );
end entity;

architecture Behavioral of and_gate is
begin
  O <= A and B;
end architecture;

-- mux2_1_gate 

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity mux2_1_gate is
  port (A : in  std_logic;
        B : in  std_logic;
        S : in  std_logic;
        O : out std_logic
       );
end entity;

architecture sentencias_concurrentes of mux2_1_gate is
begin
  O <= A when S = '0' else B;
end architecture;

architecture sentencias_secuenciales of mux2_1_gate is
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

architecture instanciacion_componentes of mux2_1_gate is
  component and_gate
    port (a, b : in std_logic; o : out std_logic);
  end component;

  component or_gate
    port (a, b : in std_logic; o : out std_logic);
  end component;

  signal notS, out1, out2 : std_logic;
begin
  notS <= not S;
  U1: and_gate port map (a => A, b => notS, o => out1);
  U2: and_gate port map (a => B, b => S, o => out2);
  U3: or_gate port map (a => out1, b => out2, o => O);
end architecture;
