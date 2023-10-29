library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.math_real.all;

  entity fgen is 
  port(cnt: in std_logic_vector(7 downto 0);
          OE,CLK,M1,M2: in std_logic;
       q: out std_logic_vector(7 downto 0));
		   
		 end fgen;
		 architecture arc of fgen is
    type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10,
                        s11, s12, s13, s14, s15, s16, s17, s18, s19, s20,
                        s21, s22, s23, s24, s25, s26, s27, s28, s29, s30,
                        s31, s32, s33, s34, s35, s36, s37, s38, s39,s40,s41); 
                        
    signal state: state_type;
    signal count: unsigned (5 downto 0);
	 signal triangle_temp: std_logic_vector( 7 downto 0);
 
 begin
    process (clk)
    begin 
        if rising_edge(clk) then
            if oe = '1' and m1 = '0' and m2 = '0' then
                q <= cnt;
					 elsif oe = '1' and m1 = '1' and m2 ='0' then----square wave
					 case state is 
					 when s0=> q<="11111111";
					 IF count= 19 then
					 state <= s1;
					 count<=(others=>'0');
					 ELSE count<=count+1;
					 END if;
					 when s1=> q<="00000000";
					 IF count= 19 then
					 state <= s0;
					 count<=(others=>'0');
					 ELSE count<=count+1;
					 END IF;
                    when others =>
                        state <= s0;
                        end case;
			elsif rising_edge(clk) then -----triangle wave
			  if oe = '1' and m1 = '0' and m2 = '1' then
			  case state is
			  when  s0=>
			          q <=triangle_temp;
						 if triangle_temp = 228 then
						  state <= s1;
						  else
						  triangle_temp <= triangle_temp +(256/20);
						  end if;
						  when  s1=>
			          q <=triangle_temp;
						 if triangle_temp = 12 then
						  state <= s0;
						  else
						  triangle_temp <= triangle_temp -(256/20);
						  end if;
						  when others  =>
						   state<= s0;
							end case;
			            
				elsif rising_edge(clk) then------sine wave 
				if oe = '1' and m1 = '1' and m2 = '1' then
			  case state is
			  when s0=> q  <="10000000";
			           state <= s1;
			  when s1=> q <= "10010011";
			             state <= s2;
			  when s2=> q <= "10100111";
			             state <=s3;
			  when s3=> q <= "10111001";
			             state<= s4;
			  when s4=>  q <= "11001010";
			             state<= s5;
			  when s5=> q <= "11011010";
							 state<= s6;
			  when s6=> q <= "11100111";
			              state<= s7;
			  when s7=> q <= "11110001";
			              state<= s8;
			  when s8=> q <= "11111001";
			              state<= s9;
			  when s9=> q <= "11111101";
			              state<= s10;
			  when s10=> q <= "11111111";
			              state<= s11;
			  when s11=> q <= "11111101";
			              state<= s12;	
			  when s12=> q <= "11111001";
			              state<= s13;	
			  when s13=> q <= "11110001";
			              state<= s14;
			  when s14=> q <= "11100111";
			              state<= s15;
			  when s15=> q <= "11011010";
			              state<= s16;
		     when s16=> q <= "11001010";
			              state<= s17;	
			  when s17=> q <= "10111001";
			              state<= s18;	
			  when s18=> q <= "10100111";
			              state<= s19;
			  when s19=> q <= "10010011";
			              state<= s20;	
			  when s20=> q <= "10000000";
			              state<= s21;
			  when s21=> q <= "01101100";
			              state<= s22;
			  when s22=> q <= "01011000";
			              state<= s23;
			  when s23=> q <= "01000110";
			              state<= s24;
			  when s24=> q <= "00110101";
			              state<= s25;
			  when s25=> q <= "00100101";
			              state<= s26;
			  when s26=> q <= "00011000";
			              state<= s27;
			  when s27=> q <= "00001110";
			              state<= s28;
			  when s28=> q <= "00000110";
			              state<= s29;	
			  when s29=> q <= "00000010";
			              state<= s30;	
			  when s30=> q <= "00000000";
			              state<= s31;
			  when s31=> q <= "00000010";
			              state<= s32;
			  when s32=> q <= "00000110";
			              state<= s33;
			  when s33=> q <= "00001110";
			              state<= s34;
			  when s34=> q <= "00011000";
			              state<= s35;	
			  when s35=> q <= "00100101";
			              state<= s36;
			  when s36=> q <= "00110101";
			              state<= s37;
			  when s37=> q <= "01000110";
			              state<= s38;
			  when s38=> q <= "01011000";
			              state<= s39;
			  when s39=> q <= "01101100";
			              state<= s0;
				when others => state <= s0;
         end case;
         end if;			
			end if;
		   end if;	
			end if;
	         			
			end process;

             
    end architecture arc;






					 
					 
					 
					 
					 
					 
					 
					 
 