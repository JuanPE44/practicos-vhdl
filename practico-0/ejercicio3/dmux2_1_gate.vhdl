
-- not_gate

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity not_gate is
  port (A : in  std_logic;
        O : out std_logic
       );
end entity;

architecture Behavioral of not_gate is
begin
  O <= not A;
end architecture;

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

entity dmux2_1_gate is
  port (X  : in  std_logic;
        S  : in  std_logic;
        O1 : out std_logic;
        O2 : out std_logic
       );
end entity;

architecture sentencias_concurrentes of dmux2_1_gate is

begin
  O1 <= X and S;
  O2 <= X and not S;
end architecture;

architecture sentencias_secuenciales of dmux2_1_gate is
begin
  process (X, S)
  begin
    if S = '0' then
      O1 <= X and not S;
    else
      O2 <= X and S;
    end if;
  end process;
end architecture;

architecture instanciacion_componentes of dmux2_1_gate is
  component not_gate
    port (a : in std_logic; o : out std_logic);
  end component;

  component and_gate
    port (a, b : in std_logic; o : out std_logic);
  end component;

  component or_gate
    port (a, b : in std_logic; o : out std_logic);
  end component;

  signal notS : std_logic;
begin
  notS <= not S;
  U1: not_gate port map (a => S, o => notS);
  U2: and_gate port map (a => X, b => notS, o => O1);
  U3: and_gate port map (a => X, b => S, o => O2);
end architecture;
