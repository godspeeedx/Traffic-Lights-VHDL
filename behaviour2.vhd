LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_arith.all;


ENTITY blinking IS
	PORT(	clk		: IN	std_logic;	
		blk		: IN	std_logic;
		reset		: IN	std_logic;
		blk_output	: OUT	std_logic_vector(1 downto 0);
		count		: OUT   std_logic_vector(2 downto 0)
		);
END ENTITY;

ARCHITECTURE blinking_rtl OF blinking IS	
	TYPE blk_type IS (vkl, vikl);
	SIGNAL blink: blk_type;
	signal count_i: std_logic_vector(2 downto 0);
BEGIN
blinking_process:
PROCESS(clk,blk, reset)
BEGIN 
	--IF (reset = '1') THEN
	--	count_i <= "000";
	IF (rising_edge(clk) AND blk='1') THEN
		CASE blink IS
			WHEN vkl =>
				IF (count_i<"101" AND blk='1') 
					THEN count_i <= count_i+'1';
		     		ELSE 
		     			count_i <= "000";
		     			blink <= vikl;
		    	 	END IF;
			WHEN vikl =>
				IF (blk='1')
				THEN
				count_i <= count_i+'1';
				blink <= vkl;
				ELSE
				blink <= vikl;
				END IF;
		END CASE;
	END IF;
END PROCESS blinking_process;

count <= count_i;

out_process: 
PROCESS (blink)
BEGIN
	CASE blink IS
		WHEN vkl =>
			blk_output <= "01";
		WHEN vikl =>
			blk_output <= "10";
	END CASE;
END PROCESS;

END blinking_rtl;
