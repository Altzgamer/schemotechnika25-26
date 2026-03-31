library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Xilinx ADSU1-compatible interface:
-- ADD='1' : add, CI/CO active-HIGH (carry)
-- ADD='0' : subtract, CI/CO active-LOW (borrow)
entity adsu1 is
  port (
    A   : in  std_logic;
    B   : in  std_logic;
    CI  : in  std_logic;   -- carry in (ADD=1) / borrow in active-LOW (ADD=0)
    ADD : in  std_logic;   -- 1: add, 0: subtract
    S   : out std_logic;
    CO  : out std_logic;   -- carry out (ADD=1) / borrow out active-LOW (ADD=0)
    OFL : out std_logic    -- overflow flag (active-HIGH)
  );
end entity;

architecture rtl of adsu1 is
  signal sum    : std_logic;
  signal co_add : std_logic;

  signal bi     : std_logic;  -- internal borrow-in (active-high)
  signal bo     : std_logic;  -- internal borrow-out (active-high)

  signal co_int : std_logic;  -- what we will drive to CO (mode-dependent)
begin
  process(A, B, CI, ADD)
  begin
    if ADD = '1' then
      -- ADD: normal full adder
      sum    <= A xor B xor CI;
      co_add <= (A and B) or (A and CI) or (B and CI);

      S      <= sum;
      co_int <= co_add;

    else
      -- SUB: A - B - bi, where external CI is active-LOW => bi = not CI
      bi <= not CI;

      sum <= A xor B xor bi;

      -- bo = (~A & (B | bi)) | (B & bi)
      bo <= ((not A) and (B or bi)) or (B and bi);

      S      <= sum;
      co_int <= not bo;  -- external CO is active-LOW in subtract mode
    end if;
  end process;

  CO  <= co_int;

  -- Signed overflow for MSB stage:
  -- Works because in SUB mode both CI and CO are inverted (active-LOW),
  -- and (not CI) xor (not CO) == CI xor CO.
  OFL <= CI xor co_int;

end architecture rtl;

