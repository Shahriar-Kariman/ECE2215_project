## Base 15 Counter
In this project I made a circuit that takes in 5 inputs and acts as a  counter that counts up and down on a loop from 0 to 3205 or the other way. The counter has a 12 bit vector that using a Hex display displays the current number in base 15.
The counter can also load a value inputed and rest as well.
### Code Structure
The top level design file in this project is described in the ECE2215_project.vhd file, in it I am using clk_gen_1_output.VHD to change the frequency of the clock on the board to be slower so I could see the number changing on the display.
After the clock issue is addressed I used the counter componenet I made to count in binary and then transformed it to radix 15 in binary_to_b15.vhd.

**Note**: If you are trying to run a simulation on this please remember to comment out stage 0 to return the clock to its normal cycle.