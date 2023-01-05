"""
Author: Vipin Kizhepatt

Revision Dec 26 21:36:56 2022: Michele Pio Fragasso


Description:
    --This python script trains a DNN and generates the DNN top level VHDL
    architecture which implements it as well the necessary VHDL packages to make
    it work.
    --This train a neural network with an arbitrary number of layers, with as
    many neurons per layer as we want.
    --The number of layer of the DNN architecture does not include the input layer,
    infact the input is external to the DNN architecture, and is fed sequentially
    to the architecture. It does not even include the output layer which is a simple SOFTMAX
    --The last hidden layer is always a 10 neuron layer, every neuron is the digit
    and the output is how the DNN is confident about that digit being the digit depicted
    in the input image.
"""

import sys
sys.path.insert(0, "../functions/")

import mnist_loader
import network2

import os
import datetime
import time
import misc




date = datetime.datetime.now()
date_str = date.strftime("%x")+" "+date.strftime("%X")
date = (date.strftime("%x")+"_"+date.strftime("%X")).replace(" ","_").replace(":","-").replace("/","-")
dir_path = "../files/weights_n_biases/training_"+date+"/"
VHDL_architectures_path = "../files/VHDL_output/training_"+date+"/"
os.mkdir(VHDL_architectures_path)



#DNN PARAMETERS
#Number of layers
print("Insert the number of hidden layers of the DNN:")
num_hidden_layers=int(misc.read_integer())
act_fun_type = "ReLU"

num_inputs_DNN = 784
num_outputs_DNN = 10
num_inputs = []
num_outputs = []
num_inputs.append(int(num_inputs_DNN))
for i in range(0,num_hidden_layers-1):
    print("Insert the number of neurons to the layer no."+str(i))
    num_inputs.append(int(misc.read_integer()))
    num_outputs.append(int(num_inputs[i+1]))
time.sleep(1)
print("The number of neurons of layer no."+str(i+1)+"(last layer) is always:\n10\nRead script description.\n")
time.sleep(2)
num_outputs.append(int(num_outputs_DNN))

#DNN TRAINING    
#Loading the data and dividing the dataset between training and validation data.
print("Currently Training... \n")
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
epochs = 1
batch_size = 100
eta = 0.4
lmbda = 5.0
(e_c, e_a, t_c, t_a) = net.SGD(training_data, epochs=epochs, mini_batch_size=batch_size, eta=eta, lmbda=lmbda,evaluation_data=validation_data, monitor_evaluation_accuracy=True)
#Saving the weights and biases in a file.
os.mkdir(dir_path)
wb_filename = "WeightsAndBiases.txt"
net.save(dir_path+wb_filename)

#SAVING TRAINING REPORT
report_filename = "training_report.txt"
f = open(dir_path+report_filename, 'w')
f.write("TRAINING REPORT - "+ date + "\n \n")
f.write("Number of layers: "+str(net.num_layers)+"\n")
f.write("Neurons per layer: "+str(net.sizes)+"\n")
f.write("Training data size: "+str(len(training_data))+"\n")
f.write("Training epochs: "+ str(epochs)+"\n")
f.write("Training batch size:"+ str(batch_size)+"\n")
f.write("Training learning rate: eta ="+ str(eta)+"\n")
f.write("Training regularitation value: lambda ="+ str(lmbda)+"\n")
f.write("Evaluation data size: "+str(len(validation_data))+"\n")
f.write("Evaluation Accuracies per epoch: \n")
for i in range(epochs):
    f.write("Epoch:"+str(i)+" Accuracy: "+str(e_a[i])+"/"+str(len(validation_data))+"\n")
f.close()    


(sigmoid_inputSize, sigmoid_inputIntSize) = misc.sigmoid_extract_size("..\\\\files\sigmoid")
(neuron_weight_IntWidth, neuron_input_IntWidth) = net.compute_DataFormat(validation_data)
neuron_input_Width = 32
neuron_weight_Width = 32
neuron_input_FracWidth = neuron_input_Width-neuron_input_IntWidth
neuron_weight_FracWidth = neuron_weight_Width-neuron_weight_IntWidth

