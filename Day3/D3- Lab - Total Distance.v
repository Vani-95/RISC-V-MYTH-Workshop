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
      
      ?$valid
           
         @1
            $reset = *reset;
            
            $aa_sq[31:0] = $aa[3:0] * $aa;
            $bb_sq[31:0] = $bb[3:0] * $bb;

         @2
            $cc_sq[31:0] = $aa_sq + $bb_sq;

         @3
            $cc[31:0] = sqrt($cc_sq);
            
      @4
         $total_dist[63:0] = $reset ? '0 : 
                             $valid ? >>1$tot_dist + $cc :
                             >>1$tot_dist;
      
   
   
    
   *passed = *cyc_cnt > 16'd30;
   
\SV
   endmodule
