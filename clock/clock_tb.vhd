LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY clock_tb IS
END ENTITY;

ARCHITECTURE arch OF clock_tb IS
    SIGNAL clk : STD_LOGIC := '0';
BEGIN

    PROCESS BEGIN
        clk <= '1';
        WAIT FOR 1 ns;

        clk <= '0';
        WAIT FOR 1 ns;
    END PROCESS;

END ARCHITECTURE;