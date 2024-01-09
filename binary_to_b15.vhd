  
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all; 

      
ENTITY binary_to_b15 IS
PORT (
  binary: in STD_LOGIC_VECTOR(11 downto 0);
  radix_15: out STD_LOGIC_VECTOR(11 downto 0)
);
END binary_to_b15;

ARCHITECTURE BEHAVIORAL OF binary_to_b15 IS

  SIGNAL p2: NATURAL range 0 to 14;
  SIGNAL p1: NATURAL range 0 to 14;
  SIGNAL p0: NATURAL range 0 to 14;
  
BEGIN

  PROCESS (binary, p2, p1, p0)  
    VARIABLE x: NATURAL range 0 to 3205;
  BEGIN
    x := TO_INTEGER(UNSIGNED(binary));
    p2 <= x/225;
    x := x-p2*225;
    p1 <= x/15;
    x := x-p1*15;
    p0 <= x;
  END PROCESS;
  --#SetIOVoltage
  radix_15(11 downto 8) <= STD_LOGIC_VECTOR(TO_UNSIGNED(p2, 4));
  radix_15(7 downto 4) <= STD_LOGIC_VECTOR(TO_UNSIGNED(p1, 4));
  radix_15(3 downto 0) <= STD_LOGIC_VECTOR(TO_UNSIGNED(p0, 4));
  
END BEHAVIORAL;