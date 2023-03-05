# Simple Reconfigurable DNN

This github repository consists in a VHDL architecture of a reconfigurable fully-connected feed forward deep neural network.

## Motivation

The aim of the development of such architecture is the integration with NORM to enable the prototyping of hardware-based
intermittent inference.

## Repository Content

This github repository contains VHDL architecture developed under two different EDA tools (Vivado and ModelSim).

This repository contains a set of python scripts to train a fully-connected MLP and reconfiguration of the aforemention
VHDL-based DNN.

The Vivado project folder is deprecated. At the moment ModelSim is more reliable,so I advice the user to make use only of
that folder.
