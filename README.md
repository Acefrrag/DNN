# Reconfigurable serial feed forward DNN 

This github repository consists in a VHDL serial implementation architecture of a reconfigurable fully-connected feed forward deep neural network. This architecture as well as reconfiguration capabilities are inspired to [ZyNet package](https://github.com/dsdnu/zynet) developed by Vipin Kizhepatt.

## Architecture

### DNN

<p align="center">
  <img src="https://user-images.githubusercontent.com/59066474/232442895-ab4b8096-580c-46d0-b9fb-fe4f73eac094.png")>
</p>

The DNN consists in layers connected in cascade where every layer triggers the next one when output is computed. The layer fetches sequentially the inputs and its outputs are fed one by one to the next layer.

### Layer 
<p align="center">
  <img width=450 height= 300 src="https://user-images.githubusercontent.com/59066474/232449207-fdb4e436-2e7e-4b43-972a-8376364a2c3f.png")>
</p>

Internally the layer contains a FSM that implements the control logic of the layer. A layer_CNTR is used to fetch the neurons' weights and previous layer's outputs. The output multiplexer driven by the next layer is used to serially fetch the layer's output.

### Neuron

<p align="center">
  <img width=450 height= 300 src="https://user-images.githubusercontent.com/59066474/232451931-7209292f-e392-493b-9907-42add37aeb18.png")>
</p>

The neuron's cumulative sum is progressively computed at every clock cycle. The partial result is stored inside `SUM_REG`

## Reconfiguration

The DNN model is trained offline starting from the DNN parameters(number of layer, neurons per layer, activation function type) and training hyperparameters and the VHDL architecture is automatically generated and loaded into the ModelSim project.

## Motivation

The aim of the development of such architecture is the integration with [NORM](https://github.com/simoneruffini/NORM) to enable the reconfiguration and evaluation of performance of an hardware-based intermittent inference under uncertain energy environment obtaining [I-DNN](https://github.com/Acefrrag/I-DNN).

## Repository Content

This github repository contains the VHDL architecture developed under two different EDA tools (Vivado and ModelSim).

### Warning
The Vivado project folder is deprecated. ModelSim is the project to refer to.
