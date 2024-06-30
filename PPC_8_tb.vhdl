library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PPC_8_tb is
end entity PPC_8_tb;

architecture testbench of PPC_8_tb is

    signal g_tb : STD_LOGIC_VECTOR(7 downto 0);
    signal h_tb : STD_LOGIC_VECTOR(7 downto 0);

    signal max_gray_tb : STD_LOGIC_VECTOR(7 downto 0);
    signal min_gray_tb : STD_LOGIC_VECTOR(7 downto 0);

    -- Instantiate your PPC_8 component
    component PPC_8
    Port (
        g, h: in STD_LOGIC_VECTOR(7 downto 0);
        max_gray, min_gray: out STD_LOGIC_VECTOR(7 downto 0)
    );
    end component;

begin
    -- Instantiate the Comparator component
    uut: PPC_8
        port map (
            g => g_tb,
            h => h_tb,
            max_gray => max_gray_tb,
            min_gray => min_gray_tb
        );

    -- Stimulus process
    stimulus_proc: process
    begin
        g_tb <= "10111010"; --211
        h_tb <= "10111X10"; --211.5
        wait for 1 ns;

        g_tb <= "11011101"; --150
        h_tb <= "11011100"; --151
        wait for 1 ns;

        g_tb <= "11111111";
        h_tb <= "00001111";
        wait for 1 ns;

        g_tb <= "10000000";
        h_tb <= "00000000";
        wait for 1 ns;     

        -- End simulation
        wait;
    end process stimulus_proc;

end architecture testbench;

