library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Extensor3para8 is
    Port(
        Entrada : in  STD_LOGIC_VECTOR(2 downto 0);  -- Entrada de 3 bits
        Saida   : out STD_LOGIC_VECTOR(7 downto 0)   -- Saída de 8 bits
    );
end Extensor3para8;

architecture Behavioral of Extensor3para8 is
begin
    -- Preenche os 5 bits superiores com '0' e concatena com a entrada de 3 bits.
    Saida <= "00000" & Entrada;
end Behavioral;
