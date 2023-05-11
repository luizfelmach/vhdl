LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eq1 IS
   PORT (
      i0, i1 : IN STD_LOGIC;
      eq : OUT STD_LOGIC
   );
END eq1;

ARCHITECTURE sop_arch OF eq1 IS
   SIGNAL p0, p1 : STD_LOGIC;
BEGIN
   -- sum of two product terms
   eq <= p0 OR p1;
   -- product terms
   p0 <= (NOT i0) AND (NOT i1);
   p1 <= i0 AND i1;
END sop_arch;