LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY comparator_4_bits_tb IS
END ENTITY;

ARCHITECTURE arch OF comparator_4_bits_tb IS
    SIGNAL a, b : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL equals, greater, smaller : STD_LOGIC;
BEGIN
    comparator_4_bits_inst : ENTITY work.comparator_4_bits
        PORT MAP(
            a => a,
            b => b,
            equals => equals,
            greater => greater,
            smaller => smaller
        );

    PROCESS BEGIN
        a <= "0000";
        b <= "0000";
        WAIT FOR 1 ns;

        a <= "0001";
        b <= "0000";
        WAIT FOR 1 ns;

        a <= "0000";
        b <= "0001";
        WAIT FOR 1 ns;

        a <= "0100";
        b <= "0110";
        WAIT FOR 1 ns;

        a <= "0110";
        b <= "0100";
        WAIT FOR 1 ns;

        a <= "1111";
        b <= "1111";
        WAIT FOR 1 ns;

        a <= "1111";
        b <= "1110";
        WAIT FOR 1 ns;

        a <= "1110";
        b <= "1111";
        WAIT FOR 1 ns;

        a <= "1111";
        b <= "0000";
        WAIT FOR 1 ns;

        a <= "0000";
        b <= "1111";
        WAIT FOR 1 ns;

        ASSERT false REPORT "Reached end of test.";
        WAIT;
    END PROCESS;
END ARCHITECTURE;