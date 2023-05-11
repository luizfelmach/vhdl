LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY shift3mode IS
   PORT (
      a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      lar : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      amt : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
   );
END shift3mode;

ARCHITECTURE direct_arch OF shift3mode IS
   SIGNAL logic_result, arith_result, rot_result :
   STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
   WITH amt SELECT
      rot_result <=
      a WHEN "000",
      a(0) & a(7 DOWNTO 1) WHEN "001",
      a(1 DOWNTO 0) & a(7 DOWNTO 2) WHEN "010",
      a(2 DOWNTO 0) & a(7 DOWNTO 3) WHEN "011",
      a(3 DOWNTO 0) & a(7 DOWNTO 4) WHEN "100",
      a(4 DOWNTO 0) & a(7 DOWNTO 5) WHEN "101",
      a(5 DOWNTO 0) & a(7 DOWNTO 6) WHEN "110",
      a(6 DOWNTO 0) & a(7) WHEN OTHERS; -- 111
   WITH amt SELECT
      logic_result <=
      a WHEN "000",
      "0" & a(7 DOWNTO 1) WHEN "001",
      "00" & a(7 DOWNTO 2) WHEN "010",
      "000" & a(7 DOWNTO 3) WHEN "011",
      "0000" & a(7 DOWNTO 4) WHEN "100",
      "00000" & a(7 DOWNTO 5) WHEN "101",
      "000000" & a(7 DOWNTO 6) WHEN "110",
      "0000000" & a(7) WHEN OTHERS; -- 111
   WITH amt SELECT
      arith_result <=
      a WHEN "000",
      a(7) & a(7 DOWNTO 1) WHEN "001",
      a(7) & a(7) & a(7 DOWNTO 2) WHEN "010",
      a(7) & a(7) & a(7) & a(7 DOWNTO 3) WHEN "011",
      a(7) & a(7) & a(7) & a(7) &
      a(7 DOWNTO 4) WHEN "100",
      a(7) & a(7) & a(7) & a(7) & a(7) &
      a(7 DOWNTO 5) WHEN "101",
      a(7) & a(7) & a(7) & a(7) & a(7) & a(7) &
      a(7 DOWNTO 6) WHEN "110",
      a(7) & a(7) & a(7) & a(7) & a(7) & a(7) & a(7) &
      a(7) WHEN OTHERS;
   WITH lar SELECT
      y <= logic_result WHEN "00",
      arith_result WHEN "01",
      rot_result WHEN OTHERS;
END direct_arch;

ARCHITECTURE shared_arch OF shift3mode IS
   SIGNAL shift_in : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
   WITH lar SELECT
      shift_in <= (OTHERS => '0') WHEN "00",
      (OTHERS => a(7)) WHEN "01",
      a WHEN OTHERS;
   WITH amt SELECT
      y <= a WHEN "000",
      shift_in(0) & a(7 DOWNTO 1) WHEN "001",
      shift_in(1 DOWNTO 0) & a(7 DOWNTO 2) WHEN "010",
      shift_in(2 DOWNTO 0) & a(7 DOWNTO 3) WHEN "011",
      shift_in(3 DOWNTO 0) & a(7 DOWNTO 4) WHEN "100",
      shift_in(4 DOWNTO 0) & a(7 DOWNTO 5) WHEN "101",
      shift_in(5 DOWNTO 0) & a(7 DOWNTO 6) WHEN "110",
      shift_in(6 DOWNTO 0) & a(7) WHEN OTHERS;
END shared_arch;