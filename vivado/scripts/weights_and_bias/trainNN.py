#############################################################################
#
#Engineer: Michele Pio Fragasso 
#Description: This python script trains a DNN and generates the DNN vhdl architecture 
#               which implements it.
#
#
#############################################################################

import mnist_loader
import network2
import json

def insert_n_check_user_input():
    check = 0
    while check == 0:
        val = input()
        try:
            float(val)
            check = 1
        except ValueError:
            print("Input is not a number. Insert it again")
            check = 0
    return val

#DNN PARAMETERS
#Number of layers
print("Insert the number of the layers of the DNN:")
num_layers=int(insert_n_check_user_input())

num_inputs = []
num_outputs = []
print("Insert the number of inputs to the layer no."+str(1))
num_inputs.append(int(insert_n_check_user_input()))        
for i in range(1,num_layers):
    print("Insert the number of inputs to the layer no."+str(i+1))
    num_inputs.append(int(insert_n_check_user_input()))
    num_outputs.append(int(num_inputs[i]))
print("Insert the number of the output of the layer no."+str(i+1))
num_outputs.append(int(insert_n_check_user_input()))

#DNN TRAINING    
#Loading the data and dividind the dataset between training and validation data.
training_data, validation_data, test_data = mnist_loader.load_data_wrapper()
#Creating the layers of the DNN. The layers' neuron number are enumerated. starting from
#the input layer until the output layer.
net = network2.Network([num_inputs[0]]+num_outputs)#change the number of layers or number of neurons in each layer here
#Validation Data Creation
validation_data = list(validation_data)
#Training Data Creation
training_data = list(training_data)
#Computing the weights and bias for every neuron.
#Input format: training data, number of iterations, ..., Learning Rate
net.SGD(training_data, 30, 10, 0.1, lmbda=5.0,evaluation_data=validation_data, monitor_evaluation_accuracy=True)
#Saving the weights and biases in a file.
net.save("WeightsAndBiases.txt")

