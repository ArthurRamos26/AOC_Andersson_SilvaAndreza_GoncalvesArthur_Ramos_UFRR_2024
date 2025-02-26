library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UnidadeControle	is 
	Port(
		OpCode : in STD_LOGIC_VECTOR(2 downto 0);
		Branch : out STD_LOGIC;
		ULAOp : out STD_LOGIC_VECTOR(1 downto 0);
		MemWrite : out STD_LOGIC;
		Jump : out STD_LOGIC;
		ResWrite : out STD_LOGIC;
		MemLoad : out STD_LOGIC;
		MemtoReg : out STD_LOGIC;
		ULASrc : out STD_LOGIC
	);
	
end UnidadeControle;

architecture Behavioral of UnidadeControle is
begin
	process(OpCode)
	begin
		-- valores padrões
		Branch <= '0';
		ULAOp <= "00";
		MemWrite <= '0';
		Jump <= '0';
		ResWrite <= '0';
		MemLoad <= '0';
		MemtoReg <= '0';
		ULASrc <= '0';
		
		-- operações unidade de controle
		case OpCode is
			when "000" =>
				Jump <= '1';	   -- salto incondicional
			when "001" => 
				Branch <= '1';    -- beq
				ULAOp <= "01";
			when "010" =>
				MemLoad <= '1';   -- load word 
				MemtoReg <= '1';
				ResWrite <= '1'; 
				ULAOp <= "10";
			when "011" =>
				ULASrc <= '1';    -- store word
				ULAOp <= "10";
				MemWrite <= '1';
			when "100" =>
				ULAOp <= "10";    -- soma 
				ResWrite <= '1';
			when "101" =>
				ULAOp <= "01";    -- subtração
				ResWrite <= '1'; 
			when "110" =>
				ULASrc <= '1';	   -- load imediato
				ULAOp <= "10";
				ResWrite <= '1';
			when "111" =>
				ULASrc <= '1';    -- soma imediato 
				ULAOp <= "11";
				ResWrite <= '1';
			when others => 
				null;
		end case;
	end process;
end Behavioral;
				