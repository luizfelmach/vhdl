LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adder_4_bits IS
    PORT (
        n1, n2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        ci : IN STD_LOGIC;
        co : OUT STD_LOGIC;
        output : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE arch OF adder_4_bits IS
    SIGNAL co2, co1, co0 : STD_LOGIC;
BEGIN
    adder_inst0 : ENTITY work.full_adder
        PORT MAP(
            a => n1(0),
            b => n2(0),
            ci => ci,
            co => co0,
            s => output(0)
        );

    adder_inst1 : ENTITY work.full_adder
        PORT MAP(
            a => n1(1),
            b => n2(1),
            ci => co0,
            co => co1,
            s => output(1)
        );

    adder_inst2 : ENTITY work.full_adder
        PORT MAP(
            a => n1(2),
            b => n2(2),
            ci => co1,
            co => co2,
            s => output(2)
        );

    adder_inst3 : ENTITY work.full_adder
        PORT MAP(
            a => n1(3),
            b => n2(3),
            ci => co2,
            co => co,
            s => output(3)
        );

END ARCHITECTURE;