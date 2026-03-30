library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reci is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC;
           x : in std_logic_vector(2 downto 0);
           cout : out STD_LOGIC);
end reci;

architecture Behavioral of reci is

signal clk_cnt : integer := 0;
signal y_out : std_logic := '0';

constant ttl_cnt : integer := 5;
 
begin


process(clk, sw, x)
begin

if rising_edge(clk) then
if sw = '1' then
clk_cnt <= clk_cnt+1;

if clk_cnt = ttl_cnt then
clk_cnt <= 0;

if x = "111" then
y_out <= '1';

elsif x = "011" then
y_out <= '1';

elsif x = "101" then
y_out <= '1';

elsif x = "110" then
y_out <= '1';

else
y_out <= '0';
end if;

end if;
end if;
end if;

end process;

cout <= y_out;

end Behavioral;
