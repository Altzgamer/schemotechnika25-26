library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sub_ctrl is
  port (
    A: in std_logic_vector(3 downto 0);
    B: in std_logic_vector(3 downto 0);
    Y: in std_logic;  -- 0: multiply, 1: subtract (B - A)
    F3: out std_logic;  -- 1: ADD, 0: SUB (for magnitudes)
    F4: out std_logic   -- swap magnitudes at adder inputs
  );
end entity;

architecture rtl of sub_ctrl is
  signal signs_diff: std_logic;
  signal AgtB: std_logic;
begin
  signs_diff <= A(3) xor B(3);

  -- Mode for magnitude adder:
  -- multiply -> always ADD
  -- subtract (B-A): if signs differ -> ADD mags, else SUB mags
  F3 <= (not Y) or signs_diff;

  -- |A| > |B|  compare of magnitudes A(2:0) and B(2:0)
  AgtB <= (A(2) and not B(2)) or
          ((not (A(2) xor B(2))) and A(1) and not B(1)) or
          ((not (A(2) xor B(2))) and (not (A(1) xor B(1))) and A(0) and not B(0));

  -- swap only when subtracting and signs are equal and |A|>|B|
  F4 <= Y and (not signs_diff) and AgtB;
end architecture;

