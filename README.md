# Simple Reconfigurable DNN

This github repository consists in a VHDL architecture of a reconfigurable fully-connected feed forward deep neural network. The architecture as well as reconfiguration capabilities are inspired to ZyNet package developed by Vipin Kizhepatt found [here](https://github.com/dsdnu/zynet) .

## Motivation

The aim of the development of such architecture is the integration with NORM to enable the prototyping of hardware-based
intermittent inference.

## Repository Content

This github repository contains VHDL architecture developed under two different EDA tools (Vivado and ModelSim).

This repository contains a set of python scripts to train a fully-connected MLP and reconfiguration of the aforemention
VHDL-based DNN.

## Warning
The Vivado project folder is deprecated. ModelSim is the project to refer to.
