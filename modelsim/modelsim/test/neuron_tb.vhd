----------------------------------------------------------------------------------
-- Company: Univesity of Trento
-- Engineer: Michele Pio Fragasso
-- 
-- Create Date: 03/24/2022 05:04:28 PM
-- Design Name: 
-- Module Name: neuron_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.fixed_pkg.all;

library work;
use work.DNN_package.all;

library std;
use std.textio.all;


entity neuron_tb is

end neuron_tb;

architecture Behavioral of neuron_tb is

type rom_type is array (0 to neuron_rom_depth-1) of sfixed(neuron_int_width-1 downto -neuron_frac_width);
type datain_type is array(0 to neuron_rom_depth-1) of sfixed(neuron_int_width-1 downto -neuron_frac_width);

function makesfixed (bit_in: in bit_vector(neuron_rom_width-1 downto 0)) return sfixed is
    variable fixedpoint_s: sfixed(neuron_int_width-1 downto -neuron_frac_width);
    --variable a: std_logic := 0;
    begin
    for i in fixedpoint_s'range loop
        fixedpoint_s(i) := To_StdULogic(bit_in(i+neuron_frac_width));
    end loop;
    return fixedpoint_s;
end function;

impure function gen_datain(dataset_path: in string) return datain_type is

file text_header: text open read_mode is dataset_path;
variable text_line: line;
variable line_i: bit_vector(0 to neuron_rom_width-1);
variable dataset_content: datain_type;

    begin
    for i in dataset_content'range loop
        readline(text_header, text_line);
        read(text_line, line_i);
        dataset_content(i) := makesfixed(line_i);
    end loop;
    file_close(text_header);
    return dataset_content;
end function;

signal clk: std_logic:='0';
signal input_reg: datain_type := gen_datain(dataset_path);
signal data_in: sfixed(input_int_width-1 downto -input_frac_width):=(others=>'0');
signal addr: std_logic_vector(0 to natural(ceil(log2(real(neuron_rom_width))))-1) := (others=>'0');
signal addr_TC: std_logic:= '0';
signal input_valid: std_logic :='1';
signal data_out: sfixed (neuron_int_width-1 downto -neuron_frac_width);
signal data_v: std_logic;
signal i: std_logic_vector(0 to 1) := '0'&'0';
signal mul_sel: std_logic;





component neuron is
generic(
    constant rom_width: natural;
    constant rom_depth: natural;
    constant neuron_file: string);
port(
    clk: in std_logic;
    data_in: in sfixed (neuron_int_width-1 downto -neuron_frac_width);
    addr: in std_logic_vector (0 to natural(ceil(log2(real(neuron_rom_width))))-1);
    addr_TC: in std_logic; --When the address counter reaches the top this signal goes high. When  
	mul_sel: in std_logic;
    input_valid: in std_logic; 
    data_out: out sfixed (neuron_int_width-1 downto -neuron_frac_width);
    data_v: out std_logic);
end component neuron;



begin

neuron_comp: neuron
generic map(
rom_width => neuron_rom_width,
rom_depth => neuron_rom_depth,
neuron_file => neuron_rom_file)
port map(
    clk => clk,
    data_in => data_in,
    addr => addr,
    addr_TC => addr_TC,
	mul_sel => mul_sel,
    input_valid => input_valid,
    data_out => data_out,
    data_v => data_v);

clk_gen: process is
begin
wait for 20 ns;
clk <= not(clk);
end process clk_gen;

data_gen: process(clk) is
begin
if rising_edge(clk) then
    i <= std_logic_vector(unsigned(i)+1);
    if unsigned(i) > neuron_rom_depth then
        --addr_TC <= '1';
        --input_valid <= '0';
    else
        --input_valid <= '1';
        data_in <= input_reg(to_integer(unsigned(i)));
    end if;
end if;
end process data_gen;

addr_gen: process(clk) begin
    if rising_edge(clk) then
        addr <= std_logic_vector( unsigned(addr) + 1 ) after 10 ns;
        if unsigned(addr) = neuron_rom_depth then
            addr <= (others=>'0');
            addr_TC <= '1';
            input_valid <= '0';
        end if;
    end if;
end process addr_gen;






end Behavioral;
