library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity full_adder1 is
  port (A : in  std_logic;
        B : in  std_logic;
        C0  : in std_logic;
        C1  : out std_logic;
        S0  : out std_logic
       );
end entity;

architecture Behavioral of full_adder1 is
  
begin
  S0 <=  (A xor B) xor C0;
  C1 <= (A and B) or ((A xor B) and C0);
end architecture;



library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity full_adder1 is
  port (A : in  std_logic_vector(7 downto 0);
        B : in  std_logic_vector(7 downto 0);
        S  : out std_logic_vector(8 downto 0)
       );
end entity;

architecture Behavioral of full_adder1 is
  
begin
  S0 <=  (A xor B) xor C0;
  C1 <= (A and B) or ((A xor B) and C0);
end architecture;


