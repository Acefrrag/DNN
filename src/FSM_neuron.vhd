----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Michele Pio Fragasso 
-- 
-- Create Date: 03/20/2022 04:04:40 PM
-- Design Name: 
-- Module Name: FSM_neuron - Behavioral
-- Project Name: DNN
-- Target Devices: 
-- Tool Versions: 
-- Description: FSM to control the pipelined neuron.
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


entity FSM_neuron is
generic (
rom_depth: natural := 3);--the number of summations in the weighted sum will be 16-1=15

port(clk: in std_logic;
    addr_TC: in std_logic; --This bit indicates if we are feeding the neuron with the last input
    input_valid: in std_logic;
    sum_reg_rst: out std_logic; --This bit resets the weighted sum register
    mul_sel: out std_logic;
    out_v: out std_logic;
    update_out: out std_logic); --This update the output of the neuron, since it is necessary to  
end FSM_neuron;

architecture Behavioral of FSM_neuron is
--Declarative Part
type neuron_state is (idle, w_sum, b_sum, act_log, finished);
signal pr_state, nx_state: neuron_state := idle;

begin
    state_reg: process(clk)
    begin
        if rising_edge(clk) then
            pr_state <= nx_state;
        end if;
    end process state_reg;
    
    output: process(all)
    --Outputs of this FSM are:
    --mul_sel: Multièlexer Selector: to select between weighted sum or bias
    --out_v: Output Data Valid: to aknowledge the data coming out the neruon is ready
    --sum_reg_rst: To reset the weighted sum register
    begin
    case pr_state is
        when idle =>
            mul_sel <= '0';
            out_v <= '0';
            sum_reg_rst <= '1';
            update_out <= '0';            
        when w_sum =>
            mul_sel <= '0';
            out_v <= '0';
            sum_reg_rst <= '0';
            update_out <= '0';
        when b_sum =>
            mul_sel <= '1';
            out_v <= '0';
            sum_reg_rst <= '0';
            update_out <= '0';        
        when act_log =>
            mul_sel <= '0';
            out_v <= '0';
            sum_reg_rst <= '0';
            update_out <= '0';
        when finished =>
            mul_sel <= '0';
            out_v <= '1';
            sum_reg_rst <= '0';
            update_out <= '1';
    end case;
    end process output;
    
    next_state: process(all)
    begin
    --default state
    nx_state <= idle;
    case pr_state is
        when idle =>
            --next
            if input_valid = '1' then
                nx_state <= w_sum;
            else
                nx_state <= idle;
            end if;
        when w_sum =>
            if addr_TC = '1' then --we stopped feeding inputs
                  nx_state <= b_sum;
            else
                  nx_state <= w_sum;
            end if;
        when b_sum =>
            nx_state <= act_log;
        when act_log =>
            nx_state <= finished;
        when finished =>
            nx_state <= idle;
    end case;        
    end process next_state;
end Behavioral;
