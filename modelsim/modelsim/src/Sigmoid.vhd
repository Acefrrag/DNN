library ieee;
use ieee.std_logic_1164.all;
use ieee.fixed_pkg.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

library work;
use work.DNN_package.all;

entity Sigmoid is
generic(
	constant inputdataWidth: natural := DNN_sigmoid_inputdata_Width;
	constant inputdataIntWidth: natural := DNN_sigmoid_inputdata_IntWidth;
	constant outputdataWidth: natural := DNN_neuron_input_Width;
	constant outputdataIntWidth: natural := DNN_neuron_input_IntWidth;
	constant Sigfilename: string := "SigContent.txt"
);
port(
	CLK			:in std_logic;
	data_in		: in sfixed(inputdataIntWidth-1 downto -(inputdataWidth-inputdataIntWidth));
	data_out	: out sfixed(outputdataIntWidth-1 downto -(outputdataWidth-outputdataIntWidth))
);
end Sigmoid;


Architecture Behavioral of Sigmoid is


type rom_type is array (0 to 2**inputdataWidth-1) of sfixed(outputdataIntWidth-1 downto -(outputdataWidth-outputdataIntWidth));


impure function makesfixed (bit_in: in bit_vector(outputdataWidth-1 downto 0)) return sfixed is
	variable outputdataFracWidth: natural := outputdataWidth-outputdataIntWidth;
    variable fixedpoint_s: sfixed((outputdataIntWidth)-1 downto -(outputdataFracWidth));
    begin
    for i in fixedpoint_s'range loop
        fixedpoint_s(i) := To_StdULogic(bit_in(i+(outputdataFracWidth)));
    end loop;
    return fixedpoint_s;
end function;

impure function genSigROM(filename: string) return rom_type is

file file_header: text open read_mode is filename;
variable text_line: line;
variable bit_line: bit_vector(outputdataWidth-1 downto 0);
variable sigmoid_content: rom_type := (others => (others => '0'));
begin
	for i in sigmoid_content'range loop
		readline(file_header, text_line);
		read(text_line, bit_line);
		sigmoid_content(i) := makesfixed(bit_line);
	end loop;
	return sigmoid_content;
end function;

signal sigmoid_ROM: rom_type := genSigROM(Sigfilename);
--signal data_in_slv: std_logic_vector(data_in'length-1 downto 0);
--signal data_in
signal data_in_integer: integer:=0;
signal addr: std_logic_vector(inputdataWidth-1 downto 0) := (others => '0');

begin

--data_in_slv <= to_slv(data_in);
--data_in_signed <= signed(data_in_slv);
--data_in_integer <= to_integer(data_in_signed);		--Used to generate the address to the Sigmoid ROM
data_in_integer <= to_integer(signed(to_slv(data_in)));
data_out <= Sigmoid_ROM(to_integer(unsigned(addr)));

addr_finder: process(CLK) is
--if the number representation is 0 then the address is the middle. Because that corresponds to 0
--if the number representation is the smallest possible that is -2^(inputdataWidth-1), the address is 0, because that corresponds to the smallest abscissa value.
--From these two you infere the formula. But it is necessary to convert the number into his representation.
begin
if rising_edge(CLK) then
	if data_in_integer >= 0 then
		--if the number representation is >= 0 it means that we have to select sigmoid values 
		addr <= std_logic_vector(to_unsigned(data_in_integer+2**(inputdataWidth-1), addr'length));
	else
		addr <= std_logic_vector(to_unsigned(data_in_integer+2**(inputdataWidth-1), addr'length));
	end if;
end if;
end process;




end Behavioral;