misc.genWeightsAndBias(dir_path=dir_path, dataWidth=neuron_input_Width, weightIntWidth=neuron_weight_IntWidth, inputIntWidth=neuron_input_IntWidth)

try:
    os.mkdir(dir_path+"VHDL_output")
except:
    print("Folder already exists.")

#########################GENERATING DNN VHDL ARCHITECTURE###########################
#VHDL packages
#DNN_package.vhd
try:
    f = open(dir_path+"VHDL_output/DNN_package.vhd", "w")
    f.write("----------------------------------------------------------------------------------\n")
    f.write("-- Company: \n")
    f.write("-- Engineer: Michele Pio Fragasso\n")
    f.write("-- \n")
    f.write("-- Create Date: "+date_str+"\n")
    f.write("-- Design Name: \n")
    f.write("-- Module Name: DNN_tb - Behavioral\n")
    f.write("-- Project Name: \n")
    f.write("-- Target Devices: \n")
    f.write("-- Tool Versions: \n")
    f.write("-- Description: \n")
    f.write("-- \n")
    f.write("-- Dependencies: \n")
    f.write("-- \n")
    f.write("-- Revision:\n")
    f.write("-- Revision 0.01 - File Created\n")
    f.write("-- Additional Comments:\n")
    f.write("-- \n")
    f.write("----------------------------------------------------------------------------------)\n")
    f.write("\n")
    f.write("\n")
    f.write("library ieee;\n")
    f.write("use ieee.std_logic_1164.all;\n")
    f.write("use ieee.math_real.all;\n")
    f.write("use ieee.fixed_pkg.all;\n")
    f.write("package DNN_package is\n")
    f.write("--DNN constants\n")
    f.write("constant DNN_num_inputs: natural := "+str(num_inputs_DNN)+";\n")
    f.write("constant DNN_sigmoid_inputdata_Width: natural  := "+str(sigmoid_inputSize)+";\n")
    f.write("constant DNN_sigmoid_inputdata_IntWidth: natural := "+str(sigmoid_inputIntSize)+";\n")
    f.write("constant DNN_neuron_input_Width: natural := "+str(neuron_input_Width)+";\n")
    f.write("constant DNN_neuron_input_IntWidth: natural  := "+str(neuron_input_IntWidth)+";\n")
    f.write("constant DNN_neuron_input_FracWidth: natural := DNN_neuron_input_Width-DNN_neuron_input_IntWidth;")
    f.write("constant DNN_neuron_weight_Width : natural := "+str(neuron_weight_Width)+";\n")
    f.write("constant DNN_neuron_weight_IntWidth: natural := "+str(neuron_weight_IntWidth)+";\n")
    f.write("constant DNN_neuron_weight_FracWidth: natural := DNN_neuron_weight_Width-DNN_neuron_weight_IntWidth;\n")
    f.write("constant DNN_prms_path: string := \"../tb_files/DNN/tb2/\";\n")
    f.write("constant act_fun_type: string  := \"ReLU\";\n")
    f.write("-- Layers variables\n")
    f.write("-- Input Layer\n")
    f.write("constant num_hidden_layers: natural := "+str(num_hidden_layers)+";\n")
    f.write("--DNN parameters\n")
    f.write("type layer_neurons_type is array(1 to num_hidden_layers) of natural;\n")
    f.write("\n")
    string1="constant log2_layer_inputs: layer_neurons_type := ("
    string2="constant log2_layer_outputs: layer_neurons_type := ("
    for i in range (1,num_hidden_layers):
        string1 = string1 + "natural(ceil(log2(real("+str(num_inputs[i-1])+")))),"
        string2 = string2 + "natural(ceil(log2(real("+str(num_outputs[i-1])+")))),"
    string1 = string1 + "natural(ceil(log2(real("+str(num_inputs[num_hidden_layers-1])+")))));\n"
    string2 = string2 + "natural(ceil(log2(real("+str(num_outputs[num_hidden_layers-1])+")))));\n"
    f.write(string1+string2)
    string1 = "constant layer_inputs: layer_neurons_type := ("
    string2 = "constant layer_outputs: layer_neurons_type := ("
    for i in range (1,num_hidden_layers):
        string1 = string1 + str(num_inputs[i-1]) + ","
        string2 = string2 + str(num_outputs[i-1]) + ","
    string1 = string1 + str(num_inputs[num_hidden_layers-1])+");\n"
    string2 = string2 + str(num_outputs[num_hidden_layers-1])+");\n"
    f.write(string1 + string2) 
    f.write("\n")
    f.write("\n")  
    f.write("--Functions Declaration\n")
    f.write("function isum(l_n: layer_neurons_type)return natural;\n")
    f.write("function low(vect_lengths: layer_neurons_type; index: natural) return natural;\n")
    f.write("function high(VectorBits: layer_neurons_type; index: natural) return natural; \n")
    f.write("function get_subvector(vector: std_logic_vector; VectorBits: layer_neurons_type;index: natural) return std_logic_vector;\n")
    f.write("\n")
    f.write("\n")
    f.write("\n")       
    f.write("end package DNN_package;\n")
    f.write("\n")
    f.write("package body DNN_package is\n")
    f.write("--Package Body Section\n")
    f.write("function isum(l_n: layer_neurons_type) return natural is\n")
    f.write("    variable result: natural := 0;\n")
    f.write("    begin\n")
    f.write("        for i in l_n'range loop\n")
    f.write("            result := result + l_n(i);\n")
    f.write("        end loop;\n")
    f.write("    return result;\n")
    f.write("end function;\n")
    f.write("\n")
    f.write("function low(vect_lengths : layer_neurons_type; index : NATURAL) return NATURAL is\n")
    f.write("    variable pos : NATURAL := 0;\n")
    f.write("    begin\n")
    f.write("    for i in vect_lengths'low to index - 1 loop\n")
    f.write("        pos := pos + vect_lengths(i);\n")
    f.write("    end loop; \n")
    f.write("    return pos;\n")
    f.write("end function;\n")
    f.write("\n")
    f.write("function high(VectorBits : layer_neurons_type; index : NATURAL) return NATURAL is\n")
    f.write("    variable pos : NATURAL := 0;\n")
    f.write("    begin\n")
    f.write("      for i in VectorBits'low to index loop\n")
    f.write("        pos := pos + VectorBits(i);\n")
    f.write("      end loop;\n")
    f.write("    return pos - 1;\n")
    f.write("end function;\n")
    f.write("\n")
    f.write("function get_subvector(vector: std_logic_vector; VectorBits: layer_neurons_type; index : natural) return std_logic_vector is\n")
    f.write("    begin\n")
    f.write("    return vector(high(VectorBits, index) downto low(VectorBits, index));\n")
    f.write("end function;\n")
    f.write("end package body DNN_package;\n")
