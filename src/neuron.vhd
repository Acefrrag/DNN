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

library std;
use std.textio.all;

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
    constant weight_file: string := "weights.txt";
    constant bias_file: string := "bias.txt");
port(
    clk: in std_logic;
    data_in: in sfixed (input_int_width-1 downto -input_frac_width);
    addr: in std_logic_vector (0 to natural(ceil(log2(real(rom_depth))))-1);
    mul_sel: in std_logic;
    sum_reg_rst: in std_logic;
    update_out: in std_logic;
    data_out: out sfixed (input_int_width-1 downto -input_frac_width));
end entity neuron;


architecture Behavioral of neuron is

signal weight_out: sfixed (neuron_int_width-1 downto -neuron_frac_width):=(others=>'0');
signal clk_sig: std_logic := '0';
signal type_sfixed: sfixed((input_int_width+neuron_int_width)-1 downto -neuron_frac_width-neuron_frac_width);--signal to initialize the others
signal sum_reg_out: sfixed((input_int_width+neuron_int_width)-1 downto (-neuron_frac_width-input_frac_width)) := (others => '0');
signal mul_out: sfixed((neuron_int_width+input_int_width)-1 downto (-neuron_frac_width-input_frac_width)) := (others => '0');
signal weight_prod: sfixed((neuron_int_width+input_int_width)-1 downto (-neuron_frac_width-input_frac_width)) := (others => '0');
signal bias: sfixed((neuron_int_width+input_int_width)-1 downto (-neuron_frac_width-input_frac_width));
signal out_reg_val: sfixed(neuron_int_width-1 downto -neuron_frac_width);
signal out_ReLU: sfixed(input_int_width-1 downto -input_frac_width);
signal out_ReLU_d: sfixed(input_int_width-1 downto -input_frac_width);
signal start_d: std_logic;
--signal data_in_d: sfixed(input_int_width-1 downto -input_frac_width);


component weight_memory is
generic(rom_depth: natural;
        rom_width: natural;
        log_file: string);
port( clk: in std_logic;
    addr: in std_logic_vector(0 to natural(ceil(log2(real(rom_depth))))-1);
    dout: out sfixed (neuron_int_width-1 downto -neuron_frac_width));
end component weight_memory;


component ReLU is
generic(data_width: natural);
port(data_in: in sfixed((neuron_int_width+input_int_width)-1 downto (-neuron_frac_width-input_frac_width));
    data_out: out sfixed(input_int_width-1 downto -input_frac_width));
end component ReLU;

function makesfixed (bit_in: in bit_vector((neuron_width_sfixed+input_width)-1 downto 0)) return sfixed is
    variable fixedpoint_s: sfixed((neuron_int_width+input_int_width)-1 downto (-neuron_frac_width-input_frac_width));
    --variable a: std_logic := 0;
    begin
    for i in fixedpoint_s'range loop
        fixedpoint_s(i) := To_StdULogic(bit_in(i+neuron_frac_width+input_frac_width));
    end loop;
    return fixedpoint_s;
end function;

impure function init_bias(bias_file: in string) return sfixed is
file text_header2: text is in bias_file; --This produces a header to the file
variable text_line2: line; --the type line represents a line in the file
variable bit_line2: bit_vector(neuron_width_sfixed+input_width-1 downto 0);
variable bias_content2: sfixed((neuron_int_width+input_int_width)-1 downto (-neuron_frac_width-input_frac_width));
variable j: std_logic;
begin
j:='0';
readline(text_header2, text_line2);
read(text_line2, bit_line2);
bias_content2 := makesfixed(bit_line2);
return bias_content2;

end function; 


begin

weight_prod <= weight_out*data_in;
bias <= init_bias(bias_file);

clk_sig <= clk;

--Neuron Output

data_out <= out_reg_val;

weight_memory_comp: weight_memory
generic map(
rom_depth => rom_depth,
rom_width => neuron_rom_width,
log_file => weight_file)
port map(clk => clk_sig,
addr => addr,
dout => weight_out);
    
ReLU_comp: ReLU
generic map(data_width => rom_width)
port map(
    data_in => sum_reg_out,
    data_out => out_ReLU
);


sum_reg: process (clk)
begin
    if sum_reg_rst = '1' then
        sum_reg_out <= (others => '0');
    else
        if rising_edge(clk) then
            sum_reg_out <= mul_out;
        end if;
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

out_ReLU_reg: process(clk) is
begin
    if falling_edge(clk) then
        out_ReLU_d <= out_ReLU;
    end if;
end process out_ReLU_reg;

out_reg: process(update_out) is
begin
    if rising_edge(update_out) then
        out_reg_val <= out_ReLU_d;
    end if;
end process out_reg;






end Behavioral;
