library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity mux4_4_gate is
  port (A : in  std_logic_vector(3 downto 0);
        B : in  std_logic_vector(3 downto 0);
        C : in  std_logic_vector(3 downto 0);
        D : in  std_logic_vector(3 downto 0);
        S : in  std_logic_vector(3 downto 0);
        O : out std_logic_vector(3 downto 0)
       );
end entity;

architecture sentencias_concurrentes of mux4_4_gate is
begin
  with S select
    O <= A   when "00",
         B   when "01",
         C   when "10",
         D   when "11",
         '0' when others;
end architecture;

