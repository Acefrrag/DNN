----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Michele Pio Fragasso
-- 
-- Create Date: 03/29/2022 10:15:21 AM
-- Design Name: 
-- Module Name: test_fixed_point_tb - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.fixed_pkg.all;




entity test_fixed_point_tb is
end test_fixed_point_tb;

architecture Behavioral of test_fixed_point_tb is
signal in1: sfixed(3 downto -14) := (others => '0');
signal in2: sfixed(2 downto -3) := (others => '0');
signal out1: sfixed(4 downto -14) := (others => '0');



begin
out1 <= in1 + in2;

in_gen: process
begin
wait for 20 ns;
in1 <= to_sfixed(-0.002152527977579181, in1);
in2 <= to_sfixed(3.875, in2);
wait for 20 ns;
in1 <= to_sfixed(-1.75, in1);
in2 <= to_sfixed(-3.875, in2);
end process in_gen;

end Behavioral;
