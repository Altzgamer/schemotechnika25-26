library IEEE;
use IEEE.std_logic_1164.all;

entity KC is
    port (
        I0: in STD_LOGIC;
        I1: in STD_LOGIC;
        I2: in STD_LOGIC;
        I3: in STD_LOGIC;
        O3: out STD_LOGIC;
        O2: out STD_LOGIC;
        O1: out STD_LOGIC;
        O0: out STD_LOGIC
    );
end KC;

architecture KC_arch of KC is
begin
  process(I0, I1, I2, I3)
  begin
    O0 <= I0;
    O1 <= I1;
    O2 <= I2;

    if (I2 = '0' and I1 = '0' and I0 = '0') then
      O3 <= '0';
    else
      O3 <= I3;
    end if;

  end process;
end KC_arch;
