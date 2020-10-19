LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_arith.all;


ENTITY blinking IS
	PORT(	clk		: IN	std_logic;
		reset		: IN	std_logic;	
		blk_in		: IN	std_logic;
		blk_out		: OUT	std_logic_vector(1 downto 0);
		count		: OUT   std_logic_vector(2 downto 0)
		);
END ENTITY;

ARCHITECTURE blinking_rtl OF blinking IS	
	TYPE blk_type IS (turned_on, turned_off);
	SIGNAL blink: blk_type;
	signal count_i: std_logic_vector(2 downto 0);
BEGIN

blinking_process:
PROCESS(clk,blk_in, reset)
BEGIN 
	IF (reset = '1') THEN
		count_i <= "001";
		--blink <= turned_off;
	END IF;
	IF (rising_edge(clk) AND blk_in='1') THEN
		CASE blink IS
			WHEN turned_on =>
				IF (count_i<"101") 
					THEN count_i <= count_i+'1';
		     		ELSE 
		     			count_i <= "000";
		     			blink <= turned_off;
		    	 	END IF;
			WHEN turned_off =>
				--IF (blk_in='1')
				--THEN
				count_i <= "000";
				count_i <= count_i+'1';
				blink <= turned_on;
				--ELSE
				--blink <= turned_off;
				--END IF;
		END CASE;
	END IF;
END PROCESS blinking_process;

count <= count_i;

out_process: 
PROCESS (blink)
BEGIN
	CASE blink IS
		WHEN turned_on =>
			blk_out <= "01";
		WHEN turned_off =>
			blk_out <= "10";
	END CASE;
END PROCESS;

END blinking_rtl;
