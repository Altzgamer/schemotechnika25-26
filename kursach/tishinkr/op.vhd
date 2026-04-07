------------------------------------------------------
-- LogiBLOX SYNC_RAM Module "op"
-- Created by LogiBLOX version E.30
--    on Mon Apr 06 12:28:28 2026
-- Attributes 
--    MODTYPE = SYNC_RAM
--    BUS_WIDTH = 8
--    DEPTH = 16
--    MEMFILE = OP
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

ENTITY op IS
  PORT(
    A: IN std_logic_vector(3 DOWNTO 0);
    DO: OUT std_logic_vector(7 DOWNTO 0);
    DI: IN std_logic_vector(7 DOWNTO 0);
    WR_EN: IN std_logic;
    WR_CLK: IN std_logic);
END op;

-- synopsys translate_off
ARCHITECTURE sim OF op IS
  SIGNAL START_PULSE: std_logic := '1';
  TYPE mem_data IS ARRAY (15 DOWNTO 0) OF std_logic_vector(7 DOWNTO 0);
BEGIN
  PROCESS
  VARIABLE VD: mem_data;
  VARIABLE first_time: BOOLEAN := TRUE;
  BEGIN
    IF (first_time) THEN
      VD(0) := ('0','0','0','0','0','0','0','0');
      VD(1) := ('0','0','0','0','0','0','0','0');
      VD(2) := ('0','0','0','0','0','0','0','0');
      VD(3) := ('0','0','0','0','0','0','0','0');
      VD(4) := ('0','0','0','0','0','0','0','0');
      VD(5) := ('0','0','0','0','0','0','0','0');
      VD(6) := ('0','0','0','0','0','0','0','0');
      VD(7) := ('0','0','0','0','0','0','0','0');
      VD(8) := ('0','0','0','0','0','0','0','0');
      VD(9) := ('0','0','0','0','0','0','0','0');
      VD(10) := ('0','0','0','0','0','0','0','0');
      VD(11) := ('0','0','0','0','0','0','0','0');
      VD(12) := ('0','0','0','0','0','0','0','0');
      VD(13) := ('0','0','0','0','0','0','0','0');
      VD(14) := ('0','0','0','0','0','0','0','0');
      VD(15) := ('0','0','0','0','0','0','0','0');
      first_time := FALSE;
    END IF;
    IF (WR_CLK'EVENT AND stdbit2mvl(WR_CLK)='1' AND stdbit2mvl(WR_CLK'LAST_VALUE)='0')
    AND (WR_EN='1') AND (NOT mvlvec_not01(A)) AND (mvlvec2int(A) < 16) THEN
      VD(mvlvec2int(A)) := stdvec2mvl(DI);
    END IF;
    IF (mvlvec_not01(A) OR
       (stdbit2mvl(WR_CLK) = 'X')
       OR (WR_CLK'EVENT AND stdbit2mvl(WR_CLK)='1' AND stdbit2mvl(WR_CLK'LAST_VALUE)='0'
           AND stdbit2mvl(WR_EN) = 'X' )
      ) THEN
        DO <= ('X','X','X','X','X','X','X','X');
    ELSIF (mvlvec2int(A) > 15) THEN
      ASSERT (FALSE)
      REPORT "The value on the address line is out of range"
      SEVERITY WARNING;
      DO <= ('X','X','X','X','X','X','X','X');
    ELSE
      DO <= VD(mvlvec2int(A));
    END IF;
      WAIT ON A, DI, WR_EN, WR_CLK, START_PULSE;
  END PROCESS;
END sim;
-- synopsys translate_on
