----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Michele Pio Fragasso
-- 
-- Create Date: 03/07/23 13:22:45
-- Design Name: 
-- Module Name: DNN - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: This file is generated with a python script. You shall modify this by modifying 
-- the generating python script
-- Dependencies: 
-- 
-- Revision: 
-- Revision 0.01 - File Created 
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.fixed_pkg.all;


library work;
use work.DNN_package.all;

entity DNN is
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
data_in: in sfixed (neuron_input_IntWidth-1 downto -neuron_input_FracWidth);
start: in std_logic;
clk: in std_logic;
data_out: out sfixed (neuron_input_IntWidth-1 downto -neuron_input_FracWidth);
addr_in: out std_logic_vector(0 to natural(ceil(log2(real(layer_inputs(1)))))-1); --To scan through the valdation data set
addr_out: in std_logic_vector(0 to natural(ceil(log2(real(layer_outputs(3)))))-1)); --To scan through the valdation data set
end DNN;
architecture Behavioral of DNN is
type data_vect_type is array(1 to num_hidden_layers) of sfixed(neuron_input_IntWidth-1 downto -neuron_input_FracWidth);
signal data_out_vect, data_in_vect: data_vect_type;
signal start_vect: std_logic_vector(0 to num_hidden_layers);
signal data_v_vect: std_logic_vector(1 to num_hidden_layers);
signal data_in_sel_vect: std_logic_vector(0 to natural(ceil(log2(real(isum(layer_inputs)))))-1);
signal data_out_sel_vect: std_logic_vector(0 to natural(ceil(log2(real(isum(layer_outputs)))))-1);
signal data_in_sel1: std_logic_vector(0 to  natural(ceil(log2(real(layer_inputs(1)))))-1);
signal data_out_sel1: std_logic_vector(0 to  natural(ceil(log2(real(layer_outputs(1)))))-1);
signal data_in_sel2: std_logic_vector(0 to  natural(ceil(log2(real(layer_inputs(2)))))-1);
signal data_out_sel2: std_logic_vector(0 to  natural(ceil(log2(real(layer_outputs(2)))))-1);
signal data_in_sel3: std_logic_vector(0 to  natural(ceil(log2(real(layer_inputs(3)))))-1);
signal data_out_sel3: std_logic_vector(0 to  natural(ceil(log2(real(layer_outputs(3)))))-1);
signal data_in_sel4: std_logic_vector(0 to  natural(ceil(log2(real(layer_inputs(4)))))-1);
signal data_out_sel4: std_logic_vector(0 to  natural(ceil(log2(real(layer_outputs(4)))))-1);
signal data_in_sel5: std_logic_vector(0 to  natural(ceil(log2(real(layer_inputs(5)))))-1);
signal data_out_sel5: std_logic_vector(0 to  natural(ceil(log2(real(layer_outputs(5)))))-1);
signal data_in_sel6: std_logic_vector(0 to  natural(ceil(log2(real(layer_inputs(6)))))-1);
signal data_out_sel6: std_logic_vector(0 to  natural(ceil(log2(real(layer_outputs(6)))))-1);
signal data_in_sel7: std_logic_vector(0 to  natural(ceil(log2(real(layer_inputs(7)))))-1);
signal data_out_sel7: std_logic_vector(0 to  natural(ceil(log2(real(layer_outputs(7)))))-1);
signal data_in_sel8: std_logic_vector(0 to  natural(ceil(log2(real(layer_inputs(8)))))-1);
signal data_out_sel8: std_logic_vector(0 to  natural(ceil(log2(real(layer_outputs(8)))))-1);
signal data_in_sel9: std_logic_vector(0 to  natural(ceil(log2(real(layer_inputs(9)))))-1);
signal data_out_sel9: std_logic_vector(0 to  natural(ceil(log2(real(layer_outputs(9)))))-1);
signal data_in_sel10: std_logic_vector(0 to  natural(ceil(log2(real(layer_inputs(10)))))-1);
signal data_out_sel10: std_logic_vector(0 to  natural(ceil(log2(real(layer_outputs(10)))))-1);
component layer is
generic(
constant num_inputs: natural;
constant num_outputs: natural;
constant neuron_input_IntWidth: natural;
constant neuron_input_FracWidth: natural;
constant neuron_weight_IntWidth: natural;
constant neuron_weight_FracWidth: natural;
constant layer_no: natural;--Layer number (identifier)
constant act_fun_type: string; -- Choose between 'ReLU','Sig'
constant sigmoid_inputdataWidth: natural;
constant sigmoid_inputdataIntWidth: natural;
constant lyr_prms_path: string
);
port(
clk: in std_logic;
data_in: in sfixed(neuron_input_IntWidth-1 downto -neuron_input_FracWidth);
data_out_sel: in std_logic_vector(0 to natural(ceil(log2(real(num_outputs))))-1);
start: in std_logic;--to increment the counter while the output of the output is begin computed
data_out: out sfixed(neuron_input_IntWidth-1 downto -neuron_input_FracWidth);--The next layer controls which neuron's output to access
data_in_sel: out std_logic_vector(0 to natural(ceil(log2(real(num_inputs))))-1);
data_v: out std_logic);
end component;
begin
--Data Path
--Data
data_in_vect(1) <= data_in;
data_in_vect(2) <= data_out_vect(1);
data_in_vect(3) <= data_out_vect(2);
data_in_vect(4) <= data_out_vect(3);
data_in_vect(5) <= data_out_vect(4);
data_in_vect(6) <= data_out_vect(5);
data_in_vect(7) <= data_out_vect(6);
data_in_vect(8) <= data_out_vect(7);
data_in_vect(9) <= data_out_vect(8);
data_in_vect(10) <= data_out_vect(9);
data_out <= data_out_vect(3);
--Aknowledges
start_vect(1) <= start;
start_vect(2) <= data_v_vect(1);
start_vect(3) <= data_v_vect(2);
start_vect(4) <= data_v_vect(3);
start_vect(5) <= data_v_vect(4);
start_vect(6) <= data_v_vect(5);
start_vect(7) <= data_v_vect(6);
start_vect(8) <= data_v_vect(7);
start_vect(9) <= data_v_vect(8);
start_vect(10) <= data_v_vect(9);
--Data Selectors
addr_in <= data_in_sel1;
data_out_sel1 <= data_in_sel2;
data_out_sel2 <= data_in_sel3;
data_out_sel3 <= data_in_sel4;
data_out_sel4 <= data_in_sel5;
data_out_sel5 <= data_in_sel6;
data_out_sel6 <= data_in_sel7;
data_out_sel7 <= data_in_sel8;
data_out_sel8 <= data_in_sel9;
data_out_sel9 <= data_in_sel10;
data_out_sel3 <= addr_out;
layer1: layer
generic map(
num_inputs => layer_inputs(1),
num_outputs => layer_outputs(1),
neuron_input_IntWidth => neuron_input_IntWidth,
neuron_input_FracWidth => neuron_input_FracWidth,
neuron_weight_IntWidth => neuron_weight_IntWidth,
neuron_weight_FracWidth => neuron_weight_FracWidth,
layer_no => 1,
act_fun_type => act_fun_type,
sigmoid_inputdataWidth=> 10,
sigmoid_inputdataIntWidth=> 2,
lyr_prms_path => DNN_prms_path
)
port map(
clk => clk,
data_in => data_in_vect(1),
data_out_sel => data_out_sel1,
start => start_vect(1),
data_out => data_out_vect(1),
data_in_sel => data_in_sel1,
data_v => data_v_vect(1)
);


