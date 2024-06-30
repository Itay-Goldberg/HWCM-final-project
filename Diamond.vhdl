library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Diamond is
    Port (
        g_i, h_i : in STD_LOGIC;
        state_current : in STD_LOGIC_VECTOR(1 downto 0); 
        state_next : out STD_LOGIC_VECTOR(1 downto 0)
    );
end entity Diamond;

architecture Behavioral of Diamond is
begin
    state_next(1) <= ((state_current(1) AND not(g_i)) OR (not(state_current(0)) AND g_i));
    state_next(0) <= ((not(state_current(1)) AND h_i) OR (state_current(0) AND not(h_i)));
end architecture Behavioral;
