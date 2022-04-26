----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2022 07:49:04 PM
-- Design Name: 
-- Module Name: layer_tb - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.math_real.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

library ieee_proposed;
use ieee_proposed.fixed_pkg.all;

library work;
use work.DNN_package.all;


entity layer_tb is
end layer_tb;


architecture Behavioral of layer_tb is
--Code to read input
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

file text_header: text is in dataset_path;
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

--Data Input
signal input_reg: datain_type := gen_datain(dataset_path);

signal clk: std_logic := '0';
signal data_in: sfixed (input_int_width-1 downto -input_frac_width) := input_reg(0);
signal addr: std_logic_vector (0 to natural(ceil(log2(real(neuron_rom_width))))):=(others=>'0');
signal start: std_logic:='1';
signal data_out: sfixed (input_int_width-1 downto -input_frac_width);
signal data_out_sel: std_logic_vector(0 to natural(ceil(log2(real(30))))-1);--num_outputs=30
--signal data_in_sel: std_logic_vector(0 to natural(ceil(log2(real(30))))-1);--num_outputs=30
signal data_v: std_logic := '0';
signal in_sel: std_logic_vector(0 to natural(ceil(log2(real(30))))-1):=(others=>'0');--num_inputs=30



component layer is
generic(
    num_inputs: natural;
    num_outputs: natural;
    layer_no: natural;--Layer number (identifier)
    act_type: string; -- Choose between "ReLU","Sig"
    act_fun_size: natural); -- If the user choose an analytical activation function the number of sample have to be chosen
port (
    clk: in std_logic;
    data_in: in sfixed (input_int_width-1 downto -input_frac_width);
    data_out_sel: in std_logic_vector(0 to natural(ceil(log2(real(30))))-1):=(others => '0');--num_outputs=30
    start: in std_logic;
    data_out: out sfixed (input_int_width-1 downto -input_frac_width);
    data_in_sel: out std_logic_vector(0 to natural(ceil(log2(real(30))))-1);--num_outputs=30
    data_v: out std_logic);
end component layer;
begin

layer_comp: layer
generic map(
num_inputs => 30,
num_outputs => 30,
layer_no => 1,
act_type => "ReLU",
act_fun_size => 30
)
port map(
clk => clk,
data_in => data_in,
data_out_sel => data_out_sel,
start => start,
data_out => data_out,
data_in_sel => in_sel,
data_v => data_v);


clk_gen: process is
begin
wait for 20 ns;
clk <= not(clk);
end process clk_gen;


data_gen: process(clk) is
--the assignment <= is a non-blocking assignment
begin
if rising_edge(clk) then
    --in_sel <= std_logic_vector(unsigned(in_sel) + 1);
    if unsigned(in_sel) >= neuron_rom_depth then --After all the data is fed to the layer start is permanently set to 0. Leaving the layer in the idle state.
        --addr_TC <= '1';
        --start <= '0';
        --in_sel <= (others => '0');
    else
        --input_valid <= '1';
        data_in <= input_reg(to_integer(unsigned(in_sel)));
    end if;    
end if;
end process data_gen;

start_pr: process is
begin
wait for 60 ns;
start <= '0';
end process start_pr;



end Behavioral;
