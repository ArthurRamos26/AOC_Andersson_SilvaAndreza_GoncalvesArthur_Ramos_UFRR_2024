library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Extensor5para8 is
    Port(
        Entrada : in  STD_LOGIC_VECTOR(4 downto 0);  -- Entrada de 3 bits
        Saida   : out STD_LOGIC_VECTOR(7 downto 0)   -- Saída de 8 bits
    );
end Extensor5para8;

architecture Behavioral of Extensor5para8 is
begin
    -- Preenche os 5 bits superiores com '0' e concatena com a entrada de 3 bits.
    Saida <= "000" & Entrada;
end Behavioral;
