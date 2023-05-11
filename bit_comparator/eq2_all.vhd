LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eq2 IS
   PORT (
      a, b : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      aeqb : OUT STD_LOGIC
   );
END eq2;

ARCHITECTURE sop_arch OF eq2 IS
   SIGNAL p0, p1, p2, p3 : STD_LOGIC;
BEGIN
   -- sum of product terms
   aeqb <= p0 OR p1 OR p2 OR p3;
   -- product terms
   p0 <= ((NOT a(1)) AND (NOT b(1))) AND
      ((NOT a(0)) AND (NOT b(0)));
   p1 <= ((NOT a(1)) AND (NOT b(1))) AND (a(0) AND b(0));
   p2 <= (a(1) AND b(1)) AND ((NOT a(0)) AND (NOT b(0)));
   p3 <= (a(1) AND b(1)) AND (a(0) AND b(0));
END sop_arch;

ARCHITECTURE struc_arch OF eq2 IS
   SIGNAL e0, e1 : STD_LOGIC;
BEGIN
   -- instantiate two 1-bit comparators
   eq_bit0_unit : ENTITY work.eq1(sop_arch)
      PORT MAP(i0 => a(0), i1 => b(0), eq => e0);
   eq_bit1_unit : ENTITY work.eq1(sop_arch)
      PORT MAP(i0 => a(1), i1 => b(1), eq => e1);
   -- a and b are equal if individual bits are equal
   aeqb <= e0 AND e1;
END struc_arch;

ARCHITECTURE vhd_87_arch OF eq2 IS
   -- component declaration
   COMPONENT eq1
      PORT (
         i0, i1 : IN STD_LOGIC;
         eq : OUT STD_LOGIC
      );
   END COMPONENT;
   SIGNAL e0, e1 : STD_LOGIC;
BEGIN
   -- instantiate two 1-bit comparators
   eq_bit0_unit : eq1 -- use the declared name, eq1
   PORT MAP(i0 => a(0), i1 => b(0), eq => e0);
   eq_bit1_unit : eq1 -- use the declared name, eq1
   PORT MAP(i0 => a(1), i1 => b(1), eq => e1);
   -- a and b are equal if individual bits are equal
   aeqb <= e0 AND e1;
END vhd_87_arch;