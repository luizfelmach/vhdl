LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decoder4en IS
   PORT (
      s : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      enable : IN STD_LOGIC;
      x : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
   );
END decoder4en;

ARCHITECTURE cond_arch OF decoder4en IS
BEGIN
   x <= "0000" WHEN enable = '0' ELSE
      "0001" WHEN s = "00" ELSE
      "0010" WHEN s = "01" ELSE
      "0100" WHEN s = "10" ELSE
      "1000";
END cond_arch;