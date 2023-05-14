LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_tb IS
END ENTITY;

ARCHITECTURE arch OF full_adder_tb IS
    SIGNAL a, b : STD_LOGIC;
    SIGNAL ci : STD_LOGIC;
    SIGNAL co : STD_LOGIC;
    SIGNAL s : STD_LOGIC;
BEGIN
    adder_inst : ENTITY work.full_adder
        PORT MAP(
            a => a,
            b => b,
            ci => ci,
            co => co,
            s => s
        );

    PROCESS BEGIN
        ci <= '0';

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

        ASSERT false REPORT "Reached end of test.";
        WAIT;
    END PROCESS;
END ARCHITECTURE;