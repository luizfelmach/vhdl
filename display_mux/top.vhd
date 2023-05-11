LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY top IS
    PORT (
        clk : IN STD_LOGIC;
        sw : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        sseg : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        an : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
    );
END top;

ARCHITECTURE arch OF top IS
    SIGNAL led0, led1, led2, led3, led4, led5, led6, led7 : STD_LOGIC_VECTOR (7 DOWNTO 0);
BEGIN

    sseg_unit0 : ENTITY work.hex_to_sseg
        PORT MAP(
            hex => sw(3 DOWNTO 0),
            dp => '0',
            sseg => led0
        );

    sseg_unit1 : ENTITY work.hex_to_sseg
        PORT MAP(
            hex => sw(3 DOWNTO 0),
            dp => '0',
            sseg => led4
        );

    sseg_unit2 : ENTITY work.hex_to_sseg
        PORT MAP(
            hex => sw(7 DOWNTO 4),
            dp => '0',
            sseg => led1
        );

    sseg_unit3 : ENTITY work.hex_to_sseg
        PORT MAP(
            hex => sw(7 DOWNTO 4),
            dp => '0',
            sseg => led5
        );

    sseg_unit4 : ENTITY work.hex_to_sseg
        PORT MAP(
            hex => sw(11 DOWNTO 8),
            dp => '0',
            sseg => led2
        );

    sseg_unit5 : ENTITY work.hex_to_sseg
        PORT MAP(
            hex => sw(11 DOWNTO 8),
            dp => '0',
            sseg => led6
        );

    sseg_unit6 : ENTITY work.hex_to_sseg
        PORT MAP(
            hex => sw(15 DOWNTO 12),
            dp => '0',
            sseg => led3
        );

    sseg_unit7 : ENTITY work.hex_to_sseg
        PORT MAP(
            hex => sw(15 DOWNTO 12),
            dp => '0',
            sseg => led7
        );

    disp_unit : ENTITY work.led_mux8
        PORT MAP(
            clk => clk,
            reset => '0',
            in0 => led0,
            in1 => led1,
            in2 => led2,
            in3 => led3,
            in4 => led4,
            in5 => led5,
            in6 => led6,
            in7 => led7,
            an => an,
            sseg => sseg
        );
END arch;