layer2: layer
generic map(
num_inputs => layer_inputs(2),
num_outputs => layer_outputs(2),
neuron_input_IntWidth => neuron_input_IntWidth,
neuron_input_FracWidth => neuron_input_FracWidth,
neuron_weight_IntWidth => neuron_weight_IntWidth,
neuron_weight_FracWidth => neuron_weight_FracWidth,
layer_no => 2,
act_fun_type => act_fun_type,
sigmoid_inputdataWidth=> 10,
sigmoid_inputdataIntWidth=> 2,
lyr_prms_path => DNN_prms_path
)
port map(
clk => clk,
data_in => data_in_vect(2),
data_out_sel => data_out_sel2,
start => start_vect(2),
data_out => data_out_vect(2),
data_in_sel => data_in_sel2,
data_v => data_v_vect(2)
);


layer3: layer
generic map(
num_inputs => layer_inputs(3),
num_outputs => layer_outputs(3),
neuron_input_IntWidth => neuron_input_IntWidth,
neuron_input_FracWidth => neuron_input_FracWidth,
neuron_weight_IntWidth => neuron_weight_IntWidth,
neuron_weight_FracWidth => neuron_weight_FracWidth,
layer_no => 3,
act_fun_type => act_fun_type,
sigmoid_inputdataWidth=> 10,
sigmoid_inputdataIntWidth=> 2,
lyr_prms_path => DNN_prms_path
)
port map(
clk => clk,
data_in => data_in_vect(3),
data_out_sel => data_out_sel3,
start => start_vect(3),
data_out => data_out_vect(3),
data_in_sel => data_in_sel3,
data_v => data_v_vect(3)
);


layer4: layer
generic map(
num_inputs => layer_inputs(4),
num_outputs => layer_outputs(4),
neuron_input_IntWidth => neuron_input_IntWidth,
neuron_input_FracWidth => neuron_input_FracWidth,
neuron_weight_IntWidth => neuron_weight_IntWidth,
neuron_weight_FracWidth => neuron_weight_FracWidth,
layer_no => 4,
act_fun_type => act_fun_type,
sigmoid_inputdataWidth=> 10,
sigmoid_inputdataIntWidth=> 2,
lyr_prms_path => DNN_prms_path
)
port map(
clk => clk,
data_in => data_in_vect(4),
data_out_sel => data_out_sel4,
start => start_vect(4),
data_out => data_out_vect(4),
data_in_sel => data_in_sel4,
data_v => data_v_vect(4)
);


