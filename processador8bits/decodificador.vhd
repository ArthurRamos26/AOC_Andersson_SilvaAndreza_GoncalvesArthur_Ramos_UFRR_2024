library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DecodificadorInstrucoes is
	port(
		Clock : in STD_LOGIC;
		Input : in STD_LOGIC_VECTOR(7 downto 0);
		OutUniCon : out STD_LOGIC_VECTOR(2 downto 0);
		OutBancoRes1, OutBancoRes2 : out STD_LOGIC_VECTOR(1 downto 0);
		OutImediate : out STD_LOGIC_VECTOR(3 downto 0)
		
	);
end DecodificadorInstrucoes;

architecture Behavioral of DecodificadorInstrucoes is
	signal opcode      : std_logic_vector(2 downto 0);
   signal registrador1, resistrador2 : std_logic_vector(1 downto 0);
   signal imediate    : std_logic_vector(2 downto 0);
begin 
	process (Clock)
	begin
		if rising_edge(clk) then
			opcode      <= instrucao(7 downto 5);  
			registrador1 <= instrucao(4 downto 3);
			registrador1 <= instrucao(2 downto 1);
			imediate <= instrucao(2 downto 0);
	  end if;
	end process;
	OutUniCon <= opcode;
	
	