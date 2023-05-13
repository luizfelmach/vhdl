LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY adder_sub IS
    PORT (
        n1, n2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        sub : IN STD_LOGIC;
        co : OUT STD_LOGIC;
        output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE arch OF adder_sub IS
    SIGNAL p2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN

    p2 <= n2 WHEN sub = '0' ELSE
        NOT n2;

    adder_4_bits_inst : ENTITY work.adder_4_bits
        PORT MAP(
            n1 => n1,
            n2 => p2,
            ci => sub,
            co => co,
            output => output
        );

END ARCHITECTURE;