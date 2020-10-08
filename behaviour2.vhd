LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_arith.all;


ENTITY blinking IS
<<<<<<< HEAD
	PORT(	clk		: IN	std_logic;	
		blk		: IN	std_logic;
		reset		: IN	std_logic;
		blk_output	: OUT	std_logic_vector(1 downto 0);
=======
	PORT(	clk		: IN	std_logic;
		reset		: IN	std_logic;	
		blk_in		: IN	std_logic;
		blk_out		: OUT	std_logic_vector(1 downto 0);
>>>>>>> 2c98460badf8a7b5fd5d485aa296a0f6e9d6e790
		count		: OUT   std_logic_vector(2 downto 0)
		);
END ENTITY;

ARCHITECTURE blinking_rtl OF blinking IS	
<<<<<<< HEAD
	TYPE blk_type IS (vkl, vikl);
=======
	TYPE blk_type IS (turned_on, turned_off);
>>>>>>> 2c98460badf8a7b5fd5d485aa296a0f6e9d6e790
	SIGNAL blink: blk_type;
	signal count_i: std_logic_vector(2 downto 0);
BEGIN
blinking_process:
<<<<<<< HEAD
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
=======
PROCESS(clk,blk_in, reset)
BEGIN 
	IF (reset = '1') THEN
		count_i <= "000";
	END IF;
	IF (rising_edge(clk) AND blk_in='1') THEN
		CASE blink IS
			WHEN turned_on =>
				IF (count_i<"101" AND blk_in='1') 
					THEN count_i <= count_i+'1';
		     		ELSE 
		     			count_i <= "000";
		     			blink <= turned_off;
		    	 	END IF;
			WHEN turned_off =>
				IF (blk_in='1')
				THEN
				count_i <= "000";
				count_i <= count_i+'1';
				blink <= turned_on;
				ELSE
				blink <= turned_off;
>>>>>>> 2c98460badf8a7b5fd5d485aa296a0f6e9d6e790
				END IF;
		END CASE;
	END IF;
END PROCESS blinking_process;

count <= count_i;

out_process: 
PROCESS (blink)
BEGIN
	CASE blink IS
<<<<<<< HEAD
		WHEN vkl =>
			blk_output <= "01";
		WHEN vikl =>
			blk_output <= "10";
=======
		WHEN turned_on =>
			blk_out <= "01";
		WHEN turned_off =>
			blk_out <= "10";
>>>>>>> 2c98460badf8a7b5fd5d485aa296a0f6e9d6e790
	END CASE;
END PROCESS;

END blinking_rtl;
<<<<<<< HEAD
=======



>>>>>>> 2c98460badf8a7b5fd5d485aa296a0f6e9d6e790
