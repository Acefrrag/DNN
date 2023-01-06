This folder contains python code and input files to compute a layer's
output and compare it with the layer output from the
VHDL implementation.


######################SINGLE NEURON FILE FORMAT###################
This format applies only to the case when a single neuron is tested
############################INPUT_DATA############################
The input data files should be having the following
format:

<symbolical_name>_<numberofinputs>_<inputwidth>_<inputIntWidth>.txt

Example

data_input_file1_30_32_16.txt

This file will contain a number of 30 inputs, the overall
size of the input is 32 and the fractional part size is 16.

########################WEIGHT_DATA###############################
The weight data files should be having the following
format:

<symbolical_name>_<numberofweights>_<weightsWidth>_<weightsIntWidth>.txt

Example

data_weight_file1_30_32_16.txt

This file will contain a number of 30 weights, the overall
size of the weight is 32 and the fractional part size is 16


#############################BIAS##################################

For bias there is only one sample in the file, therefore the format will be

<symbolical_name>_<biasWidth>_<biasIntWidth>.txt

The bias has a size which is the sum of the sizes of the input and weight.





###################LAYER FILE SYSTEM###################
For the layer the filesystem is organized in this way
Inside the layer data parent directory there must 3 other directories
-weights
-inputs
-biases
####WEIGHT FILE FORMAT########
The weights filenames are of the type w_<layer>_<neuron>.mif, where
<layer> is the number of the layer, while <neuron> is the number of the neuron
within the layer.
Since the single layer is just one, <layer> value is inherited from the DNN generator
python script.
###