layer5: layer
generic map(
num_inputs => layer_inputs(5),
num_outputs => layer_outputs(5),
neuron_input_IntWidth => neuron_input_IntWidth,
neuron_input_FracWidth => neuron_input_FracWidth,
neuron_weight_IntWidth => neuron_weight_IntWidth,
neuron_weight_FracWidth => neuron_weight_FracWidth,
layer_no => 5,
act_fun_type => act_fun_type,
sigmoid_inputdataWidth=> 10,
sigmoid_inputdataIntWidth=> 2,
lyr_prms_path => DNN_prms_path
)
port map(
clk => clk,
data_in => data_in_vect(5),
data_out_sel => data_out_sel5,
start => start_vect(5),
data_out => data_out_vect(5),
data_in_sel => data_in_sel5,
data_v => data_v_vect(5)
);


layer6: layer
generic map(
num_inputs => layer_inputs(6),
num_outputs => layer_outputs(6),
neuron_input_IntWidth => neuron_input_IntWidth,
neuron_input_FracWidth => neuron_input_FracWidth,
neuron_weight_IntWidth => neuron_weight_IntWidth,
neuron_weight_FracWidth => neuron_weight_FracWidth,
layer_no => 6,
act_fun_type => act_fun_type,
sigmoid_inputdataWidth=> 10,
sigmoid_inputdataIntWidth=> 2,
lyr_prms_path => DNN_prms_path
)
port map(
clk => clk,
data_in => data_in_vect(6),
data_out_sel => data_out_sel6,
start => start_vect(6),
data_out => data_out_vect(6),
data_in_sel => data_in_sel6,
data_v => data_v_vect(6)
);


layer7: layer
generic map(
num_inputs => layer_inputs(7),
num_outputs => layer_outputs(7),
neuron_input_IntWidth => neuron_input_IntWidth,
neuron_input_FracWidth => neuron_input_FracWidth,
neuron_weight_IntWidth => neuron_weight_IntWidth,
neuron_weight_FracWidth => neuron_weight_FracWidth,
layer_no => 7,
act_fun_type => act_fun_type,
sigmoid_inputdataWidth=> 10,
sigmoid_inputdataIntWidth=> 2,
lyr_prms_path => DNN_prms_path
)
port map(
clk => clk,
data_in => data_in_vect(7),
data_out_sel => data_out_sel7,
start => start_vect(7),
data_out => data_out_vect(7),
data_in_sel => data_in_sel7,
data_v => data_v_vect(7)
);


layer8: layer
generic map(
num_inputs => layer_inputs(8),
num_outputs => layer_outputs(8),
neuron_input_IntWidth => neuron_input_IntWidth,
neuron_input_FracWidth => neuron_input_FracWidth,
neuron_weight_IntWidth => neuron_weight_IntWidth,
neuron_weight_FracWidth => neuron_weight_FracWidth,
layer_no => 8,
act_fun_type => act_fun_type,
sigmoid_inputdataWidth=> 10,
sigmoid_inputdataIntWidth=> 2,
lyr_prms_path => DNN_prms_path
)
port map(
clk => clk,
data_in => data_in_vect(8),
data_out_sel => data_out_sel8,
start => start_vect(8),
data_out => data_out_vect(8),
data_in_sel => data_in_sel8,
data_v => data_v_vect(8)
);


layer9: layer
generic map(
num_inputs => layer_inputs(9),
num_outputs => layer_outputs(9),
neuron_input_IntWidth => neuron_input_IntWidth,
neuron_input_FracWidth => neuron_input_FracWidth,
neuron_weight_IntWidth => neuron_weight_IntWidth,
neuron_weight_FracWidth => neuron_weight_FracWidth,
layer_no => 9,
act_fun_type => act_fun_type,
sigmoid_inputdataWidth=> 10,
sigmoid_inputdataIntWidth=> 2,
lyr_prms_path => DNN_prms_path
)
port map(
clk => clk,
data_in => data_in_vect(9),
data_out_sel => data_out_sel9,
start => start_vect(9),
data_out => data_out_vect(9),
data_in_sel => data_in_sel9,
data_v => data_v_vect(9)
);


layer10: layer
generic map(
num_inputs => layer_inputs(10),
num_outputs => layer_outputs(10),
neuron_input_IntWidth => neuron_input_IntWidth,
neuron_input_FracWidth => neuron_input_FracWidth,
neuron_weight_IntWidth => neuron_weight_IntWidth,
neuron_weight_FracWidth => neuron_weight_FracWidth,
layer_no => 10,
act_fun_type => act_fun_type,
sigmoid_inputdataWidth=> 10,
sigmoid_inputdataIntWidth=> 2,
lyr_prms_path => DNN_prms_path
)
port map(
clk => clk,
data_in => data_in_vect(10),
data_out_sel => data_out_sel10,
start => start_vect(10),
data_out => data_out_vect(10),
data_in_sel => data_in_sel10,
data_v => data_v_vect(10)
);


end Behavioral;
