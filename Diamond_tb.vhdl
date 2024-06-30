LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Diamond_tb IS
END Diamond_tb;

ARCHITECTURE behavior OF Diamond_tb IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Diamond
    PORT(
        g_i : IN  std_logic;
        h_i : IN  std_logic;
        state_current : IN  std_logic_vector(1 downto 0);
        state_next : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
   
    --Inputs
    signal g_i : std_logic := '0';
    signal h_i : std_logic := '0';
    signal state_current : std_logic_vector(1 downto 0) := (others => '0');

    --Outputs
    signal state_next : std_logic_vector(1 downto 0);

    -- Clock period definitions
    constant clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: Diamond PORT MAP (
          g_i => g_i,
          h_i => h_i,
          state_current => state_current,
          state_next => state_next
        );

   -- Stimulus process
   stim_proc: process
   begin		
        -- hold reset state for 100 ns.
        wait for 100 ns;	
        
        -- insert stimulus here 
        g_i <= '0'; h_i <= '0'; state_current <= "00"; wait for clk_period;
        report "g_i = " & std_logic'image(g_i) & ", h_i = " & std_logic'image(h_i) & ", state_current = " & std_logic'image(state_current(1)) & std_logic'image(state_current(0)) & ", state_next = " & std_logic'image(state_next(1)) & std_logic'image(state_next(0));

        g_i <= '0'; h_i <= '1'; state_current <= "00"; wait for clk_period;
        report "g_i = " & std_logic'image(g_i) & ", h_i = " & std_logic'image(h_i) & ", state_current = " & std_logic'image(state_current(1)) & std_logic'image(state_current(0)) & ", state_next = " & std_logic'image(state_next(1)) & std_logic'image(state_next(0));

        g_i <= '1'; h_i <= '0'; state_current <= "00"; wait for clk_period;
        report "g_i = " & std_logic'image(g_i) & ", h_i = " & std_logic'image(h_i) & ", state_current = " & std_logic'image(state_current(1)) & std_logic'image(state_current(0)) & ", state_next = " & std_logic'image(state_next(1)) & std_logic'image(state_next(0));

        g_i <= '1'; h_i <= '1'; state_current <= "00"; wait for clk_period;
        report "g_i = " & std_logic'image(g_i) & ", h_i = " & std_logic'image(h_i) & ", state_current = " & std_logic'image(state_current(1)) & std_logic'image(state_current(0)) & ", state_next = " & std_logic'image(state_next(1)) & std_logic'image(state_next(0));

        -- Add more test vectors as needed

        wait; -- will wait forever
   end process;

END;
