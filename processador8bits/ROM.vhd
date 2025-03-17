library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ROM is
    Port ( 
		address : in STD_LOGIC_VECTOR(7 downto 0);  -- Endereço (8 bits → 256 posições)
      data_out : out STD_LOGIC_VECTOR(7 downto 0)  -- Instrução de 8 bits
    );
end ROM;

architecture Behavioral of ROM is
begin
    process(address)
    begin
        case address is
            when "00000000" => data_out <= "11000000";  -- LI R1, 0
            when "00000001" => data_out <= "11001111";  -- LI R2, 8
            when "00000010" => data_out <= "11010000";  -- LI R3, 0
            when "00000011" => data_out <= "11011001";  -- LI R4, 1
            when "00000100" => data_out <= "10010110";  -- ADD R3, R4 (Fibonacci inicial)
            
            -- LOOP
            when "00000101" => data_out <= "01110000";  -- SW R3, 000 (Salva Fibonacci)
            when "00000110" => data_out <= "10010110";  -- ADD R3, R4 (Próximo Fibonacci)
            when "00000111" => data_out <= "01011000";  -- LW R4, 000 (Carrega R4 da memória)
            when "00001000" => data_out <= "11100001";  -- ADDI R1, 1 (contador++)
            when "00001001" => data_out <= "00101001";  -- BEQ R2, FIM (Se contador == 8, fim)
            when "00001010" => data_out <= "00000101";  -- JUMP LOOP (Volta para loop)

            -- FIM
            when "00001011" => data_out <= "00000000";  -- JUMP FIM (Loop infinito)
            
            when others => data_out <= "00000000";  -- Default (NOP)
        end case;
    end process;
end Behavioral;
