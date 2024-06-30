library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Result is
    Port (
        g_i, h_i : in STD_LOGIC;
        state_current : in STD_LOGIC_VECTOR(1 downto 0); 

        Result_max : out STD_LOGIC;
        Result_min : out STD_LOGIC
    );
end entity Result;

architecture Behavioral of Result is
begin
    Result_max <= ((g_i AND h_i) OR (not(state_current(1)) AND h_i) OR (not(state_current(0)) AND g_i));
    Result_min <= ((g_i AND h_i) OR (state_current(1) AND h_i) OR (state_current(0) AND g_i));
end architecture Behavioral;
