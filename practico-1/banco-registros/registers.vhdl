library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;
  use IEEE.std_logic_unsigned.all;

entity registers is
  port (clk, rst, wr : in  std_logic;
        reg1_rd, reg2_rd, reg_wr: in std_logic_vector(4 downto 0);
        data_wr : in std_logic_vector(31 downto 0);
        data1_rd, data2_rd : out std_logic_vector(31 downto 0)
       );
end entity;

architecture Behavioral of registers is
  type reg_array is array(0 to 31) of std_logic_vector(31 downto 0);
  signal regs : reg_array;
begin
  process(clk, rst)
  begin
    if rst = '1' then
      regs <= (others => (others => '0'));
    else if falling_edge(clk) then 
      if wr = '1' and reg_wr <> "00000"then
        regs(to_integer(reg_wr)) <= data_wr;
      end if;
    end if;
  end process;

  data1_rd <= regs(to_integer(reg1_rd)) when reg1_rd <> "00000" else x"00000000";
  data2_rd <= regs(to_integer(reg2_rd)) when reg2_rd <> "00000" else x"00000000";
end architecture;
