library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity comparador is
  port (A : in  std_logic_vector(1 downto 0);
        B : in  std_logic_vector(1 downto 0);
        G  : out std_logic;
        E  : out std_logic
       );
end entity;

architecture Behavioral of comparador is
begin
  process(A, B)
  begin
    if A > B then
      G <= '1';
    else
      G <= '0';
    end if;
    if A = B then
      E <= '1';
    else
      E <= '0';
    end if;
  end process;
end architecture;
