library ieee;
use ieee.std_logic_1164.all;
use ieee.fixed_pkg.all;
use ieee.math_real.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

library work;
use work.DNN_package.all;


entity Sigmoid_tb is
--port--
end Sigmoid_tb;

Architecture Behavioral of Sigmoid_tb is

signal CLK: std_logic := '0';
signal data_in: sfixed(1 downto -3) := (others => '0');
signal data_out: sfixed(5 downto -10);

component Sigmoid is
generic(
	constant inputdataWidth: natural;
	constant inputdataIntWidth: natural;
	constant outputdataWidth: natural;
	constant outputdataIntWidth: natural;
	constant Sigfilename: string
);
port(
	CLK: in std_logic;
	data_in		: in sfixed(inputdataIntWidth-1 downto -(inputdataWidth-inputdataIntWidth));
	data_out	: out sfixed(outputdataIntWidth-1 downto -(outputdataWidth-outputdataIntWidth))
);
end component;

begin

Sigmoid_comp: Sigmoid
generic map(
	inputdataWidth => 5,
	inputdataIntWidth => 2,
	outputdataWidth => 16,
	outputdataIntWidth => 6,
	Sigfilename => "../scripts/sigmoid/SigContent.mif"
)
port map(
	CLK => CLK,
	data_in => data_in,
	data_out => data_out
);

data_in_gen: process is
begin
wait for 20 ns;
data_in <= to_sfixed(0.5, 1, -3);
wait;
end process;

CLK_gen: process is

begin
wait for 10 ns;
CLK <= not(CLK);

end process;



end Behavioral;
