----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2021 23:38:35
-- Design Name: 
-- Module Name: Tb_tob - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Tb_tob is
--  Port ( );
end Tb_tob;

architecture Behavioral of Tb_tob is
component CPU_Interafce is
  Port (Clk33mhz_in    : in std_logic; -- clock input
        sig_clk33mhz   : in std_logic;
        sig_clk99mhz   : in std_logic;
        Reset_n_in     : in std_logic; -- reset active low input
        Cs_n_in        : in std_logic; --chip select active low
        Data_inout     : inout std_logic_vector(15 downto 0); -- data in out
        Addr_A7A0      : in std_logic_vector(7 downto 0); -- address a6 to a1
        --A0_ble_n_in    : in std_logic;-- address a0
        Bhe_n_in       : in  std_logic;-- Intel high byte enable(16 bit mode)
        Read_ENn_in    : in  std_logic;-- Read enable(in Intel mode)
        Write_ENn_in   : in  std_logic;-- Write enable(in Intel mode)
        Int_n_out      : out std_logic;-- Interrupt output
        --Ready_n_in     : in std_logic;-- Intel bus mode connected to 1
        Ready_n_out    : out std_logic;-- Intel bus mode connected to 1
        -- HDLC Receive Serial Interface
        --RxClk            : in  std_logic; -- Receive Serial Clock
        RxData         : in  std_logic; -- Receive Serial Data
        -- HDLC Transmit Serial Interface
        --TxClk            : in  std_logic; -- Transmit Serial Clock
        TxData         : out std_logic; -- Transmit Serial Data
        LED_out        : out std_logic_vector(3 downto 0) -- led for debug only
       );
end component;

--component CPU_Contrl is
--  Port (
--    Clk33mhz_in      : in std_logic; -- clock input
--    Reset_n_in       : in std_logic; -- reset active low input
    
--    USR_Wenb_in      : in std_logic; --write enb
--    USR_Renb_in      : in std_logic; --read enb
--    USR_UBE_in       : in std_logic; --upper byte enb
--    USR_WData_in     : in std_logic_vector(15 downto 0); -- data write 
--    USR_RData_out    : out std_logic_vector(15 downto 0); -- data read 
--    USR_Addr_in      : in std_logic_vector(7 downto 0); -- data read 
        
--    CPU_Data_inout    : inout std_logic_vector(15 downto 0); -- data in out
--    CPU_Addr_A7A0     : out std_logic_vector(7 downto 0); -- address a6 to a1
--    --A0_ble_n_in     : in std_logic;-- address a0
--    CPU_Cs_n_out      : out std_logic; --chip select active low
--    CPU_Bhe_n_out     : out std_logic;-- Intel high byte enable(16 bit mode)
--    CPU_Rd_ENn_out    : out std_logic;-- Read enable(in Intel mode)
--    CPU_Wr_ENn_out    : out std_logic;-- Write enable(in Intel mode)
--    CPU_Int_n_in      : in std_logic-- Interrupt output
--    );
--end component;

signal sig_Clk33mhz_in  :std_logic; 
signal sig_clk99mhz     :std_logic; 
signal sig_Reset_n_in   :std_logic;
signal sig_Cs_n_in      :std_logic;
signal sig_Data_inout   :std_logic_vector(15 downto 0);
signal sig_Addr_A7A0    :std_logic_vector(7 downto 0);
signal sig_Bhe_n_in     :std_logic;
signal sig_Rd_Enbn_in   :std_logic;
signal sig_Wr_Enbn_in   :std_logic;
signal sig_Int_n_in     :std_logic;
signal sig_Ready_n_in   :std_logic:='1';
signal sig_RxClk        :std_logic;
--signal sig_RxData       :std_logic;
signal sig_TxClk        :std_logic;
signal sig_TxData       :std_logic;
signal sig_LED_out      :std_logic_vector(3 downto 0);

signal reg_read   :std_logic_vector(15 downto 0);
--------clock gen signal
signal counter: integer range 0 to 15;

