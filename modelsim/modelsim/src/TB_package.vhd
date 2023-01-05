library ieee;
use ieee.std_logic_1164.all;
use ieee.fixed_pkg.all;
use ieee.math_real.all;

package TB_package is

--Constants for testbenching the layer
constant layer_tb_num_inputs: natural := 784;
constant layer_tb_num_neurons: natural := 30;
constant layer_tb_sigmoid_inputdata_Width: natural  := 5;
constant layer_tb_sigmoid_inputdata_IntWidth: natural := 2;
constant layer_tb_neuron_input_Width: natural := 32;
constant layer_tb_neuron_input_IntWidth: natural  := 16;
constant layer_tb_neuron_input_FracWidth: natural := layer_tb_neuron_input_Width-layer_tb_neuron_input_IntWidth;
constant layer_tb_neuron_weight_Width : natural := 32;
constant layer_tb_neuron_weight_IntWidth: natural := 2;
constant layer_tb_neuron_weight_FracWidth: natural := layer_tb_neuron_weight_Width-layer_tb_neuron_weight_IntWidth;

end package TB_package;

package body TB_package is

end package body TB_package;

