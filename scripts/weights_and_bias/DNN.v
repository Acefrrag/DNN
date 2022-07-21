----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Michele Pio Fragasso
-- 
-- Create Date: 04/18/2022 09:21:01 PM
-- Design Name: 
-- Module Name: DNN - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision: 
-- Revision 0.01 - File Created 
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;
library work;
use work.DNN_package.all;
entity DNN is
port(
data_in: in sfixed (data_int_width-1 downto -data_frac_width);
start: in std_logic;
clk: in std_logic;
data_out: out sfixed (data_int_width-1 downto -data_frac_width);
addr_in: out std_logic_vector(0 to natural(ceil(log2(real(layer_inputs(1)))))-1); --To scan through the valdation data set
addr_out: out std_logic_vector(0 to natural(ceil(log2(real(layer_outputs(3)))))-1)); --To scan through the valdation data set
end DNN;
architecture Behavioral of DNN is
type data_vect_type is array(1 to num_layers) of sfixed(data_int_width-1 downto -data_frac_width);
signal data_out_vect, data_in_vect: data_vect_type;
signal start_vect: std_logic_vector(0 to num_layers);
signal data_v_vect: std_logic_vector(1 to num_layers);
signal data_in_sel_vect: std_logic_vector(0 to natural(ceil(log2(real(isum(layer_inputs)))))-1);
signal data_out_sel_vect: std_logic_vector(0 to natural(ceil(log2(real(isum(layer_outputs)))))-1);
signal data_in_sel1: std_logic_vector(0 to  natural(ceil(log2(real(layer_inputs(1)))))-1);
signal data_out_sel1: std_logic_vector(0 to  natural(ceil(log2(real(layer_outputs(1)))))-1);
signal data_in_sel2: std_logic_vector(0 to  natural(ceil(log2(real(layer_inputs(2)))))-1);
signal data_out_sel2: std_logic_vector(0 to  natural(ceil(log2(real(layer_outputs(2)))))-1);
signal data_in_sel3: std_logic_vector(0 to  natural(ceil(log2(real(layer_inputs(3)))))-1);
signal data_out_sel3: std_logic_vector(0 to  natural(ceil(log2(real(layer_outputs(3)))))-1);
