module cla4 (/*AUTOARG*/
             G,//4 bit
             P,//4 bit
             cin,//1 bit
             cout//4 bit
 ) ;
   input  [4-1:0] G, P;
   input  cin;
   output [4-1:0] cout;

   assign cout[0] = G[0] | (P[0] & cin);
   assign cout[1] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & cin);
   assign cout[2] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & cin);
   assign cout[3] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & cin);
   
endmodule // cla4
