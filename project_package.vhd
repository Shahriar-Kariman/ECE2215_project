library ieee;
use ieee.std_logic_1164.all;

package project_package is
	
	component clk_gen_1_output is port(
		Clock	: in  std_logic;
		c_out	: out std_logic
	);
	end component;
	
	component counter IS PORT (
		CLK					: IN STD_LOGIC;
		
		load_val				: in std_logic_vector(11 downto 0);
		reset, load, up	: in STD_LOGIC;
		q						: buffer STD_LOGIC_VECTOR(11 downto 0)
	);
	END component;
	
	component binary_to_b15 IS
	PORT (
		binary	: in STD_LOGIC_VECTOR(11 downto 0);
		radix_15	: out STD_LOGIC_VECTOR(11 downto 0)
	);
	END component;
	
end project_package;