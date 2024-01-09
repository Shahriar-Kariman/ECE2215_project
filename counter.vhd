  
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

      
ENTITY counter IS PORT (
  CLK					: IN STD_LOGIC;
  
  load_val			: in std_logic_vector(11 downto 0);
  reset, load, up	: in STD_LOGIC;
  q					: buffer STD_LOGIC_VECTOR(11 downto 0)
);
END counter;

ARCHITECTURE counter_arc OF counter IS
  
BEGIN
  PROCESS (CLK)  
    VARIABLE x: NATURAL range 0 to 3205 := 0;
    CONSTANT min: std_logic_vector := "000000000000";
    CONSTANT max: std_logic_vector := "110010000101";
  BEGIN
  IF RISING_EDGE(CLK) THEN
    IF (reset='1') THEN
      x := 0;
    ELSIF ((load='1') and ((load_val>=min) and (load_val<=max))) THEN
      x := to_integer(unsigned(load_val));
		
    ELSIF (up='1') THEN
      IF (x=3205) THEN
        x := 0;
      ELSE
        x := x+1;
      END IF;
		
    ELSE
      IF (x=0) THEN
        x := 3205;
      ELSE
        x := x-1;
      END IF;
    END IF;
	 
    q <= STD_LOGIC_VECTOR(TO_UNSIGNED(x, 12));
	 
  END IF;
  END PROCESS;
  
END counter_arc;