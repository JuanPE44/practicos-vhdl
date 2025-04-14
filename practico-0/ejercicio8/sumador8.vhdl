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

architecture Behavioral of full_adder8 is
  component full_adder1
    port (
      A_n  : in std_logic;
      B_n  : in std_logic;
      C0_n : in std_logic;
      C1_n : out std_logic;
      S0_n : out std_logic
    );
  end component;

  signal C : std_logic_vector(8 downto 0);

begin
  C(0) <= '0'; 

  gen_adders: for i in 0 to 7 generate
    U: full_adder_bit
      port map (
        A_n  => A(i),
        B_n  => B(i),
        C0_n => C(i),
        S0_n => S(i),
        C1_n => C(i+1)
      );
  end generate;

  S(8) <= C(8); 
end architecture;

