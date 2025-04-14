
-- not_gate4

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity not_gate4 is
  port (A : in  std_logic_vector(3 downto 0);
        O : out std_logic_vector(3 downto 0)
       );
end entity;

architecture Behavioral of not_gate4 is
begin
  O <= not A;
end architecture;

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

entity dmux2_4_gate is
  port (X  : in  std_logic_vector(3 downto 0);
        S  : in  std_logic_vector(3 downto 0);
        O1 : out std_logic_vector(3 downto 0);
        O2 : out std_logic_vector(3 downto 0)
       );
end entity;

architecture sentencias_concurrentes of dmux2_4_gate is

begin
  O1 <= X and S;
  O2 <= X and not S;
end architecture;

architecture sentencias_secuenciales of dmux2_4_gate is
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

architecture instanciacion_componentes of dmux2_4_gate is
  component not_gate4
    port (a : in std_logic; o : out std_logic);
  end component;

  component and_gate4
    port (a, b : in std_logic; o : out std_logic);
  end component;

  component or_gate4
    port (a, b : in std_logic; o : out std_logic);
  end component;

  signal notS : std_logic;
begin
  notS <= not S;
  U1: not_gate4 port map (a => S, o => notS);
  U2: and_gate4 port map (a => X, b => notS, o => O1);
  U3: and_gate4 port map (a => X, b => S, o => O2);
end architecture;
