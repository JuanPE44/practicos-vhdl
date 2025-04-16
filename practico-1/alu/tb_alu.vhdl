library IEE;
use IEEE.STD_LOGIC_1164.all;


entity Simulacion_alu is
end entity;

architecture behavior of Simulacion_alu is
  component alu 
    port(A,B: std_logic_vector(31 downto 0);
         CONTROL: std_logic_vector(2 downto 0);
         RESULT: std_logic_vector(31 downto 0);
         ZERO : std_logic);
  end component;

  signal A_s : std_logic_vector(31 downto 0);
  signal B_s : std_logic_vector(31 downto 0);
  signal RESULT_s : std_logic_vector(31 downto 0);
  signal CONTROL_s : std_logic_vector(2 downto 0);
  signal ZERO : std_logic;

begin
  UO : alu
  port map(
    A => A_s,
    B => B_s,
    CONTROL => CONTROL_s,
    RESULT => RESULT_s,
    ZERO => ZERO
  );

  process
  begin
    A_s <= x"00000001";
    B_s <= x"00000001";
    CONTROL_s <= "000";
    wait for 100 ns;
    wait for 100 ns;
    A_s <= x"00100001";
    B_s <= x"00001001";
    CONTROL_s <= "001";
    wait for 100 ns;
    wait for 100 ns;
    A_s <= x"00000001";
    B_s <= x"00000001";
    CONTROL_s <= "010";
    wait for 100 ns;
    A_s <= x"00000001";
    B_s <= x"00000001";
    CONTROL_s <= "100";
    wait for 100 ns;
    A_s <= x"00000001";
    B_s <= x"00000001";
    CONTROL_s <= "110";
    wait for 100 ns;
    wait;
  end process;

end architecture;