#GENERATING DNN VHDL ARCHITECTURE
#Generating DNN_package.vhd
try:
    f = open("../../src/DNN_package.vhd", "w")
    f.write("library ieee_proposed;\n"
            "use ieee_proposed.fixed_pkg.all;\n"
            "library ieee;\n"
            "use ieee.std_logic_1164.all;\n"
            "use ieee.math_real.all;\n"
            "package DNN_package is\n"
    "-- Package Declarative Part\n"
    "--(It contains variables, types, procedures and function declaration)\n"
    "--TestBench for neuron entities and its subentities\n"
    "constant neuron_rom_depth : natural := 30;--Number of weights for the neuron to be tested (which corresponds to the the number of input connected to the neuron)\n"
    "constant neuron_rom_width : natural := 32;--Bits for fixed-point representation.\n"
	"constant neuron_rom_file : string := \"../scripts/weights_and_bias/w_b/w_2_10.mif\";\n"
	"--Fixed Point Representation\n"
	"constant input_depth: natural := neuron_rom_depth;--Input sequence widths\n"
    "constant input_width: natural := 32;\n"
	"constant input_int_width: natural := 16;\n"
	"constant input_frac_width: natural := input_width-input_int_width;\n"
	"constant dataset_path: string := \"../scripts/datasets/testData/input_neuron2.mif\";\n"
	"--Weights widths\n"
	"constant neuron_width_sfixed: natural := neuron_rom_width; --Bit number for fixed point representation.\n"
	"constant neuron_int_width: natural := 16;--number of Bits to represent the integer part (including the sign)\n"
	"constant neuron_frac_width: natural := neuron_rom_width - neuron_int_width; --Number of bits to reprent the fractional part.\n"
	"--Bias widhts\n"
	"constant neuron_width_sfixed_b: natural := neuron_rom_width; --Bit number for fixed point representation.\n"
	"constant neuron_int_width_b: natural := 1;--number of Bits to represent the integer part (including the sign)\n"
	"constant neuron_frac_width_b: natural := neuron_width_sfixed_b - neuron_int_width_b; --Number of bits to reprent the fractional part.\n"
	"--constant neuron_value_b: sfixed(neuron_int_width_b-1 downto -neuron_frac_width_b):=(15=>'1',14=>'1',13=>'1',12=>'0',11=>'1',10=>'1',9=>'1',8=>'1',7=>'0',6=>'0',5=>'0',4=>'1',3=>'1',2=>'1',1=>'1',0=>'1');\n"
    "-- Layers variables\n"
    "-- Input Layer\n"
    "constant num_layers: natural := 3;\n"
    "--DNN parameters\n"
    "type layer_neurons_type is array(1 to num_layers) of natural;\n"
    )
    string1="constant log2_layer_inputs: layer_neurons_type := ("
    string2="constant log2_layer_outputs: layer_neurons_type := ("
    for i in range (1,num_layers):
        string1 = string1 + "natural(ceil(log2(real("+str(num_inputs[i-1])+")))),"
        string2 = string2 + "natural(ceil(log2(real("+str(num_outputs[i-1])+")))),"
    string1 = string1 + "natural(ceil(log2(real("+str(num_inputs[num_layers-1])+")))));\n"
    string2 = string2 + "natural(ceil(log2(real("+str(num_outputs[num_layers-1])+")))));\n"
    f.write(string1+string2)
    string1 = "constant layer_inputs: layer_neurons_type := ("
    string2 = "constant layer_outputs: layer_neurons_type := ("
    for i in range (1,num_layers):
        string1 = string1 + str(num_inputs[i-1]) + ","
        string2 = string2 + str(num_outputs[i-1]) + ","
    string1 = string1 + str(num_inputs[num_layers-1])+");\n"
    string2 = string2 + str(num_outputs[num_layers-1])+");\n"
    f.write(string1 + string2) 
    f.write(
        "constant data_int_width: natural := 16;\n"
    "constant data_frac_width: natural := 16;\n"
    "constant validation_dataset_path: string := \"../scripts/datasets/testData/test_data.txt\";\n"
    "constant bias_int_width: natural := 1;            \n"
    
    
    
    "--Functions Declaration\n"
    "function isum(l_n: layer_neurons_type)return natural;\n"
    "function low(vect_lengths: layer_neurons_type; index: natural) return natural;\n"
    "function high(VectorBits: layer_neurons_type; index: natural) return natural; \n"   
    "function get_subvector(vector: std_logic_vector; VectorBits: layer_neurons_type;index: natural) return std_logic_vector;\n"
    

        
    

    
"end package DNN_package;\n"

"package body DNN_package is\n"
    
    "--Package Body Section\n"
    "function isum(l_n: layer_neurons_type) return natural is\n"
    "    variable result: natural := 0;\n"
    "    begin\n"
    "        for i in l_n'range loop\n"
    "            result := result + l_n(i);\n"
    "        end loop;\n"
    "    return result;\n"
    "end function;\n"
    
    "function low(vect_lengths : layer_neurons_type; index : NATURAL) return NATURAL is\n"
    "    variable pos : NATURAL := 0;\n"
    "    begin\n"
    "    for i in vect_lengths'low to index - 1 loop\n"
    "        pos := pos + vect_lengths(i);\n"
    "    end loop; \n"
    "    return pos;\n"
    "end function;\n"
    
    "function high(VectorBits : layer_neurons_type; index : NATURAL) return NATURAL is\n"
    "    variable pos : NATURAL := 0;\n"
    "    begin\n"
    "      for i in VectorBits'low to index loop\n"
    "        pos := pos + VectorBits(i);\n"
    "      end loop;\n"
    "    return pos - 1;\n"
    "end function;\n"
    
    "function get_subvector(vector: std_logic_vector; VectorBits: layer_neurons_type; index : natural) return std_logic_vector is\n"
    "    begin\n"
    "    return vector(high(VectorBits, index) downto low(VectorBits, index));\n"
    "end function;\n"

"end package body DNN_package;\n"
            )
finally:
    f.close()
    
