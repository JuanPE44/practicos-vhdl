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
  component full_adder1
  port (a : in std_logic;
        b : in std_logic;
        c0 : in std_logic;
        c1 : out std_logic;
        s0 : out std_logic
        );
  end component;
  signal c1, c2, c3, c4, c5, c6, c7 : std_logic;
begin
  U1: full_adder1 port map (a => A, b => notS, o => out1);


end architecture;
