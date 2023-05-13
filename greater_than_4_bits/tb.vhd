LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb IS
END ENTITY;

ARCHITECTURE arch OF tb IS
    SIGNAL n1, n2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL o : STD_LOGIC;
BEGIN
    greater_than_4_bits_inst : ENTITY work.greater_than_4_bits
        PORT MAP(
            a => n1,
            b => n2,
            o => o
        );

    PROCESS BEGIN
        n1 <= "0011";

        n2 <= "0000";
        WAIT FOR 1 ns;

        n2 <= "0001";
        WAIT FOR 1 ns;

        n2 <= "0010";
        WAIT FOR 1 ns;

        n2 <= "0011";
        WAIT FOR 1 ns;

        n2 <= "0100";
        WAIT FOR 1 ns;

        n2 <= "1110";
        WAIT FOR 1 ns;

        n2 <= "1111";
        WAIT FOR 1 ns;

        ASSERT false REPORT "Reached end of test";
        WAIT;
    END PROCESS;
END ARCHITECTURE;