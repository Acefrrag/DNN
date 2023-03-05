----------------------------------------------------------------------------------
-- Company: 									--
-- Engineer: Michele Pio Fragasso						--
-- 										--
-- Create Date: 04/05/2022 10:28:34 AM						--
-- Design Name: 								--
-- Module Name: layer - Behavioral						
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
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.fixed_pkg.all;

library work;
use work.DNN_package.all;

entity layer is
generic(
    constant num_inputs: natural := 30;
    constant num_outputs: natural := 30;
	constant neuron_input_IntWidth: natural := 16;
	constant neuron_input_FracWidth: natural := 16;
	constant neuron_weight_IntWidth: natural := 2;
	constant neuron_weight_FracWidth: natural := 30;
    constant layer_no: natural := 0;--Layer number (identifier)
    constant act_fun_type: string := "ReLU"; -- Choose between "ReLU","Sig"
    constant sigmoid_inputdataWidth: natural := 5;
	constant sigmoid_inputdataIntWidth: natural := 2;
	constant lyr_prms_path: string := "../files/tb/layer/tb1/"
);
port(
    clk: in std_logic;
    data_in: in sfixed(neuron_input_IntWidth-1 downto -neuron_input_FracWidth);
    data_out_sel: in std_logic_vector(0 to natural(ceil(log2(real(num_outputs))))-1);
    start: in std_logic;--to increment the counter while the output of the output is begin computed
    data_out: out sfixed(neuron_input_IntWidth-1 downto -neuron_input_FracWidth);--The next layer controls which neuron's output to access
    data_in_sel: out std_logic_vector(0 to natural(ceil(log2(real(num_inputs))))-1);
    data_v: out std_logic);
end layer;

architecture Behavioral of layer is
type rom_type is array (0 to num_inputs-1) of sfixed(neuron_input_IntWidth-1 downto -neuron_input_FracWidth);
type data_out_type is array(0 to num_outputs-1) of sfixed(neuron_input_IntWidth-1 downto -neuron_input_FracWidth);


--signal data_out_sel: std_logic_vector(0 to natural(ceil(log2(real(num_outputs))))-1):=(others=>'0');
signal addr: std_logic_vector(0 to natural(ceil(log2(real(num_inputs))))-1) :=(others => '0');
signal rst: std_logic := '1';
signal data_out_vect: data_out_type;
signal out_v_vect: std_logic_vector(0 to num_outputs-1):=(others => '0');
signal addr_TC: std_logic := '0';
signal sum_reg_rst: std_logic;
signal mul_sel: std_logic; 
signal out_v: std_logic; 
signal update_out: std_logic;
signal addr_in_gen_rst: std_logic;
signal data_in_d: sfixed(neuron_input_IntWidth-1 downto -neuron_input_FracWidth);
--signal start_d: std_logic;

component FSM_layer is
generic (
rom_depth: natural);--the number of summations in the weighted sum will be 16-1=15
port(clk: in std_logic; 
    addr_TC: in std_logic; --This bit indicates if we are feeding the neuron with the last input
    start: in std_logic; --This signal initiate the neuron computation
    sum_reg_rst: out std_logic; --This bit resets the weighted sum register
    mul_sel: out std_logic; --This signal decides weather to add up the product w_i*x_i or the bias b
    out_v: out std_logic; --This signal aknowledge the output is valid
    update_out: out std_logic;
    addr_in_gen_rst: out std_logic); --This update the output of the neuron, since it is necessary to  
end component;


begin




fsm_layer_comp: FSM_layer
generic map(
rom_depth => num_inputs
)
port map(
    clk => clk,
    addr_TC => addr_TC, --This bit indicates if we are feeding the neuron with the last input
    start => start,  --This signal initiate the neuron computation
    sum_reg_rst => sum_reg_rst, --This bit resets the weighted sum register
    mul_sel => mul_sel,  --This signal decides weather to add up the product w_i*x_i or the bias b
    out_v => out_v,--This signal aknowledge the output is valid
    update_out => update_out,
    addr_in_gen_rst => addr_in_gen_rst); --This update the output of the neuron, since it is necessary to  
    
