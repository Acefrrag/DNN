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


library std;
use std.textio.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.fixed_pkg.all;

library work;
use work.DNN_package.all;



entity neuron is

generic(
    constant rom_width: natural := 16;
    constant rom_depth: natural := 3;
	constant neuron_input_Width: natural := 32;
	constant neuron_input_FracWidth: natural := 16;
	constant neuron_weight_Width: natural := 32;
	constant neuron_weight_FracWidth: natural := 30;
    constant weight_file: string := "weights.txt";
    constant bias_file: string := "bias.txt";
	constant act_fun_type: string := "ReLU";
	constant sigmoid_inputdataWidth: natural := 5;
	constant sigmoid_inputdataIntWidth: natural := 2;
	constant Sigfilename: string := "../scripts/sigmoid/SigContent.mif"
	);
port(
    clk: in std_logic;
    data_in: in sfixed (neuron_input_Width-neuron_input_FracWidth-1 downto -neuron_input_FracWidth);
    addr: in std_logic_vector (0 to natural(ceil(log2(real(rom_depth))))-1);
    mul_sel: in std_logic;
    sum_reg_rst: in std_logic;
    update_out: in std_logic;
    data_out: out sfixed (neuron_input_Width-neuron_input_FracWidth-1 downto -neuron_input_FracWidth));
end entity neuron;


architecture Behavioral of neuron is


constant neuron_bias_IntWidth: natural := (neuron_input_Width-neuron_input_FracWidth)+(neuron_weight_Width-neuron_weight_FracWidth);
constant neuron_bias_FracWidth: natural := neuron_input_FracWidth+neuron_weight_FracWidth;
constant neuron_bias_Width: natural := (neuron_input_Width+neuron_weight_Width);
constant sigmoid_inputdataFracWidth: natural := sigmoid_inputdataWidth - sigmoid_inputdataIntWidth;

signal weight_out: sfixed (neuron_weight_Width-neuron_weight_FracWidth-1 downto -neuron_weight_FracWidth):=(others=>'0');
signal clk_sig: std_logic := '0';
signal sum_reg_out: sfixed(neuron_bias_IntWidth-1 downto -(neuron_bias_Width-neuron_bias_IntWidth)) := (others => '0');
signal mul_out: sfixed(neuron_bias_IntWidth-1 downto -(neuron_bias_Width-neuron_bias_IntWidth)) := (others => '0');
signal weight_prod: sfixed(neuron_bias_IntWidth-1 downto -(neuron_bias_Width-neuron_bias_IntWidth)) := (others => '0');
signal bias: sfixed(neuron_bias_IntWidth-1 downto -(neuron_bias_Width-neuron_bias_IntWidth));
signal out_reg_val: sfixed(neuron_input_Width-neuron_input_FracWidth-1 downto -neuron_input_FracWidth);
signal act_log_out: sfixed(neuron_input_Width-neuron_input_FracWidth-1 downto -neuron_input_FracWidth);
signal act_log_out_d: sfixed(neuron_input_Width-neuron_input_FracWidth-1 downto -neuron_input_FracWidth);
signal sigmoid_data_in: sfixed(sigmoid_inputdataIntWidth-1 downto -sigmoid_inputdataFracWidth):=(others => '0');


component weight_memory is
generic(rom_depth: natural;
        rom_width: natural;
		rom_int_width: natural;
		rom_frac_width: natural;
        log_file: string);
port( clk: in std_logic;
    addr: in std_logic_vector(0 to natural(ceil(log2(real(rom_depth))))-1);
    dout: out sfixed (neuron_weight_Width-1 downto -neuron_weight_FracWidth)
);
end component weight_memory;

/*Error (vcom-1396) Object "sfixed_Width" cannot appear within the same interface list in which it is declared. 
function makesfixed(sfixed_Width: in natural; sfixed_IntWidth: in natural; bit_in: in bit_vector( sfixed_Width-1 downto 0)) return sfixed is
	variable fixedpoint_s: sfixed((sfixed_IntWidth)-1 downto -(sfixed_Width-sfixed_IntWidth));
	constant sfixed_FracWidth : natural := sfixed_Width-sfixed_IntWidth;
	begin
	for i in fixedpoint_s'range loop
        fixedpoint_s(i) := To_StdULogic(bit_in(i+sfixed_FracWidth));
    end loop;
    return fixedpoint_s;
end function; */


