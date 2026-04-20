------------------------------------------------------
-- LogiBLOX ROM Module "rom"
-- Created by LogiBLOX version E.30
--    on Mon Apr 20 04:30:00 2026
-- Attributes 
--    MODTYPE = ROM
--    BUS_WIDTH = 20
--    DEPTH = 16
--    MEMFILE = ROM
--    STYLE = MAX_SPEED
--    USE_RPM = FALSE
------------------------------------------------------
-- This is a behaviorial model only and cannot be synthesized.
------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- synopsys translate_off
LIBRARY logiblox;
USE logiblox.mvlutil.ALL;
USE logiblox.mvlarith.ALL;
USE logiblox.logiblox.ALL;
-- synopsys translate_on

ENTITY rom IS
  PORT(
    A: IN std_logic_vector(3 DOWNTO 0);
    DO: OUT std_logic_vector(19 DOWNTO 0));
END rom;

-- synopsys translate_off
ARCHITECTURE sim OF rom IS
  SIGNAL START_PULSE: std_logic := '1';
  TYPE mem_data IS ARRAY (15 DOWNTO 0) OF std_logic_vector(19 DOWNTO 0);
BEGIN
  PROCESS
  VARIABLE VD: mem_data;
  VARIABLE first_time: BOOLEAN := TRUE;
  BEGIN
    IF (first_time) THEN
      VD(0) := ('0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','1','0');
      VD(1) := ('1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
      VD(2) := ('1','0','1','0','1','0','0','0','0','0','0','0','1','0','0','0','0','1','0','0');
      VD(3) := ('0','0','0','0','0','0','0','0','0','0','1','0','0','0','1','0','0','0','0','0');
      VD(4) := ('0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0');
      VD(5) := ('0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','1','0','0','0','0');
      VD(6) := ('0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','1');
      VD(7) := ('1','1','0','1','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
      VD(8) := ('0','0','0','0','1','1','1','0','0','0','0','0','0','0','0','1','1','0','0','0');
      VD(9) := ('1','0','0','1','1','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0');
      VD(10) := ('1','1','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0');
      VD(11) := ('0','0','0','0','1','1','1','0','0','0','0','0','1','0','0','0','0','0','0','0');
      VD(12) := ('0','0','0','0','1','1','1','0','0','0','0','0','0','1','0','0','0','0','0','0');
      VD(13) := ('0','0','0','0','1','1','1','1','1','0','0','0','0','0','1','0','0','0','0','0');
      VD(14) := ('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
      VD(15) := ('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
      first_time := FALSE;
    END IF;
    IF (mvlvec_not01(A)) THEN
      DO <= ('X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X');
    ELSIF (mvlvec2int(A) > 15) THEN
      ASSERT (FALSE)
      REPORT "The value on the address line is out of range"
      SEVERITY WARNING;
      DO <= ('X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X','X');
    ELSE
      DO <= VD(mvlvec2int(A));
    END IF;
      WAIT ON A, START_PULSE;
  END PROCESS;
END sim;
-- synopsys translate_on