--signal tb_Wenb_in   : std_logic;
--signal tb_Renb_in   : std_logic;
--signal tb_UBE_in    : std_logic;
--signal tb_WData_in  : std_logic_vector(15 downto 0);
--signal tb_RData_out : std_logic_vector(15 downto 0);
--signal tb_Addr_in   : std_logic_vector(7 downto 0);

-----------------for test---------------
constant C_addrA_CCR0       :std_logic_vector(7 downto 0):=x"16";--R/W
constant C_addrA_CCR1       :std_logic_vector(7 downto 0):=x"18";--R/W
constant C_addrA_CCR2       :std_logic_vector(7 downto 0):=x"1a";--R/W
constant C_addrA_CCR3       :std_logic_vector(7 downto 0):=x"1c";--R/W
constant C_addrA_STAR       :std_logic_vector(7 downto 0):=x"12";--R   --fifo sttaus
constant C_addrA_TX_RX_FIFO :std_logic_vector(7 downto 0):=x"10";--R/W
constant C_addrA_CMDR       :std_logic_vector(7 downto 0):=x"14";--R/W --start tx

type state is (cpu_st0, cpu_st1, cpu_st2, cpu_st3, cpu_st4, cpu_st5, cpu_st6, cpu_st7, cpu_st8, cpu_st9);
signal nxt_state :state;
begin

--------------------------------------------------------
--system clock generation 33mhz
--------------------------------------------------------
clock33mhz_gen:process
begin
  wait for 15 ns;
  sig_Clk33mhz_in <= '0';
  wait for 15 ns;
  sig_Clk33mhz_in <= '1';
end process;

clock99mhz_gen:process
begin
  wait for 5ns;
  sig_clk99mhz <= '0';
  wait for 5ns;
  sig_clk99mhz <= '1';
end process;
--------------------------------------------------------
--system clock generation 100mhz
--------------------------------------------------------
--clock100mhz_gen:process
--begin
--  wait for 5ns;
--  sig_Clk100mhz_in <= '0';
--  wait for 5ns;
--  sig_Clk100mhz_in <= '1';
--end process;
--------------------------------------------------------
--reset generation
--------------------------------------------------------
rst_gen:process
begin
  sig_Reset_n_in <= '0';
  wait for 120ns;
  sig_Reset_n_in <= '1';
  wait;
end process;