impure function bias_makesfixed (bit_in: in bit_vector((neuron_bias_Width)-1 downto 0)) return sfixed is
    variable fixedpoint_s: sfixed((neuron_bias_IntWidth)-1 downto -(neuron_bias_Width-neuron_bias_IntWidth));
    begin
    for i in fixedpoint_s'range loop
        fixedpoint_s(i) := To_StdULogic(bit_in(i+neuron_bias_FracWidth));
    end loop;
    return fixedpoint_s;
end function;


impure function init_bias(bias_file: in string) return sfixed is
file text_header2: text open read_mode is bias_file; --This produces a header to the file
variable text_line2: line; --the type line represents a line in the file
variable bit_line2: bit_vector(neuron_bias_Width-1 downto 0);
variable bias_content2: sfixed((neuron_bias_IntWidth)-1 downto -(neuron_bias_Width-neuron_bias_IntWidth));
begin
readline(text_header2, text_line2);
read(text_line2, bit_line2);
bias_content2 := bias_makesfixed(bit_line2);
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
rom_width => rom_width,
rom_int_width => neuron_weight_Width-neuron_weight_FracWidth,
rom_frac_width => neuron_weight_FracWidth,
log_file => weight_file
)
port map(clk => clk_sig,
addr => addr,
dout => weight_out);
   
  
act_log_generate: if act_fun_type="ReLU" generate

	component ReLU is
	generic(
	data_width: natural;
	ReLU_in_IntWidth: natural;
	ReLU_in_FracWidth: natural;
	ReLU_out_IntWidth: natural;
	ReLU_out_FracWidth: natural

	);
	port(
		CLK: in std_logic;
		data_in: in sfixed (ReLU_in_IntWidth-1 downto -(neuron_bias_Fracwidth));
		data_out: out sfixed (neuron_input_Width-neuron_input_FracWidth-1 downto -(neuron_input_FracWidth))
	);
	end component ReLU;
	
	begin
	
	ReLU_comp: ReLU
	generic map(
	data_width => rom_width,
	ReLU_in_IntWidth => neuron_bias_IntWidth,
	ReLU_in_FracWidth => neuron_bias_Fracwidth,
	ReLU_out_IntWidth => neuron_input_Width-neuron_input_FracWidth,
	ReLU_out_FracWidth => neuron_input_FracWidth
	)
	port map(
		CLK => clk,
		data_in => sum_reg_out,
		data_out => act_log_out
	);
	
elsif act_fun_type = "Sig" generate

	component Sigmoid is
	generic(
		constant inputdataWidth: natural;
		constant inputdataIntWidth: natural;
		constant outputdataWidth: natural;
		constant outputdataIntWidth: natural;
		constant Sigfilename: string
	);
	port(
		CLK			:in std_logic;
		data_in		: in sfixed(sigmoid_inputdataIntWidth-1 downto -(sigmoid_inputdataWidth-sigmoid_inputdataIntWidth));
		data_out	: out sfixed(neuron_input_Width-neuron_input_FracWidth-1 downto -(neuron_input_FracWidth))
	);
	end component;
	
	begin
	
	--logic to resize the input to the sigmoid
	sigmoid_data_in <= resize(sum_reg_out, sigmoid_data_in'high, sigmoid_data_in'low);
	--Component Instantion
	Sigmoid_comp: Sigmoid
	generic map(
	inputdataWidth => sigmoid_inputdataWidth,
	inputdataIntWidth => sigmoid_inputdataIntWidth,
	outputdataWidth => neuron_input_Width,
	outputdataIntWidth => neuron_input_Width-neuron_input_FracWidth,
	Sigfilename => Sigfilename
	)
	port map(
		CLK		=> clk,
		data_in	=> sigmoid_data_in,
		data_out => act_log_out
	);
end generate;

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

--act_log_reg: process(clk) is
--begin
  --  if falling_edge(clk) then
    --    act_log_out_d <= act_log_out;
    --end if;
--end process act_log_reg;

out_reg: process(update_out) is
begin
    if rising_edge(update_out) then
        out_reg_val <= act_log_out;
    end if;
end process out_reg;






end Behavioral;
