LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4 IS
   PORT (
      a, b, c, d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      x : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
   );
END mux4;

ARCHITECTURE cond_arch OF mux4 IS
BEGIN
   x <= a WHEN (s = "00") ELSE
      b WHEN (s = "01") ELSE
      c WHEN (s = "10") ELSE
      d;
END cond_arch;

ARCHITECTURE sel_arch OF mux4 IS
BEGIN
   WITH s SELECT
      x <= a WHEN "00",
      b WHEN "01",
      c WHEN "10",
      d WHEN OTHERS;
END sel_arch;

ARCHITECTURE if_arch OF mux4 IS
BEGIN
   PROCESS (a, b, c, d, s)
   BEGIN
      IF (s = "00") THEN
         x <= a;
      ELSIF (s = "01") THEN
         x <= b;
      ELSIF (s = "10") THEN
         x <= c;
      ELSE
         x <= d;
      END IF;
   END PROCESS;
END if_arch;

ARCHITECTURE case_arch OF mux4 IS
BEGIN
   PROCESS (a, b, c, d, s)
   BEGIN
      CASE s IS
         WHEN "00" =>
            x <= a;
         WHEN "01" =>
            x <= b;
         WHEN "10" =>
            x <= c;
         WHEN OTHERS =>
            x <= d;
      END CASE;
   END PROCESS;
END case_arch;