"""
Created on Mon Dec 26 16:24:43 2022

Engineer: Michele Pio Fragasso


Description:
    --This python script computes a generic layer output with a given set of weights
    biases and an input to the layer
    
    -Inputs
        neuronweight_IntWidth: It contains the the input of the neuron weight
        neuroninput_IntWidth: It contains the integer part of the neuron input/output
        layer_filename: Name of the folder containinig parameter to test the layer.
    -Outputs
        layer output to be compared with the testbench
        
This file is deprecated. File reading is based on a old version of numpy, which disabled
newline for file delimiters.
I send the user to DNN_tester for testbenching of the architecture
"""

import sys
sys.path.insert(10, "../functions/")

import DNN_testbench

###Data Width of Weight, Input and Bias
neuronweight_Width = 32
neuroninput_Width = 32
neuronbias_Width = neuronweight_Width + neuroninput_Width
###Integer Part Width of Weight, Input and Bias
neuronweight_IntWidth = 2
neuroninput_IntWidth = 16
neuronbias_IntWidth = neuronweight_IntWidth+neuroninput_IntWidth

layer_filename = "layer_folder2"
layer_out_dict = DNN_testbench.testbench_layer(layer_filename, neuronweight_IntWidth, neuronbias_IntWidth, neuroninput_IntWidth, act_fun="Sig")
