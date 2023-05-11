LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY demux1_2 IS
    PORT (
        i : IN STD_LOGIC;
        sel : IN STD_LOGIC;
        y : OUT STD_LOGIC_VECTOR (1 DOWNTO 0));
END demux1_2;

ARCHITECTURE Behavioral OF demux1_2 IS

BEGIN
    y <= '0' & i WHEN sel = '0' ELSE
        i & '0';

END Behavioral;