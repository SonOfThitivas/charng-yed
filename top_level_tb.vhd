--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
--
--entity top_level_tb is
--end entity;
--
--architecture tb of top_level_tb is
--    -- Signal declarations for the inputs and outputs of the DUT (Device Under Test)
--    signal CLOCK_50   : std_logic := '0';
--    signal ADC_SDAT   : std_logic := '0';
--    signal ADC_SADDR  : std_logic := '0';
--    signal ADC_CS_N   : std_logic := '1';
--    signal ADC_SCLK   : std_logic;
--    signal adc_data_out : std_logic_vector(15 downto 0);
--    
--    -- Clock period definition
--    constant clk_period : time := 20 ns; -- 50 MHz clock
--begin
--    -- Instantiate the DUT (top_level)
--    DUT : entity work.top_level
--        port map (
--            CLOCK_50 => CLOCK_50,
--            ADC_SDAT => ADC_SDAT,
--            ADC_SADDR => ADC_SADDR,
--            ADC_CS_N => ADC_CS_N,
--            ADC_SCLK => ADC_SCLK,
--            adc_data_out => adc_data_out
--        );
--        
--    -- Clock generation process
--    clk_process : process
--    begin
--        while true loop
--            CLOCK_50 <= '0';
--            wait for clk_period / 2;
--            CLOCK_50 <= '1';
--            wait for clk_period / 2;
--        end loop;
--    end process;
--    
--    -- Stimulus process to drive inputs and observe outputs
--    stimulus_process : process
--    begin
--        -- Initial conditions
--        ADC_CS_N <= '1';  -- Start with ADC disabled (active low)
--        ADC_SDAT <= '0';
--        ADC_SADDR <= '0';
--        
--        -- Wait for some time, then start simulation
--        wait for 200 ns;
--        
--        -- Activate ADC by lowering CS_N
--        ADC_CS_N <= '0';
--        
--        -- Simulate ADC data input
--        wait for 200 ns;
--        ADC_SDAT <= '1';
--        
--        wait for 200 ns;
--        ADC_SDAT <= '0';
--        
--        wait for 200 ns;
--        ADC_SDAT <= '1';
--        
--        -- End simulation after enough time has passed
--        wait for 1000 ns;
--        wait;
--    end process;
--    
--end architecture;

--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
--
--entity top_level_tb is
--    -- No ports in a testbench
--end entity top_level_tb;
--
--architecture sim of top_level_tb is
--
--    -- Component declaration for the top_level entity
--    component top_level
--        PORT (
--            CLOCK_50    : IN STD_LOGIC;
--            scl          : OUT STD_LOGIC;
--            sda          : INOUT STD_LOGIC;
--            ADC_SDAT     : IN STD_LOGIC;
--            ADC_SADDR    : OUT STD_LOGIC;
--            ADC_CS_N     : OUT STD_LOGIC;
--            ADC_SCLK     : OUT STD_LOGIC;
--            adc_data_out : OUT STD_LOGIC_VECTOR(11 downto 0)
--        );
--    end component;
--
--    -- Signal declarations for the testbench
--    signal CLOCK_50    : STD_LOGIC := '0';
--    signal scl         : STD_LOGIC;
--    signal sda         : STD_LOGIC := 'Z';  -- High impedance for inout
--    signal ADC_SDAT    : STD_LOGIC := '0';  -- Mock ADC data input
--    signal ADC_SADDR   : STD_LOGIC;
--    signal ADC_CS_N    : STD_LOGIC;
--    signal ADC_SCLK    : STD_LOGIC;
--    signal adc_data_out : STD_LOGIC_VECTOR(11 downto 0);
--
--    -- Clock period definition
--    constant CLOCK_PERIOD : time := 20 ns;
--
--begin
--
--    -- Instantiate the top_level entity
--    uut: top_level
--        PORT MAP (
--            CLOCK_50 => CLOCK_50,
--            scl => scl,
--            sda => sda,
--            ADC_SDAT => ADC_SDAT,
--            ADC_SADDR => ADC_SADDR,
--            ADC_CS_N => ADC_CS_N,
--            ADC_SCLK => ADC_SCLK,
--            adc_data_out => adc_data_out
--        );
--
--    -- Clock generation process
--    clk_process: process
--    begin
--        while true loop
--            CLOCK_50 <= '0';
--            wait for CLOCK_PERIOD / 2;
--            CLOCK_50 <= '1';
--            wait for CLOCK_PERIOD / 2;
--        end loop;
--    end process;
--
--    -- Test stimulus process
--    stimulus_process: process
--    begin
--        -- Initialize ADC_SDAT to some value (mocking ADC behavior)
--        wait for 100 ns; -- Wait for some time before starting the test
--
--        ADC_SDAT <= '1';  -- Mock ADC data ready
--        wait for 20 ns;
--
--        ADC_SDAT <= '0';  -- Simulate data read
--        wait for 20 ns;
--
--        -- More test cases can be added here as needed
--        wait for 100 ns; -- Wait for additional time
--        ADC_SDAT <= '1';  -- Change ADC data
--        wait for 20 ns;
--
--        -- Add conditions to check outputs
--        wait for 100 ns;
--        
--        -- End the simulation
--        wait for 1 ms;
--        report "End of simulation" severity note;
--        wait;
--    end process;
--
--end architecture sim;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_level_tb is
    -- No ports in a testbench
