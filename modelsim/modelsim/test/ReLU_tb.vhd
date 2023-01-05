----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2022 12:20:23 PM
-- Design Name: 
-- Module Name: ReLU_tb - Behavioral
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
use ieee.numeric_std;
use ieee.fixed_pkg.all;

library work;
use work.DNN_package.all;

entity ReLU_tb is
end ReLU_tb;

architecture Behavioral of ReLU_tb is

signal data_in: sfixed(1 downto -rom_width_tb+2) := (others => '0');
signal data_out: sfixed(1 downto -rom_width_tb+2);
signal clk: std_logic := '0';

component ReLU is
generic(
    data_width: natural);
port(
    data_in: in sfixed(1 downto -rom_width_tb+2);
    data_out: out sfixed(1 downto -rom_width_tb+2));
end component ReLU;

begin

    ReLU_comp: ReLU
    generic map(
        data_width => rom_width_tb)
    port map(
        data_in => data_in,
        data_out => data_out
    );

--clk_gen: process
--begin
--    wait for 20 ns;
--    clk <= not(clk);
--end process clk_gen;

data_gen: process
begin
    data_in <= to_sfixed(0.5, data_in);
    wait for 50 ns;
    data_in <= to_sfixed(-0.5, data_in);
    wait for 50 ns;
    data_in <= to_sfixed(-0.03, data_in);
    wait for 50 ns;
    data_in <= to_sfixed(-1.99, data_in);
    wait for 50 ns;
    data_in <= to_sfixed(1.99, data_in);
    wait for 50 ns;
end process data_gen;
   

end Behavioral;
