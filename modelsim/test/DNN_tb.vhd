----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2022 11:55:17 AM
-- Design Name: 
-- Module Name: DNN_tb - Behavioral
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
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.fixed_pkg.all;

library std;
use std.textio.all;

library work;
use work.DNN_package.all;

entity DNN_tb is

end DNN_tb;

architecture Behavioral of DNN_tb is




type datain_type is array(0 to DNN_num_inputs-1) of sfixed(DNN_neuron_input_IntWidth-1 downto -DNN_neuron_input_FracWidth);

impure function datain_makesfixed (bit_in: in bit_vector(DNN_neuron_input_Width-1 downto 0)) return sfixed is

    variable fixedpoint_s: sfixed(DNN_neuron_input_IntWidth-1 downto -DNN_neuron_input_FracWidth);
    begin
    for i in fixedpoint_s'range loop
        fixedpoint_s(i) := To_StdULogic(bit_in(i+DNN_neuron_input_FracWidth));
    end loop;
    return fixedpoint_s;

end function;

impure function gen_datain (dataset_path: in string) return datain_type is

file text_header: text open read_mode is dataset_path;
variable text_line: line;
variable line_i: bit_vector(DNN_neuron_input_Width-1 downto 0);
variable dataset_content: datain_type;

    begin
    for i in dataset_content'range loop
            readline(text_header, text_line);
            read(text_line, line_i);
            dataset_content(i) := datain_makesfixed(line_i);
    end loop;
    file_close(text_header);
    return dataset_content;

end function;

constant test_dataset_path: string := "../tb_files/DNN/tb5/dataset/test_data.txt";

signal input_reg: datain_type := gen_datain(test_dataset_path);

signal data_in: sfixed (DNN_neuron_input_IntWidth-1 downto -DNN_neuron_input_FracWidth):= (others => '0');
signal start: std_logic := '1';
signal clk: std_logic := '0';
signal data_out: sfixed (DNN_neuron_input_IntWidth-1 downto -DNN_neuron_input_FracWidth) := (others => '0');
signal addr_in: std_logic_vector(0 to natural(ceil(log2(real(layer_inputs(1)))))-1) := (others => '0');
signal addr_out: std_logic_vector(0 to natural(ceil(log2(real(layer_outputs(3)))))-1) := (others => '0');


component DNN is
generic(
constant neuron_input_IntWidth: natural;
constant neuron_input_FracWidth: natural;
constant neuron_weight_IntWidth: natural;
constant neuron_weight_FracWidth: natural;
constant sigmoid_inputdataWidth: natural;
constant sigmoid_inputdataIntWidth: natural;
constant act_fun_type: string;
constant DNN_prms_path: string
);
port(
data_in: in sfixed (DNN_neuron_input_IntWidth-1 downto -DNN_neuron_input_FracWidth);
start: in std_logic;
clk: in std_logic;
data_out: out sfixed (DNN_neuron_input_IntWidth-1 downto -DNN_neuron_input_FracWidth);
addr_in: out std_logic_vector(0 to natural(ceil(log2(real(layer_inputs(1)))))-1); --To scan through the valdation data set
addr_out: in std_logic_vector(0 to natural(ceil(log2(real(layer_outputs(3)))))-1) --To scan through the valdation data set
);
end component;

begin

DNN_cmp: DNN
generic map(
neuron_input_IntWidth => DNN_neuron_input_IntWidth,
neuron_input_FracWidth => DNN_neuron_input_FracWidth,
neuron_weight_IntWidth => DNN_neuron_weight_IntWidth,
neuron_weight_FracWidth => DNN_neuron_weight_FracWidth,
sigmoid_inputdataWidth => DNN_sigmoid_inputdata_Width,
sigmoid_inputdataIntWidth => DNN_sigmoid_inputdata_IntWidth,
act_fun_type => act_fun_type,
DNN_prms_path => DNN_prms_path
)
port map(
data_in => data_in,
start => start,
clk => clk,
data_out => data_out,
addr_in =>  addr_in, --To scan through the validation data set
addr_out => addr_out --To scan through the validation data set
);

clk_gen: process is

begin
wait for 20 ns;
clk <= not(clk);
end process clk_gen;

data_in <=  input_reg(to_integer(unsigned(addr_in)));

start_gen: process is
begin
wait for 80 ns;
start <= '0';
end process start_gen;



end Behavioral;
