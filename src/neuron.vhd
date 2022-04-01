----------------------------------------------------------------------------------
-- Company: University of Trento
-- Engineer: Michele Pio Fragasso
-- 
-- Create Date: 03/17/2022 09:04:44 AM
-- Design Name: 
-- Module Name: neuron - Behavioral
-- Project Name: pipelined neuron for DNN
-- Target Devices: ICE40
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
library ieee_proposed;
use ieee_proposed.fixed_pkg.all;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;

library work;
use work.DNN_package.all;



entity neuron is

generic(
    constant rom_width: natural := 16;
    constant rom_depth: natural := 3;
    constant neuron_file: string := "neuron_test.txt");
port(
    clk: in std_logic;
    data_in: in sfixed (input_int_width-1 downto -input_frac_width);
    addr: in std_logic_vector (0 to natural(ceil(log2(real(neuron_rom_width)))));
    addr_TC: in std_logic; --When the address counter reaches the top this signal goes high. When  
    input_valid: in std_logic;
    data_out: out sfixed (input_int_width-1 downto -input_frac_width);
    data_v: out std_logic);
end entity neuron;


architecture Behavioral of neuron is
signal weight_out: sfixed (neuron_int_width-1 downto -neuron_frac_width):=(others=>'0');
signal clk_sig: std_logic := '0';
signal sum_reg_rst: std_logic := '1';
signal mul_sel: std_logic := '0';
signal type_sfixed: sfixed((input_int_width+neuron_int_width)-1 downto -neuron_frac_width-neuron_frac_width);--signal to initialize the others
signal sum_reg_out: sfixed((input_int_width+neuron_int_width)-1 downto (-neuron_frac_width-input_frac_width)) := (others => '0');
signal mul_out: sfixed((neuron_int_width+input_int_width)-1 downto (-neuron_frac_width-input_frac_width)) := (others => '0');
signal weight_prod: sfixed((neuron_int_width+input_int_width)-1 downto (-neuron_frac_width-input_frac_width)) := (others => '0');
signal bias: sfixed((neuron_int_width+input_int_width)-1 downto (-neuron_frac_width-input_frac_width));
signal out_reg_val: sfixed(neuron_int_width-1 downto -neuron_frac_width);
signal out_ReLU: sfixed(input_int_width-1 downto -input_frac_width);
signal input_valid_d: std_logic;
signal data_in_d: sfixed(input_int_width-1 downto -input_frac_width);
signal update_out: std_logic;


component weight_memory is
generic(rom_depth: natural;
        rom_width: natural;
        log_file: string);
port( clk: in std_logic;
    addr: in std_logic_vector(0 to natural(ceil(log2(real(neuron_rom_width)))));
    dout: out sfixed (neuron_int_width-1 downto -neuron_frac_width));
end component weight_memory;


component ReLU is
generic(data_width: natural);
port(data_in: in sfixed((neuron_int_width+input_int_width)-1 downto (-neuron_frac_width-input_frac_width));
    data_out: out sfixed(input_int_width-1 downto -input_frac_width));
end component ReLU;



component FSM_neuron is
generic(rom_depth: natural := 3);
port(clk: in std_logic;
    addr_TC: in std_logic; --This bit indicates if we are feeding the neuron with the last input
    input_valid: in std_logic;
    sum_reg_rst: out std_logic; --This bit resets the weighted sum register
    mul_sel: out std_logic;
    out_v: out std_logic;
    update_out: out std_logic);
end component FSM_neuron;


begin

weight_prod <= weight_out*data_in;
bias <= to_sfixed(1,bias);

clk_sig <= clk;

weight_memory_comp: weight_memory
generic map(
rom_depth => neuron_rom_depth,
rom_width => neuron_rom_width,
log_file => neuron_file)
port map(clk => clk_sig, addr => addr, dout => weight_out);

FSM_neuron_comp: FSM_neuron
generic map(rom_depth => rom_depth)
port map(
    clk => clk_sig,
    input_valid => input_valid,
    addr_TC => addr_TC,
    sum_reg_rst => sum_reg_rst,
    mul_sel => mul_sel,
    out_v => data_v,
    update_out => update_out);
    
ReLU_comp: ReLU
generic map(data_width => rom_width)
port map(
    data_in => sum_reg_out,
    data_out => out_ReLU
);

sum_reg: process (clk)
begin
    if rising_edge(clk) then
        sum_reg_out <= mul_out;
    end if;    
end process sum_reg;

mul_temp: process(all)
begin
    case mul_sel is  
    when '0' => --the product w_i*x_i is chosen
        mul_out <= resize(weight_prod + sum_reg_out,mul_out'high, mul_out'low);
    when '1' => -- the bias is added
        mul_out <= resize(bias + sum_reg_out,mul_out'high, mul_out'low);
    when others =>
        mul_out <= resize(weight_prod + sum_reg_out, mul_out'high, mul_out'low);
    end case;
end process mul_temp;

out_reg: process(update_out) is
begin
    if rising_edge(update_out) then
        out_reg_val <= out_ReLU;
    end if;
end process out_reg;

input_reg: process(clk) is
begin
    if rising_edge(clk) then
        data_in_d <= data_in;
        input_valid_d <= input_valid;
    end if;
end process input_reg;




--Neuron Output

data_out <= out_reg_val;

end Behavioral;
