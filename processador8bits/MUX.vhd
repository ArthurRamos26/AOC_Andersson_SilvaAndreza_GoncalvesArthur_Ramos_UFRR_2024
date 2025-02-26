library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MUX is
	port(
		InputA, InputB : in STD_LOGIC_VECTOR(7 downto 0);
		Chave : in STD_LOGIC;
		Output : out STD_LOGIC_VECTOR(7 downto 0)
	);
end MUX;

architecture Behavioral of MUX is
	begin 
		process (Chave)
		begin
		case Chave is
			when '0' =>
				Output <= InputA;
			when '1' =>
				Output <= InputA;
			when others =>
				null;
			end case;
		end process;
end Behavioral;