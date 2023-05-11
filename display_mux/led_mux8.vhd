LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY led_mux8 IS
    PORT (
        clk, reset : IN STD_LOGIC;
        in3, in2, in1, in0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        in7, in6, in5, in4 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        an : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        sseg : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END led_mux8;

ARCHITECTURE arch OF led_mux8 IS
    -- refreshing rate around 1600 Hz (100MHz/2^16)
    CONSTANT N : INTEGER := 18;
    SIGNAL q_reg, q_next : unsigned(N - 1 DOWNTO 0);
    SIGNAL sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
    -- register
    PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN
            q_reg <= (OTHERS => '0');
        ELSIF (clk'event AND clk = '1') THEN
            q_reg <= q_next;
        END IF;
    END PROCESS;
    -- next-state logic for the counter
    q_next <= q_reg + 1;
    -- 3 MSBs of counter to control 8-to-1 multiplexing
    -- and to generate active-low enable signal
    sel <= STD_LOGIC_VECTOR(q_reg(N - 1 DOWNTO N - 3));
    PROCESS (sel, in0, in1, in2, in3, in4, in5, in6, in7)
    BEGIN
        CASE sel IS
            WHEN "000" =>
                an <= "11111110";
                sseg <= in0;
            WHEN "001" =>
                an <= "11111101";
                sseg <= in1;
            WHEN "010" =>
                an <= "11111011";
                sseg <= in2;
            WHEN "011" =>
                an <= "11110111";
                sseg <= in3;
            WHEN "100" =>
                an <= "11101111";
                sseg <= in4;
            WHEN "101" =>
                an <= "11011111";
                sseg <= in5;
            WHEN "110" =>
                an <= "10111111";
                sseg <= in6;
            WHEN OTHERS =>
                an <= "01111111";
                sseg <= in7;
        END CASE;
    END PROCESS;
END arch;