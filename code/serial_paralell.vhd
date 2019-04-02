 library ieee;  
 use ieee.std_logic_1164.all;  
 ENTITY serial_paralell IS  
 port   
 (  
      clk : in std_logic;  
      clear : in std_logic;  
      dado_entrada : in std_logic;  
      dado_saida : out std_logic  
 );  
 end serial_paralell; 

 
 architecture behavior of serial_paralell is  
		signal dado_registrado : std_logic_vector (3 downto 0);  
 begin  
	dado_saida <= dado_registrado(0);  
	process(clk, clear)  
	begin  
		if (clear = '1') then  
			dado_registrado <= "0000";  
		elsif rising_edge(clk) then  
			dado_registrado(3) <= dado_entrada;  
			dado_registrado(2 downto 0) <= dado_registrado(3 downto 1);  
		end if;  
	end process;  
 end architecture behavior;