----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Michele Pio Fragasso
-- 
-- Create Date: 03/18/2022 04:07:22 PM
-- Design Name: 
-- Module Name: wieght_memory_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Test Bench for weight memory
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;

library work;
use work.DNN_package.all;

entity weight_memory_tb is
end weight_memory_tb;

architecture Behavioral of weight_memory_tb is

constant weight_memory_depth: natural := 30;
constant weight_memory_IntWidth: natural := 2;
constant weight_memory_FracWidth: natural := 30;
constant weight_memory_Width: natural := weight_memory_IntWidth+weight_memory_FracWidth;
constant weight_memory_file: string := "weight_memory_file.txt";

--Declarative Part
signal clk: std_logic := '0';
signal addr: std_logic_vector(0 to weight_memory_depth -1) := (others=>'0');
signal dout: sfixed(weight_memory_IntWidth-1 downto -weight_memory_FracWidth);
-- Components Declaration
component weight_memory is
generic(
    rom_depth: natural;
    rom_width: natural;
    rom_int_width: natural;
    rom_frac_width: natural;
    log_file:  string);
port(
    clk: in std_logic;
    addr: in std_logic_vector(0 to weight_memory_depth-1);
    dout: out sfixed (weight_memory_IntWidth-1 downto -weight_memory_FracWidth));
end component weight_memory;


begin
--Component Instantiation
w_mem: weight_memory
    generic map(
        rom_depth => weight_memory_depth,
        rom_width => weight_memory_Width,
        rom_int_width => weight_memory_IntWidth,
        rom_frac_width => weight_memory_FracWidth,
        log_file => weight_memory_file)
    port map(
        clk => clk, addr => addr, dout => dout);
        
clk_gen: process begin
    wait for 20 ns;
    clk <= not(clk);
end process clk_gen;

addr_gen: process(clk) begin
    if rising_edge(clk) then
        addr <= std_logic_vector( unsigned(addr) + 1 ) after 10 ns;
    end if;
end process addr_gen;

end Behavioral;
