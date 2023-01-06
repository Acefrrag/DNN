# -*- coding: utf-8 -*-
"""
Created on Wed Dec 28 12:55:36 2022

Engineer: Michele Pio Fragasso


Description:
    --File description
"""

import numpy as np
import re
import os
import json

dt_string = np.dtype(str)

def float_to_fp_10(num,dataWidth,fracBits):
    """
    Funtion for converting a fractional number into base 10 fixed-point representation

    Parameters
    ----------
    num : float
        Fractional number to convert
    dataWidth : integer
        Number of bits to represent the number
    fracBits : integer
        Number of bits for representing the fractional part

    Returns
    -------
    fp_int : integer
        Base 10 fixed-point representation of num

    """
    if num >= 0:
        num = num * (2**fracBits)
        num = round(num)
        fp_int = num
    else:
        num = -num
        num = num * (2**fracBits)#number of fractional bits
        num = round(num)
        if num == 0:
            fp_int = 0
        else:
            fp_int = 2**dataWidth - num
    return fp_int
    
    
def read_integer():
    """
    Procedure to read an integer 

    Returns
    -------
    val : integer
        number read from terminal
    """
    check = 0
    while check == 0:
        val = input()
        try:
            float(val)
            check = 1
        except ValueError:
            print("Input is not a number. Insert it again")
            check = 0
    return(val)
   

def sigmoid_extract_size(sigmoid_data_path):
    logfilename = "dataFormat.log"
    lines = np.loadtxt(fname=sigmoid_data_path+"\\\\"+logfilename,dtype=dt_string, delimiter="\n,",ndmin=1)
    c = 0
    for line in lines:
        if line.find("Sigmoid input size:")==0:
            sigmoid_input_size_str = re.findall(r'\d',lines[c])[0]            
        if line.find("Sigmoid input integer part size:")==0:
            sigmoid_input_Intsize_str = re.findall(r'\d',lines[c])[0]
        c = c + 1
    sigmoid_inputSize = int(sigmoid_input_size_str)
    sigmoid_inputIntSize = int(sigmoid_input_Intsize_str)
    return(sigmoid_inputSize, sigmoid_inputIntSize)
    
def genWeightsAndBias(dir_path, dataWidth, weightIntWidth, inputIntWidth):

    weightWidth = dataWidth
    weightFracWidth = dataWidth-weightIntWidth
    biasWidth = 2*dataWidth
    biasIntWidth = weightIntWidth+inputIntWidth
    biasFracWidth = biasWidth-biasIntWidth
    biases_path = dir_path+"/biases/"
    weights_path = dir_path+"/weights/"
    try:
        os.mkdir(biases_path)
        os.mkdir(weights_path)
    except:
        print("Folder already exists. No folder created.")
    myDataFile = open(dir_path+"WeightsAndBiases.txt","r")
    weightHeaderFile = open(dir_path+"weightValues.h","w")
    myData = myDataFile.read()
    myDict = json.loads(myData)
    myWeights = myDict['weights']
    myBiases = myDict['biases']
    #Generating weights
    weightHeaderFile.write("int weightValues[]={")
    for layer in range(0,len(myWeights)):
        for neuron in range(0,len(myWeights[layer])):
            weight_filename = 'w_'+str(layer+1)+'_'+str(neuron)+'.mif'
            f = open(weights_path+weight_filename,'w')
            for weight in range(0,len(myWeights[layer][neuron])):
                weight_fp_int = float_to_fp_10(myWeights[layer][neuron][weight],dataWidth,weightFracWidth)#conversion in corresponding integer.
                weight_fp_bin = weight_fp_int.__format__('0'+str(weightWidth)+'b')#Used for zero padding to reach DataWidth bits
                f.write(weight_fp_bin+'\n')
                weightHeaderFile.write(str(weight_fp_int)+',')
        f.close()
            
    weightHeaderFile.write("0};\n")
    weightHeaderFile.close()

    biasHeaderFile = open(dir_path+"biasValues.h","w")
    biasHeaderFile.write("int biasValues[]={")
    for layer in range(0,len(myBiases)):
        for neuron in range(0,len(myBiases[layer])):
             bias_filename = 'b_'+str(layer+1)+'_'+str(neuron)+'.mif'
             f = open(biases_path+bias_filename,'w')
             p = myBiases[layer][neuron][0]
             bias_fp_int = float_to_fp_10(p,2*dataWidth,biasFracWidth)
             bias_fp_bin = bias_fp_int.__format__('0'+str(biasWidth)+'b')
             f.write(bias_fp_bin+"\n")
             biasHeaderFile.write(str(bias_fp_int)+',')
             f.close()
             
    biasHeaderFile.write('0};\n')
    biasHeaderFile.close()

    dataFormatFile = open(dir_path+"dataFormatFile.txt","w")
    dataFormatFile.write("DATA FORMAT BIASES AND WEIGHTS\n\n")
    dataFormatFile.write("WEIGHTS FORMAT:\n\n")
    dataFormatFile.write("Data Size: "+str(dataWidth)+"\n")
    dataFormatFile.write("Integer Data Size: "+str(weightIntWidth)+"\n")
    dataFormatFile.write("Fractional Data Size: "+str(weightFracWidth)+"\n\n")
    dataFormatFile.write("BIASES FORMAT:\n\n")
    dataFormatFile.write("Data Size: "+str(dataWidth)+"\n")
    dataFormatFile.write("Integer Data Size: "+str(biasIntWidth)+"\n")
    dataFormatFile.write("Fractional Data Size: "+str(biasFracWidth)+"\n\n")
    dataFormatFile.close()