data_v <= out_v;

rst <= addr_in_gen_rst;
data_in_sel <= addr;
--rst <= 
layer_CNTR: process(clk,rst) is --This process generate the address to access the neuron weight and get the input from the previous layer
begin
   -- if rst = '1' then
    --    addr <= '0';
   -- else
        if rst = '1' then
            addr <= (others => '0');
        else
            if rising_edge(clk) then
                addr <= std_logic_vector(unsigned(addr) + 1);
                if unsigned(addr) = num_inputs-2 then
                    addr_TC <= '1';
                else
                    addr_TC <= '0';
                end if;
                if unsigned(addr) = num_inputs-1 then
                    addr <= (others=>'0');
                end if;
            end if;
        end if;    
    --end if;
end process layer_CNTR;


neurons: for i in 0 to num_outputs-1 generate
    component neuron is
        generic(
            rom_width: natural;
            rom_depth: natural;
			neuron_input_Width: natural;
			neuron_input_FracWidth: natural;
			neuron_weight_Width: natural;
			neuron_weight_FracWidth: natural;
            weight_file: string;
            bias_file: string;
			act_fun_type: string;
			sigmoid_inputdataWidth: natural;
			sigmoid_inputdataIntWidth: natural;
			Sigfilename: string
			);
        port(
            clk: in std_logic;
            data_in: in sfixed (neuron_input_Width-neuron_input_FracWidth-1 downto -neuron_input_FracWidth);
            addr: in std_logic_vector (0 to natural(ceil(log2(real(rom_depth))))-1);
            mul_sel: in std_logic;
            sum_reg_rst: in std_logic;
            update_out: in std_logic;
            data_out: out sfixed (neuron_input_Width-neuron_input_FracWidth-1 downto -neuron_input_FracWidth)
            );
    end component;
    begin
        neuron_i: neuron
        generic map(
        rom_width => neuron_weight_FracWidth+neuron_weight_IntWidth,
        rom_depth => num_inputs,
		neuron_input_Width => neuron_input_IntWidth+neuron_input_FracWidth,
		neuron_input_FracWidth => neuron_input_FracWidth,
		neuron_weight_Width => neuron_weight_IntWidth+neuron_weight_FracWidth,
		neuron_weight_FracWidth => neuron_weight_FracWidth,
        weight_file => lyr_prms_path&"weights/w_" & integer'image(layer_no)&"_"&integer'image(i)&".mif",
        bias_file => lyr_prms_path&"biases/b_" & integer'image(layer_no)&"_"&integer'image(i)&".mif",
		act_fun_type => act_fun_type,
		sigmoid_inputdataWidth => sigmoid_inputdataWidth,
		sigmoid_inputdataIntWidth => sigmoid_inputdataIntWidth,
		Sigfilename => lyr_prms_path&"sigmoid/SigContent.mif")
        port map(
        clk => clk,
        data_in =>data_in,
        addr =>data_in_sel,        
        mul_sel => mul_sel,
        sum_reg_rst => sum_reg_rst,
        update_out => update_out,
        data_out => data_out_vect(i));
end generate;




--num_outputs = 30 => data_out_sel = 5 2^5=32
--Output logic
data_out<=data_out_vect(to_integer(unsigned(data_out_sel)));
--data_out_sel_pr: process(clk,out_v_vect) is
--begin
--    if out_v_vect(0) ='0' then
--        data_out_sel <= (others => '0');
--    else
--        if rising_edge(clk) then
--            if out_v_vect(0) = '1' then
--            data_out_sel <= std_logic_vector(unsigned(data_out_sel) + 1);
--                if unsigned(data_out_sel)=num_outputs-1 then
--                    data_out_sel <= (others => '0');
--                end if;
--            end if;
--        end if;
--    end if;
--end process data_out_sel_pr;

input_reg: process(clk) is
begin
    if rising_edge(clk) then
        data_in_d <= data_in;
        --start_d <= start;
    end if;
end process input_reg;
  
  

end Behavioral;