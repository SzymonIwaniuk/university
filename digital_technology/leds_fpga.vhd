library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cw4_led is
    port(
        CLOCK_50 : in  std_logic;
        KEY0     : in  std_logic;
        KEY1     : in  std_logic;

        HEX0     : out std_logic_vector(6 downto 0);
        HEX1     : out std_logic_vector(6 downto 0)
    );
end cw4_led;

architecture rtl of cw4_led is

    signal counter : unsigned(25 downto 0) := (others => '0');

    signal position : integer range 0 to 3 := 0;

    signal direction : std_logic := '0';
    signal fast_mode : std_logic := '0';

    signal key0_prev : std_logic := '1';
    signal key1_prev : std_logic := '1';

    signal tick : std_logic := '0';

begin

    -- Dzielnik zegara

    process(CLOCK_50)
    begin
        if rising_edge(CLOCK_50) then

            if fast_mode = '0' then
                if counter = 25000000 then
                    counter <= (others => '0');
                    tick <= '1';
                else
                    counter <= counter + 1;
                    tick <= '0';
                end if;
            else
                if counter = 10000000 then
                    counter <= (others => '0');
                    tick <= '1';
                else
                    counter <= counter + 1;
                    tick <= '0';
                end if;
            end if;

        end if;
    end process;

    -- obsługa przycisków

    process(CLOCK_50)
    begin
        if rising_edge(CLOCK_50) then

            if (key0_prev = '1') and (KEY0 = '0') then
                fast_mode <= not fast_mode;
            end if;

            if (key1_prev = '1') and (KEY1 = '0') then
                direction <= not direction;
            end if;

            key0_prev <= KEY0;
            key1_prev <= KEY1;

        end if;
    end process;


    -- animacja

    process(CLOCK_50)
    begin
        if rising_edge(CLOCK_50) then

            if tick = '1' then

                if direction = '0' then

                    if position = 3 then
                        position <= 0;
                    else
                        position <= position + 1;
                    end if;

                else

                    if position = 0 then
                        position <= 3;
                    else
                        position <= position - 1;
                    end if;

                end if;

            end if;

        end if;
    end process;

    -- sterowanie wyświetlaczami
    -- segmenty aktywne stanem niskim.
    -- "1111111" = wszystko zgaszone

    process(position)
    begin

        HEX0 <= "1111111";
        HEX1 <= "1111111";

        case position is

            when 0 =>
                HEX0 <= "1111001";

            when 1 =>
                HEX0 <= "1001111";

            when 2 =>
                HEX1 <= "1111001";

            when 3 =>
                HEX1 <= "1001111";

            when others =>
                null;

        end case;

    end process;

end rtl;
