library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
use work.project_package.all;

entity ECE2215_project is port(
	CLK						: IN STD_LOGIC;
	load_val				: in std_logic_vector(11 downto 0);
	reset, load, up			: in STD_LOGIC;
	radix_15				: out STD_LOGIC_VECTOR(11 downto 0)
);
end ECE2215_project;

architecture project_arc of ECE2215_project is
	signal counter_out:	STD_LOGIC_VECTOR(11 downto 0);
	signal clock:			std_logic;
begin
	
	stage0: clk_gen_1_output port map(CLK, clock);
	
	stage1: counter port map(clock, load_val, reset, load, up, counter_out);
	stage2: binary_to_b15 port map(counter_out, radix_15);
	
end project_arc;