finally:
    f.close()
    
#VHDL Architecure
#DNN.vhd
try:
    f = open(dir_path+"VHDL_output/DNN.vhd",'w')  # write in text mode
    #VHDL File Descriptor
    f.write("----------------------------------------------------------------------------------\n")
    f.write("-- Company: \n")
    f.write("-- Engineer: Michele Pio Fragasso\n")
    f.write("-- \n")
    f.write("-- Create Date: "+date_str+"\n")
    f.write("-- Design Name: \n")
    f.write("-- Module Name: DNN - Behavioral\n")
    f.write("-- Project Name: \n")
    f.write("-- Target Devices: \n")
    f.write("-- Tool Versions: \n")
    f.write("-- Description: This file is generated with a python script. You shall modify this by modifying \n")
    f.write("-- the generating python script\n")
    f.write("-- Dependencies: \n")
    f.write("-- \n")
    f.write("-- Revision: \n")
    f.write("-- Revision 0.01 - File Created \n")
    f.write("-- Additional Comments:\n")
    f.write("-- \n")
    f.write("----------------------------------------------------------------------------------\n")
    #Libraries
    f.write("\n")
    f.write("\n")
    f.write("library ieee;\n")
    f.write("use ieee.std_logic_1164.all;\n")
    f.write("use ieee.numeric_std.all;\n")
    f.write("use ieee.math_real.all;\n")
    f.write("use ieee.fixed_pkg.all;\n")
    f.write("\n")
    f.write("\n")
    f.write("library work;\n")
    f.write("use work.DNN_package.all;\n")
    f.write("\n")
    #Entity Definition
    f.write("entity DNN is\n")
    f.write("generic(\n")
    f.write("constant neuron_input_IntWidth: natural;\n")
    f.write("constant neuron_input_FracWidth: natural;\n")
    f.write("constant neuron_weight_IntWidth: natural;\n")
    f.write("constant neuron_weight_FracWidth: natural;\n")
    f.write("constant sigmoid_inputdataWidth: natural;\n")
    f.write("constant sigmoid_inputdataIntWidth: natural;\n")
    f.write("constant act_fun_type: string;\n")
    f.write("constant DNN_prms_path: string\n")
    f.write(");\n")
    f.write("port(\n")
    f.write("data_in: in sfixed (neuron_input_IntWidth-1 downto -neuron_input_FracWidth);\n")
    f.write("start: in std_logic;\n")
    f.write("clk: in std_logic;\n")
    f.write("data_out: out sfixed (neuron_input_IntWidth-1 downto -neuron_input_FracWidth);\n")
    f.write("addr_in: out std_logic_vector(0 to natural(ceil(log2(real(layer_inputs(1)))))-1); --To scan through the valdation data set\n")
    f.write("addr_out: out std_logic_vector(0 to natural(ceil(log2(real(layer_outputs(3)))))-1)); --To scan through the valdation data set\n")
    f.write("end DNN;\n")
    f.write("\n")
    #Begin Architecture
    f.write("architecture Behavioral of DNN is\n")
    #Declarative Part
    f.write("type data_vect_type is array(1 to num_hidden_layers) of sfixed(neuron_input_IntWidth-1 downto -neuron_input_FracWidth);\n")
    f.write("signal data_out_vect, data_in_vect: data_vect_type;\n")
    f.write("signal start_vect: std_logic_vector(0 to num_hidden_layers);\n")
    f.write("signal data_v_vect: std_logic_vector(1 to num_hidden_layers);\n")
    f.write("signal data_in_sel_vect: std_logic_vector(0 to natural(ceil(log2(real(isum(layer_inputs)))))-1);\n")
    f.write("signal data_out_sel_vect: std_logic_vector(0 to natural(ceil(log2(real(isum(layer_outputs)))))-1);\n")
    for i in range(num_hidden_layers):
        str1 = "signal data_in_sel"+str(i+1)+": std_logic_vector(0 to  natural(ceil(log2(real(layer_inputs("+str(i+1)+")))))-1);\n"
        str2 = "signal data_out_sel"+str(i+1)+": std_logic_vector(0 to  natural(ceil(log2(real(layer_outputs("+str(i+1)+")))))-1);\n"
        f.write(
            str1 + str2
        )
    f.write("component layer is\n")
    f.write("generic(\n")
    f.write("constant num_inputs: natural;\n")
    f.write("constant num_outputs: natural;\n")
    f.write("constant neuron_input_IntWidth: natural;\n")
    f.write("constant neuron_input_FracWidth: natural;\n")
    f.write("constant neuron_weight_IntWidth: natural;\n")
    f.write("constant neuron_weight_FracWidth: natural;\n")
    f.write("constant layer_no: natural;--Layer number (identifier)\n")
    f.write("constant act_fun_type: string; -- Choose between 'ReLU','Sig'\n")
    f.write("constant sigmoid_inputdataWidth: natural;\n")
    f.write("constant sigmoid_inputdataIntWidth: natural;\n")
    f.write("constant lyr_prms_path: string\n")
    f.write(");\n")
    f.write("port(\n")
    f.write("clk: in std_logic;\n")
    f.write("data_in: in sfixed(neuron_input_IntWidth-1 downto -neuron_input_FracWidth);\n")
    f.write("data_out_sel: in std_logic_vector(0 to natural(ceil(log2(real(num_outputs))))-1);\n")
    f.write("start: in std_logic;--to increment the counter while the output of the output is begin computed\n")
    f.write("data_out: out sfixed(neuron_input_IntWidth-1 downto -neuron_input_FracWidth);--The next layer controls which neuron's output to access\n")
    f.write("data_in_sel: out std_logic_vector(0 to natural(ceil(log2(real(num_inputs))))-1);\n")
    f.write("data_v: out std_logic);\n")
    f.write("end component;\n")
    #Begin
    f.write("begin\n")
    f.write("--Data Path\n")
    f.write("--Data\n")
    f.write("data_in_vect(1) <= data_in;\n")
    for i in range(1, num_hidden_layers):
        f.write("data_in_vect("+str(i+1)+") <= data_out_vect("+str(i)+");\n")
    f.write("data_out <= data_out_vect(3);\n")
    f.write("--Aknowledges\n")
    f.write("start_vect(1) <= start;\n")
    for i in range(1, num_hidden_layers):
        f.write("start_vect("+str(i+1)+") <= data_v_vect("+str(i)+");\n")
    f.write("--Data Selectors\n")
    f.write("addr_in <= data_in_sel1;\n")
    for i in range(1, num_hidden_layers):
        f.write("data_out_sel"+str(i)+" <= data_in_sel"+str(i+1)+";\n")
    f.write("data_out_sel3 <= addr_out;\n")
    for i in range(num_hidden_layers):
        f.write("layer"+str(i+1)+": layer\n")
        f.write("generic map(\n")
        f.write("num_inputs => layer_inputs("+str(i+1)+"),\n")
        f.write("num_outputs => layer_outputs("+str(i+1)+"),\n")
        f.write("neuron_input_IntWidth => neuron_input_IntWidth,\n")
        f.write("neuron_input_FracWidth => neuron_input_FracWidth,\n")
        f.write("neuron_weight_IntWidth => neuron_weight_IntWidth,\n")
        f.write("neuron_weight_FracWidth => neuron_weight_FracWidth,\n")
        f.write("layer_no => "+str(i+1)+",\n")
        f.write("act_fun_type => \"ReLU\",\n")
        f.write("sigmoid_inputdataWidth=> "+str(sigmoid_inputSize)+",\n")
        f.write("sigmoid_inputdataIntWidth=> "+str(sigmoid_inputIntSize)+",\n")
        f.write("lyr_prms_path => DNN_prms_path\n")
        f.write(")\n")
        f.write("port map(\n")
        f.write("clk => clk,\n")
        f.write("data_in => data_in_vect("+str(i+1)+"),\n")
        f.write("data_out_sel => data_out_sel"+str(i+1)+",\n")
        f.write("start => start_vect("+str(i+1)+"),\n")
        f.write("data_out => data_out_vect("+str(i+1)+"),\n")
        f.write("data_in_sel => data_in_sel"+str(i+1)+",\n")
        f.write("data_v => data_v_vect("+str(i+1)+")\n")
        f.write(");\n\n")
        f.write("\n")
    f.write("end Behavioral;\n")
finally:
    f.close()
    

