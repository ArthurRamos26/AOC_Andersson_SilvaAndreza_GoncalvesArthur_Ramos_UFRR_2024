library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RAM is
	port(
		Clock : in STD_LOGIC;
		MemWrite : in STD_LOGIC;
		MemRead : in STD_LOGIC;
		Endereco : in STD_LOGIC_VECTOR(7 downto 0);
		InData : in STD_LOGIC_VECTOR(7 downto 0);
		OutData : out STD_LOGIC_VECTOR(7 downto 0)
	);
end RAM;

architecture Behavioral of RAM is
	type ram_array is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
   signal ram : ram_array := (others => (others => '0'));
begin 
	process (Clock) 
		begin 
		if rising_edge(Clock) then
			if MemWrite = '1' then
				ram(conv_integer(Endereco)) <= InData;
			elsif MemRead = '1'then
				OutData <= ram(conv_integer(Endereco));
			end if;	
		end if;
	end process;
end Behavioral;