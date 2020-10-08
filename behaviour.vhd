LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_arith.all;


ENTITY traffic IS
	PORT(	clk	: IN	std_logic;
		cnt	: IN	std_logic;
		reset	: IN	std_logic;
		blk_in  : IN	std_logic_vector(1 downto 0);
		blk_out : OUT   std_logic;
		output	: OUT	std_logic_vector(2 downto 0)
		);
END ENTITY;

<<<<<<< HEAD
ARCHITECTURE rtl OF traffic IS
	TYPE state_type IS (Init, R, RG, G, GR, BLK, GBLK);
=======
change huenge

ARCHITECTURE rtl OF traffic IS
	TYPE state_type IS (Init, R, Y1, G, Y2, BLK, GBLK);
>>>>>>> 2c98460badf8a7b5fd5d485aa296a0f6e9d6e790
	SIGNAL state: state_type;
BEGIN

state_proc: 
PROCESS (clk, reset)
BEGIN
	IF reset = '1' 
		THEN state <= Init;
	ELSIF (rising_edge(clk)) THEN
		CASE state IS
			WHEN Init => 
				IF cnt = '1' 
					THEN state <= R; 
				ELSE 
					state <= Init;
				END IF;
			WHEN R => 
				IF cnt = '1' 
<<<<<<< HEAD
					THEN state <= RG; 
				ELSE 
					state <= R;
				END IF;
			WHEN RG => 
				IF cnt = '1' 
					THEN state <= G; 
				ELSE 
					state <= RG;
=======
					THEN state <= Y1; 
				ELSE 
					state <= R;
				END IF;
			WHEN Y1 => 
				IF cnt = '1' 
					THEN state <= G; 
				ELSE 
					state <= Y1;
>>>>>>> 2c98460badf8a7b5fd5d485aa296a0f6e9d6e790
				END IF;
			WHEN G => 
				IF cnt = '1' 
					THEN state <=BLK;      
				ELSE 
					state <= G;
				END IF;
			WHEN BLK => 
				IF blk_in = "01"
					THEN state <= GBLK; 
				END IF;
				IF blk_in = "10"
<<<<<<< HEAD
					THEN state <= GR;
=======
					THEN state <= Y2;
>>>>>>> 2c98460badf8a7b5fd5d485aa296a0f6e9d6e790
				END IF;
			WHEN GBLK => 
				IF blk_in = "01"
					THEN state <= BLK;
				END IF; 
				IF blk_in = "10"
<<<<<<< HEAD
					THEN state <= GR;
				END IF;
			WHEN GR => 
				IF cnt = '1' 
					THEN state <= R; 
				ELSE 
					state <= GR;
=======
					THEN state <= Y2;
				END IF;
			WHEN Y2 => 
				IF cnt = '1' 
					THEN state <= R; 
				ELSE 
					state <= Y2;
>>>>>>> 2c98460badf8a7b5fd5d485aa296a0f6e9d6e790
				END IF;
		END CASE;
	END IF;
END PROCESS;

out_proc: 
<<<<<<< HEAD
PROCESS (state)
BEGIN
=======
PROCESS (state, reset)
BEGIN
 	IF reset = '1' 
		THEN blk_out <= '0';
	END IF;
>>>>>>> 2c98460badf8a7b5fd5d485aa296a0f6e9d6e790
	CASE state IS
		WHEN Init =>
			output <= "000";
		WHEN R =>
			output <= "100";
<<<<<<< HEAD
		WHEN RG =>
			output <= "010";
		WHEN G =>
			output <= "001";
		WHEN GR =>
=======
		WHEN Y1 =>
			output <= "010";
		WHEN G =>
			output <= "001";
		WHEN Y2 =>
>>>>>>> 2c98460badf8a7b5fd5d485aa296a0f6e9d6e790
			blk_out <= '0';
			output <= "010";
		WHEN BLK =>
			blk_out <= '1';
			output <= "000";
		WHEN GBLK =>
			blk_out <= '1';
			output <= "111";
	END CASE;
END PROCESS;
END rtl;
<<<<<<< HEAD
=======



>>>>>>> 2c98460badf8a7b5fd5d485aa296a0f6e9d6e790
