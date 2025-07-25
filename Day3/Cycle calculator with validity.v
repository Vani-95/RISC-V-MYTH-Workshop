\m5_TLV_version 1d: tl-x.org
\m5
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   
   // Calculator
   
   |calc
      @0
         $reset = *reset;
         
      @1
         $valid = $reset ? 0 : >>1$valid + 1;
         $valid_or_reset = $valid || $reset;
         $val1[31:0] = >>2$out;
         $val2[31:0] = $rand2[3:0];
      ?$valid
         
         ?$valid_or_reset
            
            @1
               
               $sum[31:0] = $val1 + $val2;
               $diff[31:0] = $val1 - $val2;
               $prod[31:0] = $val1 * $val2;
               $div[31:0] = $val1 / $val2;

            @2
               
               $mem[31:0] = $reset ? 0 :
                            ($op[2:0] == 3'b101) ? $val1 :
                            >>2$mem;
               
               $out[31:0] = $reset ? '0 : 
                            ($op[2:0] == 3'b000) ? $sum : 
                            ($op[2:0] == 3'b001) ? $diff : 
                            ($op[2:0] == 3'b010) ? $prod : 
                            ($op[2:0] == 3'b011) ? $div :
                            >>2$mem;

               $out[31:0] = >>1$out;
               
               

 
!   *passed = *cyc_cnt > 40;
//  *failed = 1'b0; 

\SV
   endmodule


