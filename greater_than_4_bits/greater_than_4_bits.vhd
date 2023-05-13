LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY greater_than_4_bits IS
    PORT (
        a, b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        o : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE arch OF greater_than_4_bits IS
    SIGNAL p3, p2, p1, p0 : STD_LOGIC;
    SIGNAL e3, e2, e1 : STD_LOGIC;
BEGIN
    o <= p3 OR p2 OR p1 OR p0;

    e3 <= (a(3) XNOR b(3));
    e2 <= (a(2) XNOR b(2));
    e1 <= (a(1) XNOR b(1));

    p3 <= (a(3) AND (NOT b(3)));
    p2 <= e3 AND (a(2) AND (NOT b(2)));
    p1 <= e3 AND e2 AND (a(1) AND (NOT b(1)));
    p0 <= e3 AND e2 AND e1 AND (a(0) AND (NOT b(0)));

END ARCHITECTURE;