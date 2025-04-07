library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity or_gate is
  port (A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        S : out STD_LOGIC
       );
end entity;

architecture Behavioral of or_gate is

begin
  S <= A or B;
end architecture;
