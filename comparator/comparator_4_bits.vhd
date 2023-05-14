LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY comparator_4_bits IS
    PORT (
        a, b : STD_LOGIC_VECTOR(3 DOWNTO 0);
        equals, greater, smaller : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE arch OF comparator_4_bits IS
    SIGNAL e3, e2, e1, e0 : STD_LOGIC;
    SIGNAL g3, g2, g1, g0 : STD_LOGIC;
    SIGNAL s3, s2, s1, s0 : STD_LOGIC;
BEGIN
    equals <= e3 AND e2 AND e1 AND e0;
    greater <= g3 OR (e3 AND g2) OR (e3 AND e2 AND g1) OR (e3 AND e2 AND e1 AND g0);
    smaller <= s3 OR (e3 AND s2) OR (e3 AND e2 AND s1) OR (e3 AND e2 AND e1 AND s0);

    e3 <= (a(3) XNOR b(3));
    e2 <= (a(2) XNOR b(2));
    e1 <= (a(1) XNOR b(1));
    e0 <= (a(0) XNOR b(0));

    g3 <= (a(3)) AND (NOT b(3));
    g2 <= (a(2)) AND (NOT b(2));
    g1 <= (a(1)) AND (NOT b(1));
    g0 <= (a(0)) AND (NOT b(0));

    s3 <= (NOT a(3)) AND (b(3));
    s2 <= (NOT a(2)) AND (b(2));
    s1 <= (NOT a(1)) AND (b(1));
    s0 <= (NOT a(0)) AND (b(0));

END ARCHITECTURE;