--------------------------------------------------------
--serial clock generation
--------------------------------------------------------
--tx_tx_clk_gen:process(sig_Clk33mhz_in)
--begin
--  if(sig_Clk33mhz_in'event and sig_Clk33mhz_in = '1')then
--    if(sig_Reset_n_in = '0')then
--       counter   <= 0;
--       sig_TxClk <='0';
--       sig_RxClk <='0';
--    else   
--       if(counter = 15)then 
--          counter <= 0; 
--       else
--          counter <= counter + 1;    
--       end if;
--       if(counter >= 0 and counter <= 7)then
--          sig_TxClk <='1';
--          sig_RxClk <='1';
--       else
--          sig_TxClk <='0';
--          sig_RxClk <='0';
--       end if;
--    end if;   
--  end if;
--end process;

--------------------------------------------------------
--stimulus signal generation
--------------------------------------------------------
stimulus:process
begin
    wait for 4us;
    sig_Cs_n_in    <= '1';
    sig_Bhe_n_in   <= '1';
    sig_Rd_Enbn_in <= '1';
    sig_Wr_Enbn_in <= '1';
    reg_read       <=(others => '0'); 
    sig_Addr_A7A0  <=(others => '0'); 
    sig_Data_inout <=(others => 'Z');
    wait for 150ns;
    
    sig_Addr_A7A0  <= C_addrA_CCR0;--writing
    sig_Data_inout <= x"a050";
    sig_Bhe_n_in   <= '0';
    sig_Cs_n_in    <= '0';
    wait for 8ns; 
    sig_Rd_Enbn_in <= '1';
    sig_Wr_Enbn_in <= '0';
    wait for 10ns;  
    sig_Rd_Enbn_in <= '1';
    sig_Wr_Enbn_in <= '1';
    wait for 10ns;
    sig_Cs_n_in    <= '1';
    wait for 2ns;
            
    sig_Addr_A7A0  <= C_addrA_CCR1;--writing
    sig_Data_inout <= x"a151";
    sig_Bhe_n_in   <= '0';
    sig_Cs_n_in    <= '0';
    wait for 8ns; 
    sig_Rd_Enbn_in <= '1';
    sig_Wr_Enbn_in <= '0';
    wait for 10ns;  
    sig_Rd_Enbn_in <= '1';
    sig_Wr_Enbn_in <= '1';
    wait for 10ns;
    sig_Cs_n_in    <= '1';
    wait for 2ns;
        
    sig_Addr_A7A0  <= C_addrA_CCR2;--writing
    sig_Data_inout <= x"a252";
    sig_Bhe_n_in   <= '0';
    sig_Cs_n_in    <= '0';
    wait for 8ns; 
    sig_Rd_Enbn_in <= '1';
    sig_Wr_Enbn_in <= '0';
    wait for 10ns;  
    sig_Rd_Enbn_in <= '1';
    sig_Wr_Enbn_in <= '1';
    wait for 10ns;
    sig_Cs_n_in    <= '1';
    wait for 2ns;
        
    sig_Addr_A7A0  <= C_addrA_CCR3;--writing
    sig_Data_inout <= x"a353";
    sig_Bhe_n_in   <= '0';
    sig_Cs_n_in    <= '0';
    wait for 8ns; 
    sig_Rd_Enbn_in <= '1';
    sig_Wr_Enbn_in <= '0';
    wait for 10ns;  
    sig_Rd_Enbn_in <= '1';
    sig_Wr_Enbn_in <= '1';
    wait for 10ns;
    sig_Cs_n_in    <= '1';
    wait for 2ns;
     
    sig_Data_inout <= (others => 'Z'); 
      
    sig_Addr_A7A0  <= C_addrA_CCR0;--reading
    reg_read       <= sig_Data_inout;
    sig_Bhe_n_in   <= '0';
    sig_Cs_n_in    <= '0';
    wait for 8ns; 
    sig_Rd_Enbn_in <= '0';
    sig_Wr_Enbn_in <= '1';
    wait for 10ns;  
    sig_Rd_Enbn_in <= '1';
    sig_Wr_Enbn_in <= '1';
    wait for 10ns;
    sig_Cs_n_in    <= '1';
    wait for 2ns;
        
    sig_Addr_A7A0  <= C_addrA_CCR1;--reading
    --sig_Data_inout <= (others => 'Z');
    reg_read       <= sig_Data_inout;
    sig_Bhe_n_in   <= '0';
    sig_Cs_n_in    <= '0';
    wait for 8ns; 
    sig_Rd_Enbn_in <= '0';
    sig_Wr_Enbn_in <= '1';
    wait for 10ns;  
    sig_Rd_Enbn_in <= '1';
    sig_Wr_Enbn_in <= '1';
    wait for 10ns;
    sig_Cs_n_in    <= '1';
    wait for 2ns;
        
    sig_Addr_A7A0  <= C_addrA_CCR2;--reading
    --sig_Data_inout <= (others => 'Z');
    reg_read       <= sig_Data_inout;
    sig_Bhe_n_in   <= '0';
    sig_Cs_n_in    <= '0';
    wait for 8ns; 
    sig_Rd_Enbn_in <= '0';
    sig_Wr_Enbn_in <= '1';
    wait for 10ns;  
    sig_Rd_Enbn_in <= '1';
    sig_Wr_Enbn_in <= '1';
    wait for 10ns;
    sig_Cs_n_in    <= '1';
    wait for 2ns;
        
    sig_Addr_A7A0  <= C_addrA_CCR3;--reading
    --sig_Data_inout <= (others => 'Z');
    reg_read       <= sig_Data_inout;
    sig_Bhe_n_in   <= '0';
    sig_Cs_n_in    <= '0';
    wait for 8ns; 
    sig_Rd_Enbn_in <= '0';
    sig_Wr_Enbn_in <= '1';
    wait for 10ns;  
    sig_Rd_Enbn_in <= '1';
    sig_Wr_Enbn_in <= '1';
    wait for 10ns;
    sig_Cs_n_in    <= '1';
    wait for 2ns;
    
    sig_Addr_A7A0  <= C_addrA_STAR;--reading fifo status
    --sig_Data_inout <= (others => 'Z');
    reg_read       <= sig_Data_inout;
    sig_Bhe_n_in   <= '0';
    sig_Cs_n_in    <= '0';
    wait for 8ns; 
    sig_Rd_Enbn_in <= '0';
    sig_Wr_Enbn_in <= '1';
    wait for 10ns;  
    sig_Rd_Enbn_in <= '1';
    sig_Wr_Enbn_in <= '1';
    wait for 10ns;
    sig_Cs_n_in    <= '1';
    wait for 2ns;
        
    --if(reg_read(1)= '0')then  
      sig_Addr_A7A0  <= C_addrA_TX_RX_FIFO;--writing
      sig_Data_inout <= x"0201"; --fifo write
      sig_Bhe_n_in   <= '0';
      sig_Cs_n_in    <= '0';
      wait for 8ns; 
      sig_Rd_Enbn_in <= '1';
      sig_Wr_Enbn_in <= '0';
      wait for 10ns;  
      sig_Rd_Enbn_in <= '1';
      sig_Wr_Enbn_in <= '1';
      wait for 10ns;  
      sig_Cs_n_in    <= '1';
      wait for 2ns;
            
      sig_Addr_A7A0  <= C_addrA_TX_RX_FIFO;--writing
      sig_Data_inout <= x"0403";--fifo write
      sig_Bhe_n_in   <= '0';
      sig_Cs_n_in    <= '0';
      wait for 8ns; 
      sig_Rd_Enbn_in <= '1';
      sig_Wr_Enbn_in <= '0';
      wait for 10ns;  
      sig_Rd_Enbn_in <= '1';
      sig_Wr_Enbn_in <= '1';
      wait for 10ns;    
      sig_Cs_n_in    <= '1';
      wait for 2ns;
            
      sig_Addr_A7A0  <= C_addrA_TX_RX_FIFO;--writing
      sig_Data_inout <= x"0605";--fifo write
      sig_Bhe_n_in   <= '0';
      sig_Cs_n_in    <= '0';
      wait for 8ns; 
      sig_Rd_Enbn_in <= '1';
      sig_Wr_Enbn_in <= '0';
      wait for 10ns;  
      sig_Rd_Enbn_in <= '1';
      sig_Wr_Enbn_in <= '1';
      wait for 10ns;
      sig_Cs_n_in    <= '1';
      wait for 2ns; 
      
      sig_Addr_A7A0  <= C_addrA_TX_RX_FIFO;--writing
      sig_Data_inout <= x"0807";--fifo write
      sig_Bhe_n_in   <= '0';
      sig_Cs_n_in    <= '0';
      wait for 8ns; 
      sig_Rd_Enbn_in <= '1';
      sig_Wr_Enbn_in <= '0';
      wait for 10ns;  
      sig_Rd_Enbn_in <= '1';
      sig_Wr_Enbn_in <= '1';
      wait for 10ns; 
      sig_Cs_n_in    <= '1';
      wait for 2ns;             
    --end if; 

      sig_Addr_A7A0  <= C_addrA_CMDR;--writing
      sig_Data_inout <= x"0008";  --start tx
      sig_Bhe_n_in   <= '0';
      sig_Cs_n_in    <= '0';
      wait for 8ns; 
      sig_Rd_Enbn_in <= '1';
      sig_Wr_Enbn_in <= '0';
      wait for 10ns;  
      sig_Rd_Enbn_in <= '1';
      sig_Wr_Enbn_in <= '1';
      wait for 10ns;     
      sig_Cs_n_in    <= '1';
      wait for 2ns; 

      wait for 30us;      
      sig_Addr_A7A0  <= C_addrA_TX_RX_FIFO;--rx fifo reading
      sig_Data_inout <=(others => 'Z');
      sig_Bhe_n_in   <= '0';
      sig_Cs_n_in    <= '0';
      wait for 8ns; 
      sig_Rd_Enbn_in <= '0';
      sig_Wr_Enbn_in <= '1';
      wait for 10ns;  
      sig_Rd_Enbn_in <= '1';
      sig_Wr_Enbn_in <= '1';
      wait for 10ns; 
      sig_Cs_n_in    <= '1';
      wait for 2ns;  
      
      sig_Addr_A7A0  <= C_addrA_TX_RX_FIFO;--rx fifo reading
      sig_Data_inout <=(others => 'Z');
      sig_Bhe_n_in   <= '0';
      sig_Cs_n_in    <= '0';
      wait for 8ns; 
      sig_Rd_Enbn_in <= '0';
      sig_Wr_Enbn_in <= '1';
      wait for 10ns;  
      sig_Rd_Enbn_in <= '1';
      sig_Wr_Enbn_in <= '1';
      wait for 10ns; 
      sig_Cs_n_in    <= '1';
      wait for 2ns;        
   wait;
end process;
--------------------------------------------------------
--port map
--------------------------------------------------------
x2:CPU_Interafce Port map(
    Clk33mhz_in  =>sig_Clk33mhz_in,
    sig_clk33mhz =>sig_Clk33mhz_in,
    sig_clk99mhz =>sig_clk99mhz,
        
    Reset_n_in   =>sig_Reset_n_in , 
    Cs_n_in      =>sig_Cs_n_in    , 
    Data_inout   =>sig_Data_inout , 
    Addr_A7A0    =>sig_Addr_A7A0  , 
    --A0_ble_n_in 
    Bhe_n_in     =>sig_Bhe_n_in    , 
    Read_ENn_in  =>sig_Rd_Enbn_in , 
    Write_ENn_in =>sig_Wr_Enbn_in, 
    Int_n_out    =>sig_Int_n_in    , 
    Ready_n_out  =>sig_Ready_n_in  , 
    -- HDLC Rx
    --RxClk        =>sig_RxClk , 
    --RxData      =>sig_RxData, 
    RxData       =>sig_TxData, 
    -- HDLC Tx
    --TxClk        =>sig_TxClk , 
    TxData       =>sig_TxData,
    LED_out      =>sig_LED_out  
     );
--cpu_controller:process(sig_Clk33mhz_in)
--begin
--  if(sig_Clk33mhz_in'event and sig_Clk33mhz_in = '1')then
--      if(sig_Reset_n_in = '0')then
--         tb_Wenb_in  <= '0'; 
--         tb_Renb_in  <= '0'; 
--         tb_UBE_in   <= '0'; 
--         tb_WData_in <= (others => '0'); 
--         tb_Addr_in  <= (others => '0');
--         nxt_state   <= cpu_st0;
--      else
--         case nxt_state is
--         when cpu_st0 =>--for writing
--             tb_Wenb_in  <= '1'; 
--             tb_Renb_in  <= '0'; 
--             tb_UBE_in   <= '1'; 
--             tb_WData_in <= x"a050"; 
--             tb_Addr_in  <= C_addrA_CCR0;
--             nxt_state   <= cpu_st1;
             
--          when cpu_st1 => --for writing
--             tb_Wenb_in  <= '1'; 
--             tb_Renb_in  <= '0'; 
--             tb_UBE_in   <= '1'; 
--             tb_WData_in <= x"a151"; 
--             tb_Addr_in  <= C_addrA_CCR1;
--             nxt_state   <= cpu_st2;
             
--          when cpu_st2 => --for writing
--             tb_Wenb_in  <= '1'; 
--             tb_Renb_in  <= '0'; 
--             tb_UBE_in   <= '1'; 
--             tb_WData_in <= x"a252"; 
--             tb_Addr_in  <= C_addrA_CCR2;
--             nxt_state   <= cpu_st3;
                
--          when cpu_st3 => --for writing
--             tb_Wenb_in  <= '1'; 
--             tb_Renb_in  <= '0'; 
--             tb_UBE_in   <= '1'; 
--             tb_WData_in <= x"a353"; 
--             tb_Addr_in  <= C_addrA_CCR3;
--             nxt_state   <= cpu_st9;                                          

--          when cpu_st4 =>  --for reading
--             tb_Wenb_in  <= '0'; 
--             tb_Renb_in  <= '1'; 
--             tb_UBE_in   <= '1'; 
--             tb_WData_in <= x"0000"; 
--             tb_Addr_in  <= C_addrA_CCR0;
--             nxt_state   <= cpu_st5;

--          when cpu_st5 =>  --for reading
--             tb_Wenb_in  <= '0'; 
--             tb_Renb_in  <= '1'; 
--             tb_UBE_in   <= '1'; 
--             tb_WData_in <= x"0000"; 
--             tb_Addr_in  <= C_addrA_CCR1;
--             nxt_state   <= cpu_st6;    

--          when cpu_st6 =>  --for reading
--             tb_Wenb_in  <= '0'; 
--             tb_Renb_in  <= '1'; 
--             tb_UBE_in   <= '1'; 
--             tb_WData_in <= x"0000"; 
--             tb_Addr_in  <= C_addrA_CCR2;
--             nxt_state   <= cpu_st7;  

--          when cpu_st7 =>  --for reading
--             tb_Wenb_in  <= '0'; 
--             tb_Renb_in  <= '1'; 
--             tb_UBE_in   <= '1'; 
--             tb_WData_in <= x"0000"; 
--             tb_Addr_in  <= C_addrA_CCR3;
--             nxt_state   <= cpu_st8; 

--          when cpu_st9 =>  
--             tb_Wenb_in  <= '0'; 
--             tb_Renb_in  <= '0'; 
--             tb_UBE_in   <= '0'; 
--             tb_WData_in <= x"0000"; 
--             tb_Addr_in  <= x"00";
--             nxt_state   <= cpu_st4; 
                                                  
--          when cpu_st8 =>  
--             tb_Wenb_in  <= '0'; 
--             tb_Renb_in  <= '0'; 
--             tb_UBE_in   <= '0'; 
--             tb_WData_in <= x"0000"; 
--             tb_Addr_in  <= x"00";
--             nxt_state   <= cpu_st8; 
                                                  
--         when others =>
--            nxt_state   <= cpu_st0;
--         end case;    
--      end if;
--  end if;
--end process;
  
--x1:CPU_Contrl Port map(
--      Clk33mhz_in     =>sig_Clk33mhz_in,
--      Reset_n_in      =>sig_Reset_n_in,
                      
--      USR_Wenb_in     =>tb_Wenb_in  ,
--      USR_Renb_in     =>tb_Renb_in  ,
--      USR_UBE_in      =>tb_UBE_in   ,
--      USR_WData_in    =>tb_WData_in ,
--      USR_RData_out   =>tb_RData_out,
--      USR_Addr_in     =>tb_Addr_in  ,
                      
--      CPU_Data_inout  =>sig_Data_inout,
--      CPU_Addr_A7A0   =>sig_Addr_A7A0,
--      CPU_Cs_n_out    =>sig_Cs_n_in,
--      CPU_Bhe_n_out   =>sig_Bhe_n_in,
--      CPU_Rd_ENn_out  =>sig_Rd_Enbn_in,
--      CPU_Wr_ENn_out  =>sig_Wr_Enbn_in,
--      CPU_Int_n_in    =>sig_Int_n_in
--       );           

end Behavioral;
