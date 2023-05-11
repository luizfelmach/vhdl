LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY hex_to_sseg IS
    PORT (
        hex : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        dp : IN STD_LOGIC;
        sseg : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END hex_to_sseg;

ARCHITECTURE arch OF hex_to_sseg IS
BEGIN
    WITH hex SELECT
        sseg(6 DOWNTO 0) <=
        "1000000" WHEN "0000",
        "1111001" WHEN "0001",
        "0100100" WHEN "0010",
        "0110000" WHEN "0011",
        "0011001" WHEN "0100",
        "0010010" WHEN "0101",
        "0000010" WHEN "0110",
        "1111000" WHEN "0111",
        "0000000" WHEN "1000",
        "0010000" WHEN "1001",
        "0001000" WHEN "1010", --a
        "0000011" WHEN "1011", --b
        "1000110" WHEN "1100", --c
        "0100001" WHEN "1101", --d
        "0000110" WHEN "1110", --e
        "0001110" WHEN OTHERS; --f
    sseg(7) <= dp;
END arch;