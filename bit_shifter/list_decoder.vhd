LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decoder4 IS
   PORT (
      s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      x : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
   );
END decoder4;

ARCHITECTURE cond_arch OF decoder4 IS
BEGIN
   x <= "0001" WHEN s = "00" ELSE
      "0010" WHEN s = "01" ELSE
      "0100" WHEN s = "10" ELSE
      "1000";
END cond_arch;

ARCHITECTURE sel_arch OF decoder4 IS
BEGIN
   WITH s SELECT
      x <= "0001" WHEN "00",
      "0010" WHEN "01",
      "0100" WHEN "10",
      "1000" WHEN OTHERS;
END sel_arch;

ARCHITECTURE if_arch OF decoder4 IS
BEGIN
   PROCESS (s)
   BEGIN
      IF (s = "00") THEN
         x <= "0001";
      ELSIF (s = "01") THEN
         x <= "0010";
      ELSIF (s = "10") THEN
         x <= "0100";
      ELSE
         x <= "1000";
      END IF;
   END PROCESS;
END if_arch;

ARCHITECTURE case_arch OF decoder4 IS
BEGIN
   PROCESS (s)
   BEGIN
      CASE s IS
         WHEN "00" =>
            x <= "0001";
         WHEN "01" =>
            x <= "0010";
         WHEN "10" =>
            x <= "0100";
         WHEN OTHERS =>
            x <= "1000";
      END CASE;
   END PROCESS;
END case_arch;