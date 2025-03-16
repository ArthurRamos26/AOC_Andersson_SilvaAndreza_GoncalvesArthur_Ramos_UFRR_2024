library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity programCounter is
    port(
        Clock: in std_logic;
        EnderecoEntrada: in std_logic_vector(7 downto 0);
        EnderecoSaida: out std_logic_vector(7 downto 0)
    );
end programCounter;

architecture beh of programCounter is
    -- Usamos o tipo unsigned para realizar operações aritméticas
    
begin

    process(clock)
    begin
       if rising_edge(clock) then
          -- Atualiza o endereço: soma 1 ao valor de enderecoEntrada
          EnderecoSaida <= EnderecoEntrada;
       end if;
    end process;
   
end beh;
