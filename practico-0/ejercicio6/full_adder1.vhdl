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
  C1 <= (A and B) or ((a xor b) and C0);
  S0 <= (A xor B) xor C0;
end architecture;
