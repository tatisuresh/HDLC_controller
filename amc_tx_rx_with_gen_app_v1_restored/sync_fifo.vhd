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

entity sync_fifo is
  Port (clock_in    :in std_logic;
        reset_in    :in std_logic;
        wr_enb_in   :in std_logic;
        rd_enb_in   :in std_logic;
        wr_data_in  :in std_logic_vector(7 downto 0);
        rd_data_out :out std_logic_vector(7 downto 0);
        full_out    :out std_logic;
        empty_out   :out std_logic
         );
end sync_fifo;

architecture Behavioral of sync_fifo is
--signal wr_count     :integer range 0 to 31;--for depth 16
--signal rd_count     :integer range 0 to 31;--for depth 16
signal wr_count     :std_logic_vector(4 downto 0);
signal rd_count     :std_logic_vector(4 downto 0);

--signal wr_count_vec :std_logic_vector(4 downto 0);
--signal rd_count_vec :std_logic_vector(4 downto 0);

--type mem is array (0 to 16) of std_logic_vector(7 downto 0);
--signal core_fifo :mem;

signal reg_1  :std_logic_vector(7 downto 0);
signal reg_2  :std_logic_vector(7 downto 0);
signal reg_3  :std_logic_vector(7 downto 0);
signal reg_4  :std_logic_vector(7 downto 0);
signal reg_5  :std_logic_vector(7 downto 0);
signal reg_6  :std_logic_vector(7 downto 0);
signal reg_7  :std_logic_vector(7 downto 0);
signal reg_8  :std_logic_vector(7 downto 0);
signal reg_9  :std_logic_vector(7 downto 0);
signal reg_10 :std_logic_vector(7 downto 0);
signal reg_11 :std_logic_vector(7 downto 0);
signal reg_12 :std_logic_vector(7 downto 0);
signal reg_13 :std_logic_vector(7 downto 0);
signal reg_14 :std_logic_vector(7 downto 0);
signal reg_15 :std_logic_vector(7 downto 0);
signal reg_16 :std_logic_vector(7 downto 0);

begin
empty_out    <= '1' when (reset_in = '1') else
                '1' when (wr_count = rd_count)else
                '0';
full_out     <= '0' when (reset_in = '1') else
                '1' when ((wr_count(3 downto 0) = rd_count(3 downto 0))
                           and (wr_count(4) /= rd_count(4)))     else
                '0';  
                              
fifo_design_proc:process(clock_in)
variable var_wr_count     :integer range 0 to 15;
variable var_rd_count     :integer range 0 to 15;
begin
  if(clock_in'event and clock_in = '1')then
     if(reset_in = '1')then
        rd_data_out <= (others => '0');
        wr_count    <= (others => '0');
        rd_count    <= (others => '0');
		  reg_1       <= (others => '0');
		  reg_2       <= (others => '0');
		  reg_3       <= (others => '0');
		  reg_4       <= (others => '0');
		  reg_5       <= (others => '0');
		  reg_6       <= (others => '0');
		  reg_7       <= (others => '0');
		  reg_8       <= (others => '0');
		  reg_9       <= (others => '0');
		  reg_10      <= (others => '0');
		  reg_11      <= (others => '0');
		  reg_12      <= (others => '0');
		  reg_13      <= (others => '0');
		  reg_14      <= (others => '0');
		  reg_15      <= (others => '0');
		  reg_16      <= (others => '0');
		  	  
     elsif(wr_enb_in = '1')then 
	     case wr_count(3 downto 0) is
		  when x"0" =>
		     reg_1 <= wr_data_in;
			  
		  when x"1" =>
		     reg_2 <= wr_data_in;
			  
		  when x"2" =>
		     reg_3 <= wr_data_in;
			  
		  when x"3" =>
		     reg_4 <= wr_data_in;
			  
		  when x"4" =>
		     reg_5 <= wr_data_in;
			  
		  when x"5" =>
		     reg_6 <= wr_data_in;
			  
		  when x"6" =>
		     reg_7 <= wr_data_in;
			  
		  when x"7" =>
		     reg_8 <= wr_data_in;
			  
		  when x"8" =>
		     reg_9 <= wr_data_in;
			  
		  when x"9" =>
		     reg_10 <= wr_data_in;
			  
		  when x"a" =>
		     reg_11 <= wr_data_in;
			  
		  when x"b" =>
		     reg_12 <= wr_data_in;
			  
		  when x"c" =>
		     reg_13 <= wr_data_in;
			  
		  when x"d" =>
		     reg_14 <= wr_data_in;
			  
		  when x"e" =>
		     reg_15 <= wr_data_in;
			  
		  when x"f" =>
		     reg_16 <= wr_data_in;			  			  
		  end case; 
		  
          var_wr_count:= conv_integer(wr_count(3 downto 0));
          --core_fifo(var_wr_count) <=wr_data_in;
        if(wr_count = "11111")then
          wr_count <= "00000";
        else
          wr_count <= wr_count + '1';  
        end if;  
          
     elsif(rd_enb_in = '1')then 
	  	  case rd_count(3 downto 0) is
		  when x"0" =>
		     rd_data_out <= reg_1;
			  
		  when x"1" =>
		     rd_data_out <= reg_2;
			  
		  when x"2" =>
		     rd_data_out <= reg_3;
			  
		  when x"3" =>
		     rd_data_out <= reg_4;
			  
		  when x"4" =>
		     rd_data_out <= reg_5;
			  
		  when x"5" =>
		     rd_data_out <= reg_6;
			  
		  when x"6" =>
		     rd_data_out <= reg_7;
			  
		  when x"7" =>
		     rd_data_out <= reg_8;
			  
		  when x"8" =>
		     rd_data_out <= reg_9;
			  
		  when x"9" =>
		     rd_data_out <= reg_10;
			  
		  when x"a" =>
		     rd_data_out <= reg_11;
			  
		  when x"b" =>
		     rd_data_out <= reg_12;
			  
		  when x"c" =>
		     rd_data_out <= reg_13;
			  
		  when x"d" =>
		     rd_data_out <= reg_14;
			  
		  when x"e" =>
		     rd_data_out <= reg_15;
			  
		  when x"f" =>
		     rd_data_out <= reg_16;		
        end case;
		  
          var_rd_count:= conv_integer(rd_count(3 downto 0));
          --rd_data_out <= core_fifo(var_rd_count);
        if(rd_count = "11111")then
         rd_count   <= "00000"; 
        else
         rd_count   <= rd_count + 1;
        end if;
        
     end if;
  end if; 
end process;

end Behavioral;
