LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY prio_encoder42 IS
   PORT (
      r : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      code : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      active : OUT STD_LOGIC
   );
END prio_encoder42;

ARCHITECTURE cond_arch OF prio_encoder42 IS
BEGIN
   code <= "11" WHEN (r(3) = '1') ELSE
      "10" WHEN (r(2) = '1') ELSE
      "01" WHEN (r(1) = '1') ELSE
      "00";
   active <= r(3) OR r(2) OR r(1) OR r(0);
END cond_arch;

ARCHITECTURE sel_arch OF prio_encoder42 IS
BEGIN
   WITH r SELECT
      code <= "11" WHEN "1000" | "1001" | "1010" | "1011" |
      "1100" | "1101" | "1110" | "1111",
      "10" WHEN "0100" | "0101" | "0110" | "0111",
      "01" WHEN "0010" | "0011",
      "00" WHEN OTHERS;
   active <= r(3) OR r(2) OR r(1) OR r(0);
END sel_arch;

ARCHITECTURE if_arch OF prio_encoder42 IS
BEGIN
   PROCESS (r)
   BEGIN
      IF (r(3) = '1') THEN
         code <= "11";
      ELSIF (r(2) = '1') THEN
         code <= "10";
      ELSIF (r(1) = '1') THEN
         code <= "01";
      ELSE
         code <= "00";
      END IF;
   END PROCESS;
   active <= r(3) OR r(2) OR r(1) OR r(0);
END if_arch;

ARCHITECTURE cascade_if_arch OF prio_encoder42 IS
BEGIN
   PROCESS (r)
   BEGIN
      code <= "00";
      IF (r(1) = '1') THEN
         code <= "01";
      END IF;
      IF (r(2) = '1') THEN
         code <= "10";
      END IF;
      IF (r(3) = '1') THEN
         code <= "11";
      END IF;
   END PROCESS;
   active <= r(3) OR r(2) OR r(1) OR r(0);
END cascade_if_arch;

ARCHITECTURE case_arch OF prio_encoder42 IS
BEGIN
   PROCESS (r)
   BEGIN
      CASE r IS
         WHEN "1000" | "1001" | "1010" | "1011" |
            "1100" | "1101" | "1110" | "1111" =>
            code <= "11";
         WHEN "0100" | "0101" | "0110" | "0111" =>
            code <= "10";
         WHEN "0010" | "0011" =>
            code <= "01";
         WHEN OTHERS =>
            code <= "00";
      END CASE;
   END PROCESS;
   active <= r(3) OR r(2) OR r(1) OR r(0);
END case_arch;