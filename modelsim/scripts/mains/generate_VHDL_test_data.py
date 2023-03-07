"""
Created on Mon Dec 26 20:11:38 2022

Engineer: Michele Pio Fragasso


Description:
    This script generates a VHDL compatible MNIST sample in order to be
    tested with the VHDL architecture.
    
    Inputs:
    IntSize: Integer Part of the Neuron output. It MUST be equal to the IntSize
        resulting from the training python script. IntSize is the content of the
        VHDL signal "DNN_neuron_input_IntWidth" inside DNN_package.vhd
    dataset_index: Index to the MNIST test_data sample.
    
    Outputs:
        -It generates a VHDL compatible MNIST dataset containing the
        handwritten digit. The folder, containing all the input data
        has the following path
        \scripts\files\datasets\testData\automated\test_dataset_<dataset_index>
        
    Usage:
        After the input data set with the right data format is generated it can
        be loaded in the VHDL architecture. To do this, copy and paste the folder
        in \tb_files\tb<ID>\dataset, where ID must be the same ID storing
        weights, biases and the sigmoid.
        
"""


import sys
sys.path.insert(0, "../functions/")

import TestData as genData

sys.path.insert(0, "../functions")

dataWidth = 32
IntSize = 4
dataset_index = 1160

tr_d, va_d, te_data = genData.load_data()
#genData.gensetofTestData(dataWidth, IntSize,1,te_data)
genData.genTestData(dataWidth=dataWidth, IntSize=IntSize,testDataNum=dataset_index,te_d = te_data)
