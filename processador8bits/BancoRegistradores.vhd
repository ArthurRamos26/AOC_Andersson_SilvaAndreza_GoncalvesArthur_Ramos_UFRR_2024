library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BancoRegistradores is
    port(
        Clock : in STD_LOGIC;
        RegWrite : in STD_LOGIC;
        Endereco01 : in STD_LOGIC_VECTOR(1 downto 0);
        Endereco02 : in STD_LOGIC_VECTOR(1 downto 0) := "00"; -- Define padrão
        Data : in STD_LOGIC_VECTOR(7 downto 0);
        Output01 : out STD_LOGIC_VECTOR(7 downto 0);
        Output02 : out STD_LOGIC_VECTOR(7 downto 0)
    );
end BancoRegistradores;

architecture Behavioral of BancoRegistradores is
    type RegArray is array (0 to 7) of STD_LOGIC_VECTOR(7 downto 0); -- Array de registradores
    signal registradores: RegArray := (others => (others => '0'));
    signal Endereco02_Internal: STD_LOGIC_VECTOR(1 downto 0) := "00"; -- Valor padrão
begin

    process (Clock)
    begin
        if rising_edge(Clock) then
            if RegWrite = '1' then
                registradores(conv_integer(unsigned(Endereco01))) <= Data;
            end if;
        end if;
    end process;

    -- Se Endereco02 não estiver conectado, usa o valor padrão "00"
    Endereco02_Internal <= Endereco02 when Endereco02 /= "ZZ" else "00";

    -- Leitura dos registradores
    Output01 <= registradores(conv_integer(unsigned(Endereco01)));
    Output02 <= registradores(conv_integer(unsigned(Endereco02_Internal)));

end Behavioral;
