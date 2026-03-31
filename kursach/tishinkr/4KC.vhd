library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sign_ctrl is
  port (
    A: in  std_logic_vector(3 downto 0);
    B: in  std_logic_vector(3 downto 0);
    Y: in  std_logic;  -- 0: multiply, 1: subtract (B - A)
    F4: in  std_logic;  -- swap flag from sub_ctrl
    F2: out std_logic  -- result sign
  );
end entity;

architecture rtl of sign_ctrl is
  signal signs_diff : std_logic;
begin
  signs_diff <= A(3) xor B(3);

  -- Multiply: sign = A3 xor B3
  -- Subtract (B-A):
  --   if signs are different -> sign = B3
  --   if signs are the same -> sign = B3, but invert if F4=1 (i.e., |A|>|B|)
  F2 <= (A(3) xor B(3)) when Y = '0' else
        (B(3) xor F4);
end architecture;

