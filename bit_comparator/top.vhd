LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY top IS
    PORT (
        sw : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4 switches
        led : OUT STD_LOGIC_VECTOR(0 DOWNTO 0) -- 1 red LED
    );
END top;

ARCHITECTURE arch OF top IS
BEGIN
    -- instantiate 2-bit comparator
    eq2_unit : ENTITY work.eq2(struc_arch)
        PORT MAP(
            a => sw(3 DOWNTO 2),
            b => sw(1 DOWNTO 0),
            aeqb => led(0)
        );
END arch;