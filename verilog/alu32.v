module alu32 (/*AUTOARG*/ 
              src1, //32 bit
              src2, //32 bit
              less, //1 bit 
              A_invert,//1 bit
              B_invert,//1 bit
              cin, //1 bit
              operation, //2 bit
              result, //32 bit
              cout, //1 bit
	      slt  //1 bit
) ;
   input [32-1:0] src1, src2;
   input         cin, less, A_invert, B_invert;
   input [2-1:0] operation;
   output        cout, slt;
   output [32-1:0] result;
   wire   [4-1:0] c;
   wire   [4-1:0] p, g;

   //top level carry look ahead
   cla4 cl(.G(g),
        .P(p),
        .cin(cin),
        .cout(c));

   alu8 e1(.src1(src1[8-1:0]),
           .src2(src2[8-1:0]),
           .less(less),
           .A_invert(A_invert),
           .B_invert(B_invert),
           .cin(cin),
           .operation(operation),
           .result(result[8-1:0]),
           .P(p[0]),
           .G(g[0])
           );

   alu8 e2(.src1(src1[16-1:8]),
           .src2(src2[16-1:8]),
           .less(1'b0),
           .A_invert(A_invert),
           .B_invert(B_invert),
           .cin(c[0]),
           .operation(operation),
           .result(result[16-1:8]),
           .P(p[1]),
           .G(g[1])
           );

   alu8 e3(.src1(src1[24-1:16]),
           .src2(src2[24-1:16]),
           .less(1'b0),
           .A_invert(A_invert),
           .B_invert(B_invert),
           .cin(c[1]),
           .operation(operation),
           .result(result[24-1:16]),
           .P(p[2]),
           .G(g[2])
           );

   alu8 e4(.src1(src1[32-1:24]),
           .src2(src2[32-1:24]),
           .less(1'b0),
           .A_invert(A_invert),
           .B_invert(B_invert),
           .cin(c[2]),
           .operation(operation),
           .result(result[32-1:24]),
           .P(p[3]),
           .G(g[3])
           );
   
   assign cout = c[3];
   assign slt = result[31];
   
endmodule // alu32
