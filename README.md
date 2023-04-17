# Reconfigurable Serial DNN

This github repository consists in a VHDL serial implementation architecture of a reconfigurable fully-connected feed forward deep neural network. This architecture as well as reconfiguration capabilities are inspired to [ZyNet package](https://github.com/dsdnu/zynet) developed by Vipin Kizhepatt.




<p align="center">
  <img src="https://user-images.githubusercontent.com/59066474/232442895-ab4b8096-580c-46d0-b9fb-fe4f73eac094.png")>
</p>

The DNN consists in layers connected in cascade where every layer triggers the next one when output is computed. 

## Motivation

The aim of the development of such architecture is the integration with [NORM](https://github.com/simoneruffini/NORM) to enable the reconfiguration and evaluation of an hardware-based intermittent inference under uncertain energy environment obtaining [I-DNN](https://github.com/Acefrrag/I-DNN)

## Repository Content

This github repository contains the VHDL architecture developed under two different EDA tools (Vivado and ModelSim).

This repository contains a set of python scripts to train a fully-connected MLP and reconfiguration of the aforemention
VHDL-based DNN.

## Warning
The Vivado project folder is deprecated. ModelSim is the project to refer to.
