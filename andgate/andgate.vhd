LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY andgate IS
    PORT (
        a, b : IN STD_LOGIC;
        o : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE arch OF andgate IS
BEGIN
    o <= a AND b;
END ARCHITECTURE;