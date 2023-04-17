# Serial Configuration Reconfigurable DNN

This github repository consists in a VHDL serial implemenation architecture of a reconfigurable fully-connected feed forward deep neural network. This architecture as well as reconfiguration capabilities are inspired to [ZyNet package](https://github.com/dsdnu/zynet) developed by Vipin Kizhepatt found here .

  

</p>
<p align="center">
  <img src="https://user-images.githubusercontent.com/59066474/232430837-52b3a283-e854-4e98-8dbf-fcf95338d192.png")>
</p>

## Motivation

The aim of the development of such architecture is the integration with [NORM](https://github.com/simoneruffini/NORM) to enable the reconfiguration and evaluation of an hardware-based intermittent inference under uncertain energy environment obtaining [I-DNN](https://github.com/Acefrrag/I-DNN)

## Repository Content

This github repository contains the VHDL architecture developed under two different EDA tools (Vivado and ModelSim).

This repository contains a set of python scripts to train a fully-connected MLP and reconfiguration of the aforemention
VHDL-based DNN.

## Warning
The Vivado project folder is deprecated. ModelSim is the project to refer to.
