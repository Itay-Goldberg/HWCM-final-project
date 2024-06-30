library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PPC_8 is
    Port (
        g, h: in STD_LOGIC_VECTOR(0 to 7);
        max_gray, min_gray: out STD_LOGIC_VECTOR(0 to 7)
    );
end entity PPC_8;

architecture Behavioral of PPC_8 is

    signal state_x0x1 : std_logic_vector(1 downto 0);
    signal state_x2x3 : std_logic_vector(1 downto 0);
    signal state_x4x5 : std_logic_vector(1 downto 0);
    signal state_x6x7 : std_logic_vector(1 downto 0);

    signal state_x0x3 : std_logic_vector(1 downto 0);
    signal state_x4x7 : std_logic_vector(1 downto 0);

    signal state_x0x7 : std_logic_vector(1 downto 0);

    signal state_x0x5 : std_logic_vector(1 downto 0);

    signal state_x0x2 : std_logic_vector(1 downto 0);
    signal state_x0x4 : std_logic_vector(1 downto 0);
    signal state_x0x6 : std_logic_vector(1 downto 0);

    component Diamond
    Port (
        g_i, h_i : in STD_LOGIC;
        state_current : in STD_LOGIC_VECTOR(1 downto 0); 
        state_next : out STD_LOGIC_VECTOR(1 downto 0)
    );
    end component;

    component Result
      Port (
          g_i, h_i : in STD_LOGIC;
          state_current : in STD_LOGIC_VECTOR(1 downto 0); 
  
          Result_max : out STD_LOGIC;
          Result_min : out STD_LOGIC
      );
      end component;

  begin
    ---------- L0
    Diamond_L0_x0x1 : Diamond
    port map (
      g_i => g(1),
      h_i => h(1),
      state_current(1) => g(0),
      state_current(0) => h(0),
      state_next => state_x0x1
    );
    Diamond_L0_x2x3 : Diamond
    port map (
      g_i => g(3),
      h_i => h(3),
      state_current(1) => g(2),
      state_current(0) => h(2),
      state_next => state_x2x3
    );
    Diamond_L0_x4x5 : Diamond
    port map (
      g_i => g(5),
      h_i => h(5),
      state_current(1) => g(4),
      state_current(0) => h(4),
      state_next => state_x4x5
    );
    Diamond_L0_x6x7 : Diamond
    port map (
      g_i => g(7),
      h_i => h(7),
      state_current(1) => g(6),
      state_current(0) => g(6),
      state_next => state_x6x7
    );
    ---------- L1
    Diamond_L1_x1x3 : Diamond
    port map (
      g_i => state_x2x3(1),
      h_i => state_x2x3(0),
      state_current => state_x0x1,
      state_next => state_x0x3
    );
    Diamond_L1_x5x7 : Diamond
    port map (
      g_i => state_x6x7(1),
      h_i => state_x6x7(0),
      state_current => state_x4x5,
      state_next => state_x4x7
    );
    ---------- L2
    Diamond_L2_x3x7 : Diamond
    port map (
      g_i => state_x4x7(1),
      h_i => state_x4x7(0),
      state_current => state_x0x3,
      state_next => state_x0x7
    );
    ---------- L3
    Diamond_L3_x3x5 : Diamond
    port map (
      g_i => state_x4x5(1),
      h_i => state_x4x5(0),
      state_current => state_x0x3,
      state_next => state_x0x5
    );
    ---------- L4
    Diamond_L4_x1x2 : Diamond
    port map (
      g_i => g(2),
      h_i => h(2),
      state_current => state_x0x1,
      state_next => state_x0x2
    );
    Diamond_L4_x3x4 : Diamond
    port map (
      g_i => g(4),
      h_i => h(4),
      state_current => state_x0x3,
      state_next => state_x0x4
    );
    Diamond_L4_x5x6 : Diamond
    port map (
      g_i => g(6),
      h_i => h(6),
      state_current => state_x0x5,
      state_next => state_x0x6
    );
    --------- Out
    Result_x0 : Result
    port map (
      g_i => g(0),
      h_i => h(0),
      state_current => "00",

      Result_max => max_gray(0),
      Result_min => min_gray(0)
    );
    Result_x1 : Result
    port map (
      g_i => g(1),
      h_i => h(1),
      state_current(1) => g(0),
      state_current(0) => h(0),

      Result_max => max_gray(1),
      Result_min => min_gray(1)
    );
    Result_x2 : Result
    port map (
      g_i => g(2),
      h_i => h(2),
      state_current => state_x0x1,

      Result_max => max_gray(2),
      Result_min => min_gray(2)
    );
    Result_x3 : Result
    port map (
      g_i => g(3),
      h_i => h(3),
      state_current => state_x0x2,

      Result_max => max_gray(3),
      Result_min => min_gray(3)
    );
    Result_x4 : Result
    port map (
      g_i => g(4),
      h_i => h(4),
      state_current => state_x0x3,

      Result_max => max_gray(4),
      Result_min => min_gray(4)
    );
    Result_x5 : Result
    port map (
      g_i => g(5),
      h_i => h(5),
      state_current => state_x0x4,

      Result_max => max_gray(5),
      Result_min => min_gray(5)
    );
    Result_x6 : Result
    port map (
      g_i => g(6),
      h_i => h(6),
      state_current => state_x0x5,

      Result_max => max_gray(6),
      Result_min => min_gray(6)
    );
    Result_x7 : Result
    port map (
      g_i => g(7),
      h_i => h(7),
      state_current => state_x0x6,

      Result_max => max_gray(7),
      Result_min => min_gray(7)
    );

end architecture Behavioral;
