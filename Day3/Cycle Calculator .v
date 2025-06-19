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
            
      @1

         $val1[31:0] = >>2$out[3:0];
         $val2[31:0] = $rand2[3:0];

         $sum[31:0] = $val1 + $val2;
         $diff[31:0] = $val1 - $val2;
         $prod[31:0] = $val1 * $val2;
         $div[31:0] = $val1 / $val2;
         
      @2
         $out[31:0] = $reset ? 0 : $valid;

      @2
         $out[31:0] = $reset ? 0 : 
                         ($op == 2'b00) ? $sum : 
                         ($op == 2'b01) ? $diff : 
                         ($op == 2'b10) ? $prod : 
                         $div;


 
   *passed = *cyc_cnt > 40;
   *failed = 1'b0; 

\SV
   endmodule


