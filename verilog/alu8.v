module alu8 (/*AUTOARG*/ 
             src1, //8 bit
             src2, //8 bit
             less, //1 bit
             A_invert, //1 bit
             B_invert, //1 bit
             cin, //1 bit
             operation, //2 bit
             result, //8 bit
             cout, //8 bit
             P, //1 bit
             G,  //1 bit
	     eq, //8 bit
) ;
   
   input [8-1:0] src1, src2;
   input         cin, less, A_invert, B_invert;
   input [2-1:0] operation;

   output  P, G;
   output [8-1:0] result;
   wire   [8-1:0] c;
   wire   [8-1:0] p, g;
   output [8-1:0] eq;
   output [8-1:0] cout;
   
   
   cla8 cl(.G(g),
           .P(p),
           .cin(cin),
           .cout(c),
           .Pout(P),
           .Gout(G));
   
   
   alu_top a1(.src1(src1[0]),
              .src2(src2[0]),
              .less(less),
              .A_invert(A_invert),
              .B_invert(B_invert),
              .cin(cin),
              .operation(operation),
              .result(result[0]),
              .p(p[0]),
              .g(g[0]),
	      .eq(eq[0])
              );

   alu_top a2(.src1(src1[1]),
              .src2(src2[1]),
              .less(1'b0),
              .A_invert(A_invert),
              .B_invert(B_invert),
              .cin(c[0]),
              .operation(operation),
              .result(result[1]),
              .p(p[1]),
              .g(g[1]),
	      .eq(eq[1])
              );

   alu_top a3(.src1(src1[2]),
              .src2(src2[2]),
              .less(1'b0),
              .A_invert(A_invert),
              .B_invert(B_invert),
              .cin(c[1]),
              .operation(operation),
              .result(result[2]),
              .p(p[2]),
              .g(g[2]),
	      .eq(eq[2])	      
              );

   alu_top a4(.src1(src1[3]),
              .src2(src2[3]),
              .less(1'b0),
              .A_invert(A_invert),
              .B_invert(B_invert),
              .cin(c[2]),
              .operation(operation),
              .result(result[3]),
              .p(p[3]),
              .g(g[3]),
	      .eq(eq[3])
              );

   alu_top a5(.src1(src1[4]),
              .src2(src2[4]),
              .less(1'b0),
              .A_invert(A_invert),
              .B_invert(B_invert),
              .cin(c[3]),
              .operation(operation),
              .result(result[4]),
              .p(p[4]),
              .g(g[4]),
	      .eq(eq[4])
              );

   alu_top a6(.src1(src1[5]),
              .src2(src2[5]),
              .less(1'b0),
              .A_invert(A_invert),
              .B_invert(B_invert),
              .cin(c[4]),
              .operation(operation),
              .result(result[5]),
              .p(p[5]),
              .g(g[5]),
	      .eq(eq[5])
              );

   alu_top a7(.src1(src1[6]),
              .src2(src2[6]),
              .less(1'b0),
              .A_invert(A_invert),
              .B_invert(B_invert),
              .cin(c[5]),
              .operation(operation),
              .result(result[6]),
              .p(p[6]),
              .g(g[6]),
	      .eq(eq[6])	      
              );

   alu_top a8(.src1(src1[7]),
              .src2(src2[7]),
              .less(1'b0),
              .A_invert(A_invert),
              .B_invert(B_invert),
              .cin(c[6]),
              .operation(operation),
              .result(result[7]),
              .p(p[7]),
              .g(g[7]),
	      .eq(eq[7])	      
              );

   
   assign cout = c;

   
endmodule // alu8
