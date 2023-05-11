
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux2_1_1bit IS
    PORT (
        i0 : IN STD_LOGIC;
        i1 : IN STD_LOGIC;
        sel : IN STD_LOGIC;
        y : OUT STD_LOGIC);
END mux2_1_1bit;

ARCHITECTURE cond_arch OF mux2_1_1bit IS
BEGIN
    y <= i0 WHEN sel = '0' ELSE
        i1;
END cond_arch;