LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY adder IS
    PORT (
        a, b : IN STD_LOGIC;
        ci : IN STD_LOGIC;
        co : OUT STD_LOGIC;
        s : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE arch OF adder IS
BEGIN
    s <= a XNOR b XNOR ci;
    co <= (a AND b) OR (a AND ci) OR (b AND ci);
END ARCHITECTURE;