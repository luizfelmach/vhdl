LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY codificador4_2 IS
        PORT (
                x : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                y : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                Active : OUT STD_LOGIC);
END codificador4_2;

ARCHITECTURE cond_arch OF codificador4_2 IS

BEGIN
        Active <= '0' WHEN x = "0000" ELSE
                '1';
        y <= "11" WHEN x = "1000" ELSE
                "10" WHEN x = "0100" ELSE
                "01" WHEN x = "0010" ELSE
                "00"; --x = "0001" ou x = "0000"
END cond_arch;