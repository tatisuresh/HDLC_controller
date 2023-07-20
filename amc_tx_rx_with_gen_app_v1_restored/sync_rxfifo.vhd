----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.02.2022 22:08:12
-- Design Name: 
-- Module Name: sync_fifo - Behavioral
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
USE IEEE.std_logic_unsigned.ALL;
use IEEE.std_logic_arith.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sync_rxfifo is
  Port (clock_in    :in std_logic;
        reset_in    :in std_logic;
        wr_enb_in   :in std_logic;
        rd_enb_in   :in std_logic;
        wr_data_in  :in std_logic_vector(7 downto 0);
        rd_data_out :out std_logic_vector(7 downto 0);
        full_out    :out std_logic;
        empty_out   :out std_logic
         );
end sync_rxfifo;

architecture Behavioral of sync_rxfifo is
--signal wr_count     :integer range 0 to 31;--for depth 16
--signal rd_count     :integer range 0 to 31;--for depth 16
signal wr_count     :std_logic_vector(4 downto 0);
signal rd_count     :std_logic_vector(4 downto 0);

--signal wr_count_vec :std_logic_vector(4 downto 0);
--signal rd_count_vec :std_logic_vector(4 downto 0);

type mem is array (0 to 15) of std_logic_vector(7 downto 0);
signal core_fifo :mem;
begin
empty_out    <= '1' when (reset_in = '1') else
                '1' when (wr_count = rd_count)else
                '0';
full_out     <= '0' when (reset_in = '1') else
                '1' when ((wr_count(3 downto 0) = rd_count(3 downto 0))
                           and (wr_count(4) /= rd_count(4)))     else
                '0';  
                              
fifo_design_proc:process(clock_in)
variable var_wr_count     :integer range 0 to 31;
variable var_rd_count     :integer range 0 to 31;
begin
  if(clock_in'event and clock_in = '1')then
     if(reset_in = '1')then
	     var_wr_count := 0;
	     var_rd_count := 0;
        rd_data_out  <= (others => '0');
        wr_count     <= (others => '0');
        rd_count     <= (others => '0');
		  core_fifo(0) <= (others => '0');
		  core_fifo(1) <= (others => '0');		  
		  core_fifo(2) <= (others => '0');
		  core_fifo(3) <= (others => '0');
		  core_fifo(4) <= (others => '0');		  
		  core_fifo(5) <= (others => '0');
		  core_fifo(6) <= (others => '0');
		  core_fifo(7) <= (others => '0');		  
		  core_fifo(8) <= (others => '0');
		  core_fifo(9) <= (others => '0');
		  core_fifo(10) <= (others => '0');		  
		  core_fifo(11) <= (others => '0');
		  core_fifo(12) <= (others => '0');
		  core_fifo(13) <= (others => '0');		  
		  core_fifo(14) <= (others => '0');
		  core_fifo(15) <= (others => '0');
--		  core_fifo(16) <= (others => '0');		  
--		  core_fifo(17) <= (others => '0');
--		  core_fifo(18) <= (others => '0');
--		  core_fifo(19) <= (others => '0');		  
--		  core_fifo(20) <= (others => '0');
--		  core_fifo(21) <= (others => '0');
--		  core_fifo(22) <= (others => '0');		  
--		  core_fifo(23) <= (others => '0');
--		  core_fifo(24) <= (others => '0');
--		  core_fifo(25) <= (others => '0');		  
--		  core_fifo(26) <= (others => '0');
--		  core_fifo(27) <= (others => '0');
--		  core_fifo(28) <= (others => '0');		  
--		  core_fifo(29) <= (others => '0');
--		  core_fifo(30) <= (others => '0');
--		  core_fifo(31) <= (others => '0');		  
		  
     elsif(wr_enb_in = '1')then  
          var_wr_count:= conv_integer(wr_count(3 downto 0));
          core_fifo(var_wr_count) <=wr_data_in;
        if(wr_count = "11111")then
          wr_count <= "00000";
        else
          wr_count <= wr_count + '1';  
        end if;  
          
     elsif(rd_enb_in = '1')then 
          var_rd_count:= conv_integer(rd_count(3 downto 0));
          rd_data_out <= core_fifo(var_rd_count);
        if(rd_count = "11111")then
         rd_count   <= "00000"; 
        else
         rd_count   <= rd_count + 1;
        end if;
        
     end if;
  end if; 
end process;

end Behavioral;
