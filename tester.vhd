LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_arith.all;


ENTITY tester_traffic IS
	PORT (
		clk	: OUT	std_logic;
		cnt	: OUT	std_logic;
		reset	: OUT	std_logic;
		output	: IN	std_logic_vector(2 downto 0)
		);
END ENTITY;

ARCHITECTURE rtl_test OF tester_traffic IS

CONSTANT period : TIME := 1 ns;
CONSTANT period2 : TIME := 19 ns;
CONSTANT period3 : TIME := 2000000 ns;

BEGIN

clock_process : PROCESS --тактовая
    BEGIN 
        clk <= '0';
        WAIT FOR period;
        clk <= '1';
        WAIT FOR period;
END PROCESS clock_process;

change_process : PROCESS
    BEGIN 
        cnt <= '0';
        WAIT FOR period2;
        cnt <= '1';
        WAIT FOR period;
        cnt <= '0';
END PROCESS change_process;

reset_process : PROCESS
    BEGIN 
        reset <= '1';
        WAIT FOR 10 ns;
        reset <= '0';
        WAIT FOR period3;
END PROCESS reset_process;


END rtl_test;




