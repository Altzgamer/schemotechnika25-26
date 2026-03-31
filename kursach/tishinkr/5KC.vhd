library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ks5_flag is
  port (
    R0: in std_logic; -- magnitude bit0 (LSB)
    R1: in std_logic; -- magnitude bit1
    R2: in std_logic; -- magnitude bit2 (MSB of magnitude)
    R3: in std_logic; -- sign bit
    F5: in std_logic; -- overflow flag
    P0: out std_logic; -- code bit0 (LSB)
    P1: out std_logic  -- code bit1 (MSB)
  );
end entity ks5_flag;

architecture rtl of ks5_flag is
  signal mag_zero : std_logic;
begin
  -- magnitude == 000  (covers -0 too)
  mag_zero <= (not R2) and (not R1) and (not R0);

  -- Priority: overflow > zero > negative > positive
  P1 <= '1' when F5 = '1' else
        '0' when mag_zero = '1' else
        '0' when R3 = '1' else
        '1';

  P0 <= '1' when F5 = '1' else
        '0' when mag_zero = '1' else
        '1' when R3 = '1' else
        '0';
end architecture rtl;

