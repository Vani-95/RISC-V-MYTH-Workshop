\m5_TLV_version 1d: tl-x.org
\m5
   //use(m5-1.0)   /// uncomment to use M5 macro library.
\SV
    `include "sqrt32.v";
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m5_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   // Pythagoras's Theorm
   |calc
      
      
      @0
         $aa_sq[7:0] = $aa[3:0] * $aa;
         $bb_sq[7:0] = $bb[3:0] * >>7$bb;
      
      @2
         $cc_sq[8:0] = $aa_sq + $bb_sq;
      
      @3
         $cc[4:0] = sqrt($cc_sq);
      
   
   
    
   *passed = *cyc_cnt > 40;
   
\SV
   endmodule
