library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ULA is
    Port (
        A, B   : in  STD_LOGIC_VECTOR(7 downto 0); -- Entradas de 8 bits
        Op     : in  STD_LOGIC_VECTOR(2 downto 0); -- Seletor de operação
        Resultado : out STD_LOGIC_VECTOR(7 downto 0); -- Saída de 8 bits
        Zero   : out STD_LOGIC -- Indica se o resultado é zero
    );
end ULA;

architecture  Behavioral of ULA is
begin
    process(A, B, Op)
    variable temp_result : STD_LOGIC_VECTOR(7 downto 0);
    begin
        case Op is
            when "00" => temp_result := "00000000";        -- Salto incondicional
            when "01" => temp_result := A + B;             -- sub
            when "10" => temp_result := A - B;             -- soma
            when "11" => temp_result := B;                 -- load imediate
            when others => temp_result := (others => '0'); -- Valor padrão
        end case;
        
        Resultado <= temp_result;
        
        -- Verifica se o resultado é zero
        if temp_result = "00000000" then
            Zero <= '1';
        else
            Zero <= '0';
        end if;
    end process;
end  Behavioral;
 