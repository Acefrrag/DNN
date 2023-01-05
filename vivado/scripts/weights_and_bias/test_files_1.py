# -*- coding: utf-8 -*-
"""
Created on Thu Jul 21 15:29:40 2022

@author: MicheleFragasso

Test 1, python script to write to a file
"""

try:
    f = open("DNN.vhd",'w')  # write in text mode
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
        )
    for i in range num
    constant layer_inputs: layer_neurons_type := (784,30,20);
    constant layer_outputs: layer_neurons_type := (30,20,10);
    constant log2_layer_inputs: layer_neurons_type := (natural(ceil(log2(real(784)))), natural(ceil(log2(real(30)))), natural(ceil(log2(real(10)))));
    constant log2_layer_outputs: layer_neurons_type := (natural(ceil(log2(real(30)))), natural(ceil(log2(real(20)))), natural(ceil(log2(real(10)))));

    f.write()
        "signal start_vect: std_logic_vector(0 to num_layers);\n"
        "signal data_v_vect: std_logic_vector(1 to num_layers);\n"
        "signal data_in_sel_vect: std_logic_vector(0 to natural(ceil(log2(real(isum(layer_inputs)))))-1);\n"
        "signal data_out_sel_vect: std_logic_vector(0 to natural(ceil(log2(real(isum(layer_outputs)))))-1);\n"
        )
    num_layers = 3;
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
    
    