library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity Simulacion_registers is
end entity;

architecture behavior of Simulacion_registers is

  component registers 
    port(
      clk      : in std_logic;
      rst      : in std_logic;
      wr       : in std_logic;
      reg1_rd  : in std_logic_vector(4 downto 0);
      reg2_rd  : in std_logic_vector(4 downto 0);
      reg_wr   : in std_logic_vector(4 downto 0);
      data_wr  : in std_logic_vector(31 downto 0);
      data1_rd : out std_logic_vector(31 downto 0);
      data2_rd : out std_logic_vector(31 downto 0)
    );
  end component;

  -- Señales para los puertos del banco de registros
  signal clk_tb, rst, wr : std_logic := '0';
  signal reg1_rd, reg2_rd, reg_wr : std_logic_vector(4 downto 0) := (others => '0');
  signal data_wr : std_logic_vector(31 downto 0) := (others => '0');
  signal data1_rd, data2_rd : std_logic_vector(31 downto 0);

begin

  -- Instanciación del módulo a testear
  UUT: registers
    port map(
      clk      => clk_tb,
      rst      => rst,
      wr       => wr,
      reg1_rd  => reg1_rd,
      reg2_rd  => reg2_rd,
      reg_wr   => reg_wr,
      data_wr  => data_wr,
      data1_rd => data1_rd,
      data2_rd => data2_rd
    );

  -- Proceso para generar el reloj (clock)
  clk_process : process
  begin
    while now < 300 ns loop  -- Duración total de simulación
      clk_tb <= '0';
      wait for 10 ns;
      clk_tb <= '1';
      wait for 10 ns;
    end loop;
    wait;
  end process;

  -- Estímulos de prueba
  stim_proc: process
  begin
    -- Inicialización
    rst <= '1';  -- Reset activo
    wait for 20 ns;
    rst <= '0';  -- Desactivar reset
    wait for 20 ns;

    -- Escritura en el registro 1
    reg_wr <= "00001";
    data_wr <= x"00000010";
    wr <= '1';
    wait for 20 ns;
    wr <= '0';
    wait for 20 ns;

    -- Leer registro 1
    reg1_rd <= "00001";
    wait for 20 ns;

    -- Escritura en el registro 2
    reg_wr <= "00010";
    data_wr <= x"00000020";
    wr <= '1';
    wait for 20 ns;
    wr <= '0';
    wait for 20 ns;

    -- Leer registro 2
    reg2_rd <= "00010";
    wait for 20 ns;

    -- Escritura en el registro 3
    reg_wr <= "00011";
    data_wr <= x"00000030";
    wr <= '1';
    wait for 20 ns;
    wr <= '0';
    wait for 20 ns;

    -- Leer registro 3
    reg1_rd <= "00011";
    wait for 20 ns;

    wait;
  end process;

end architecture;
