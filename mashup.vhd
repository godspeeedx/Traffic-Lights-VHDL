LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_arith.all;


ENTITY master_traffic IS
END master_traffic;

ARCHITECTURE mashup_rtl OF master_traffic IS
	SIGNAL master_clk, master_cnt, master_reset, master_blk_start  : std_logic;
	SIGNAL master_output, master_count : std_logic_vector(2 downto 0);
	SIGNAL master_blk_counter_state : std_logic_vector(1 downto 0);
	
	COMPONENT traffic --truee
		PORT (
	clk		: IN	std_logic;
	cnt		: IN	std_logic;
	reset		: IN	std_logic;
	blk_in		: IN	std_logic_vector(1 downto 0);
	blk_out		: OUT	std_logic;
	output		: OUT	std_logic_vector(2 downto 0)
		     );
	END COMPONENT;
	
	COMPONENT tester_traffic
		PORT (
	clk		: OUT	std_logic;
	cnt		: OUT	std_logic;
	reset		: OUT	std_logic;
	output		: IN	std_logic_vector(2 downto 0)
		     );
	END COMPONENT;
	
	COMPONENT blinking
		PORT (
	clk		: IN	std_logic;
	blk_in		: IN	std_logic;
	reset		: IN	std_logic;
	blk_out		: OUT	std_logic_vector(1 downto 0);
	count		: out std_logic_vector(2 downto 0)
		     );
	END COMPONENT;
BEGIN
	num1 : tester_traffic port map (
		clk => master_clk,
		cnt => master_cnt,
		reset => master_reset,
		output => master_output
		);
	num2 : traffic port map (
		clk => master_clk,
		cnt => master_cnt,
		reset => master_reset,
		blk_in => master_blk_counter_state,
		blk_out => master_blk_start,
		output => master_output
		);
	num3 : blinking port map (
		clk => master_clk,
		blk_in => master_blk_start,
		blk_out => master_blk_counter_state,
		count => master_count,
		reset => master_reset
		);
END mashup_rtl;

