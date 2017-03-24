module fuckyoubonuslayer (/*AUTOARG*/ 
                          ctrl,
                          bc
                          ) ;
   output [3-1:0] ctrl;
   input  [3-1:0] bc;

   assign ctrl[2] = bc[0] | (~bc[1] & bc[2]);
   assign ctrl[1] = ~bc[2];
   assign ctrl[0] = (bc[1] ^ bc[0]) | bc[2];

   
endmodule // fuckyoubonuslayer
