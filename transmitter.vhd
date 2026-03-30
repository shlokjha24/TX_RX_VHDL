library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TxRx is
    Port ( y : out STD_LOGIC_VECTOR(2 downto 0);
            clk : in STD_LOGIC;
            SW : in STD_LOGIC);
end TxRx;

architecture Behavioral of TxRx is

signal clk_cnt : integer := 0;
signal data : STD_LOGIC_VECTOR(7 downto 0) := "10101011";
constant total_clk : integer := 5;
signal temp : STD_LOGIC_VECTOR(2 downto 0) := "000";
signal k : integer := 0;
begin

process(clk,SW)
begin

if rising_edge(clk) then
if SW = '1' then
clk_cnt <= clk_cnt + 1;

if clk_cnt = total_clk then
    clk_cnt <= 0;

if data(k) = '0' then
    temp <= "000";
    else
    temp <= "111";
    end if;
   
    k <= k + 1;
    if k = 7 then
    k <= 0;
    end if;

end if;
end if;
end if;
end process;
y <= temp;
end Behavioral;