end entity top_level_tb;

architecture sim of top_level_tb is

    -- Component declaration for the top_level entity
    component top_level
        PORT (
            CLOCK_50    : IN STD_LOGIC;
            scl          : OUT STD_LOGIC;
            sda          : INOUT STD_LOGIC;
            ADC_SDAT     : IN STD_LOGIC;
            ADC_SADDR    : OUT STD_LOGIC;
            ADC_CS_N     : OUT STD_LOGIC;
            ADC_SCLK     : OUT STD_LOGIC;
            adc_data_out : OUT STD_LOGIC_VECTOR(11 downto 0)
        );
    end component;

    -- Signal declarations for the testbench
    signal CLOCK_50    : STD_LOGIC := '0';
    signal scl         : STD_LOGIC;
    signal sda         : STD_LOGIC := 'Z';  -- High impedance for inout
    signal ADC_SDAT    : STD_LOGIC;          -- Mock ADC data input
    signal ADC_SADDR   : STD_LOGIC;
    signal ADC_CS_N    : STD_LOGIC;
    signal ADC_SCLK    : STD_LOGIC;
    signal adc_data_out : STD_LOGIC_VECTOR(11 downto 0);

    -- Clock period definition
    constant CLOCK_PERIOD : time := 20 ns;

    -- Signal for real-time data simulation
    signal adc_value : unsigned(11 downto 0) := (others => '0');

begin

    -- Instantiate the top_level entity
    uut: top_level
        PORT MAP (
            CLOCK_50 => CLOCK_50,
            scl => scl,
            sda => sda,
            ADC_SDAT => ADC_SDAT,
            ADC_SADDR => ADC_SADDR,
            ADC_CS_N => ADC_CS_N,
            ADC_SCLK => ADC_SCLK,
            adc_data_out => adc_data_out
        );

    -- Clock generation process
    clk_process: process
    begin
        while true loop
            CLOCK_50 <= '0';
            wait for CLOCK_PERIOD / 2;
            CLOCK_50 <= '1';
            wait for CLOCK_PERIOD / 2;
        end loop;
    end process;

    -- Real-time ADC data simulation process
    stimulus_process: process
    begin
        -- Initialize ADC_SDAT
        ADC_SDAT <= '0'; 
        wait for 100 ns; -- Wait before starting

        while true loop
            -- Simulate real-time ADC data
            adc_value <= adc_value + 1;  -- Increment the ADC value
            ADC_SDAT <= adc_value(11); -- Assign the most significant bit to ADC_SDAT

            -- Wait for a short time to simulate sampling rate
            wait for 10 ns; -- Adjust this to control the sampling rate
        end loop;

        -- End the simulation
        wait; -- Keep the process running
    end process;

end architecture sim;

