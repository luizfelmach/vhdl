LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder_4_bits_tb IS
END ENTITY;

ARCHITECTURE arch OF adder_4_bits_tb IS
    SIGNAL co, ci : STD_LOGIC;
    SIGNAL n1, n2, output : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN

    adder_4_bits_inst : ENTITY work.adder_4_bits
        PORT MAP(
            n1 => n1,
            n2 => n2,
            ci => ci,
            co => co,
            output => output
        );

    PROCESS BEGIN
        ci <= '0';

        n1 <= "0000";
        n2 <= "0000";
        WAIT FOR 1 ns;

        n1 <= "0001";
        n2 <= "0000";
        WAIT FOR 1 ns;

        n1 <= "0001";
        n2 <= "0001";
        WAIT FOR 1 ns;

        n1 <= "0001";
        n2 <= "0011";
        WAIT FOR 1 ns;

        n1 <= "0100";
        n2 <= "0011";
        WAIT FOR 1 ns;

        n2 <= "0010";
        n1 <= "0101";
        WAIT FOR 1 ns;

        n1 <= "0101";
        n2 <= "1110";
        WAIT FOR 1 ns;

        n1 <= "1111";
        n2 <= "1111";
        WAIT FOR 1 ns;

        ASSERT false REPORT "Reached end of test.";
        WAIT;
    END PROCESS;

END ARCHITECTURE;