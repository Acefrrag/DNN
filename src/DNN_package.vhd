library ieee_proposed;
use ieee_proposed.fixed_pkg.all;



package DNN_package is
    -- Package Declarative Part
    --(It contains variables, types, procedures and function declaration)
    --TestBench for neuron entities and its subentities
    constant neuron_rom_depth : natural := 30;--Number of weights for the neuron to be tested (which corresponds to the the number of input connected to the neuron)
    constant neuron_rom_width : natural := 16;--Bits for fixed-point representation.
	constant neuron_rom_file : string := "../scripts/weights_and_bias/w_b/w_2_10.mif";
	--Fixed Point Representation
	constant input_depth: natural := neuron_rom_depth;--Input sequence widths
	constant input_width: natural := 16;
	constant input_int_width: natural := 4;
	constant input_frac_width: natural := input_width-input_int_width;
	constant dataset_path: string := "../scripts/test_data/datasets/input_neuron.mif";
	--Weights widths
	constant neuron_width_sfixed: natural := neuron_rom_width; --Bit number for fixed point representation.
	constant neuron_int_width: natural := 4;--number of Bits to represent the integer part (including the sign)
	constant neuron_frac_width: natural := neuron_rom_width - neuron_int_width; --Number of bits to reprent the fractional part.
	--Bias widhts
	constant neuron_width_sfixed_b: natural := neuron_rom_width; --Bit number for fixed point representation.
	constant neuron_int_width_b: natural := 1;--number of Bits to represent the integer part (including the sign)
	constant neuron_frac_width_b: natural := neuron_width_sfixed_b - neuron_int_width_b; --Number of bits to reprent the fractional part.
	constant neuron_value_b: sfixed(neuron_int_width_b-1 downto -neuron_frac_width_b):=(15=>'1',14=>'1',13=>'1',12=>'0',11=>'1',10=>'1',9=>'1',8=>'1',7=>'0',6=>'0',5=>'0',4=>'1',3=>'1',2=>'1',1=>'1',0=>'1');

    
    --Functions Declaration
    

    
end package DNN_package;

package body DNN_package is
    --Package Body Section
    

end package body DNN_package;