#VHDL Architecure
#Generating DNN.vhd
try:
    f = open("../../src/DNN.vhd",'w')  # write in text mode
    #VHDL File Descriptor
    f.write("----------------------------------------------------------------------------------\n"
    "-- Company: \n"
    "-- Engineer: Michele Pio Fragasso\n"
    "-- \n"
    "-- Create Date: 04/18/2022 09:21:01 PM\n"
    "-- Design Name: \n"
    "-- Module Name: DNN - Behavioral\n"
    "-- Project Name: \n"
    "-- Target Devices: \n"
    "-- Tool Versions: \n"
    "-- Description: This file is generated with a python script. You shall modify this by modifying \n"
    "-- the generating python script\n"
    "-- Dependencies: \n"
    "-- \n"
    "-- Revision: \n"
    "-- Revision 0.01 - File Created \n"
    "-- Additional Comments:\n"
    "-- \n"
    "----------------------------------------------------------------------------------\n")
    #Libraries
    f.write("library ieee;\n"
    "use ieee.std_logic_1164.all;\n"
    "use ieee.numeric_std.all;\n"
    "use ieee.math_real.all;\n"
    
    "library ieee_proposed;\n"
    "use ieee_proposed.fixed_pkg.all;\n"
 
    "library work;\n"
    "use work.DNN_package.all;\n"
        )
    #Entity Definition
    f.write(
        "entity DNN is\n"
        "port(\n"
        "data_in: in sfixed (data_int_width-1 downto -data_frac_width);\n"
        "start: in std_logic;\n"
        "clk: in std_logic;\n"
        "data_out: out sfixed (data_int_width-1 downto -data_frac_width);\n"
        "addr_in: out std_logic_vector(0 to natural(ceil(log2(real(layer_inputs(1)))))-1); --To scan through the valdation data set\n"
        "addr_out: out std_logic_vector(0 to natural(ceil(log2(real(layer_outputs(3)))))-1)); --To scan through the valdation data set\n"
        "end DNN;\n"
        )
    #Begin Architecture
    f.write(
        "architecture Behavioral of DNN is\n"
        )
    #Declarative Part
    f.write(
        "type data_vect_type is array(1 to num_layers) of sfixed(data_int_width-1 downto -data_frac_width);\n"
        "signal data_out_vect, data_in_vect: data_vect_type;\n"
        "signal start_vect: std_logic_vector(0 to num_layers);\n"
        "signal data_v_vect: std_logic_vector(1 to num_layers);\n"
        "signal data_in_sel_vect: std_logic_vector(0 to natural(ceil(log2(real(isum(layer_inputs)))))-1);\n"
        "signal data_out_sel_vect: std_logic_vector(0 to natural(ceil(log2(real(isum(layer_outputs)))))-1);\n"
        )
    for i in range(num_layers):
        str1 = "signal data_in_sel"+str(i+1)+": std_logic_vector(0 to  natural(ceil(log2(real(layer_inputs("+str(i+1)+")))))-1);\n"
        str2 = "signal data_out_sel"+str(i+1)+": std_logic_vector(0 to  natural(ceil(log2(real(layer_outputs("+str(i+1)+")))))-1);\n"
        f.write(
           str1 + str2
        )
    f.write(
        "component layer is\n"
        "generic(\n"
        "constant num_inputs: natural;\n"
        "constant num_outputs: natural;\n"
        "constant layer_no: natural;--Layer number (identifier)\n"
        "constant act_type: string; -- Choose between 'ReLU','Sig'\n"
        "constant act_fun_size: natural -- If the user choose an analytical activation function the number of sample have to be chosen\n"
        ");\n"
        "port(\n"
        "clk: in std_logic;\n"
        "data_in: in sfixed(input_int_width-1 downto -input_frac_width);\n"
        "data_out_sel: in std_logic_vector(0 to natural(ceil(log2(real(num_outputs))))-1);\n"
        "start: in std_logic;--to increment the counter while the output of the output is begin computed\n"
        "data_out: out sfixed(neuron_int_width-1 downto -neuron_frac_width);--The next layer controls which neuron's output to access\n"
        "data_in_sel: out std_logic_vector(0 to natural(ceil(log2(real(num_inputs))))-1);\n"
        "data_v: out std_logic);\n"
        "end component;\n"
    )
    #Begin
    f.write(
        "begin\n")
    f.write(
        "--Data Path\n"
        "--Data\n"
        "data_in_vect(1) <= data_in;\n"
        )
    for i in range(1, num_layers):
        f.write(
                "data_in_vect("+str(i+1)+") <= data_out_vect("+str(i)+");\n"
            )
    f.write("data_out <= data_out_vect(3);\n"
                "--Aknowledges\n"
                "start_vect(1) <= start;\n")
    for i in range(1, num_layers):
        f.write(
                "start_vect("+str(i+1)+") <= data_v_vect("+str(i)+");\n"
        )
    f.write(
        "--Data Selectors\n"
        "addr_in <= data_in_sel1;\n"
    )
    for i in range(1, num_layers):
        f.write(
                "data_out_sel"+str(i)+" <= data_in_sel"+str(i+1)+";\n"
        )
    f.write(
        "data_out_sel3 <= addr_out;\n"
    )
    for i in range(num_layers):
        f.write(
            "layer"+str(i+1)+": layer\n"
            "generic map(\n"
            "num_inputs => layer_inputs("+str(i+1)+"),\n"
            "num_outputs => layer_outputs("+str(i+1)+"),\n"
            "layer_no => "+str(i+1)+",\n"
            "act_type => \"ReLU\",\n"
            "act_fun_size => 0\n"
            ")\n"
            "port map(\n"
            "clk => clk,\n"
            "data_in => data_in_vect("+str(i+1)+"),\n"
            "data_out_sel => data_out_sel"+str(i+1)+",\n"
            "start => start_vect("+str(i+1)+"),\n"
            "data_out => data_out_vect("+str(i+1)+"),\n"
            "data_in_sel => data_in_sel"+str(i+1)+",\n"
            "data_v => data_v_vect("+str(i+1)+")\n"
            ");\n\n"
        )
    f.write("end Behavioral;\n")            
finally:
    f.close()
    

