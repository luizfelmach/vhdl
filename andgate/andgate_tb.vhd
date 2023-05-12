LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY andgate_tb IS
END ENTITY;

ARCHITECTURE arch OF andgate_tb IS
    SIGNAL a, b, o : STD_LOGIC;
BEGIN

    andgate_inst : ENTITY work.andgate
        PORT MAP(
            a => a,
            b => b,
            o => o
        );

    PROCESS BEGIN
        a <= '0';
        b <= '0';
        WAIT FOR 1 ns;

        a <= '1';
        b <= '0';
        WAIT FOR 1 ns;

        a <= '0';
        b <= '1';
        WAIT FOR 1 ns;

        a <= '1';
        b <= '1';
        WAIT FOR 1 ns;

        ASSERT false REPORT "Reached end of test";
        WAIT;
    END PROCESS;

END ARCHITECTURE;