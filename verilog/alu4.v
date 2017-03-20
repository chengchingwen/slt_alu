module alu4 (/*AUTOARG*/ 
             src1, //4 bit
             src2, //4 bit
             less, //1 bit
             A_invert, //1 bit
             B_invert, //1 bit
             cin, //1 bit
             operation, //2 bit
             result, //4 bit
             cout //1 bit
) ;
   
   input [4-1:0] src1, src2;
   input         cin, less, A_invert, B_invert;
   input [2-1:0] operation;
   output        cout;
   output [4-1:0] result;
   reg   [4-1:0] result;

   wire   [4-1:0] res;
   wire   [4-1:0] c;
   wire   [4-1:0] p, g;

   cla4 cl(.G(g),
        .P(p),
        .cin(cin),
        .cout(c));
   
   
   alu_top a1(.src1(src1[0]),
              .src2(src2[0]),
              .less(less),
              .A_invert(A_invert),
              .B_invert(B_invert),
              .cin(cin),
              .operation(operation),
              .result(res[0]),
              .p(p[0]),
              .g(g[0])
              );

   alu_top a2(.src1(src1[1]),
              .src2(src2[1]),
              .less(less),
              .A_invert(A_invert),
              .B_invert(B_invert),
              .cin(c[0]),
              .operation(operation),
              .result(res[1]),
              .p(p[1]),
              .g(g[1])
              );

   alu_top a3(.src1(src1[2]),
              .src2(src2[2]),
              .less(less),
              .A_invert(A_invert),
              .B_invert(B_invert),
              .cin(c[1]),
              .operation(operation),
              .result(res[2]),
              .p(p[2]),
              .g(g[2])
              );

   alu_top a4(.src1(src1[3]),
              .src2(src2[3]),
              .less(less),
              .A_invert(A_invert),
              .B_invert(B_invert),
              .cin(c[2]),
              .operation(operation),
              .result(res[3]),
              .p(p[3]),
              .g(g[3])
              );
   
   assign cout = c[3];
   always @ ( /*AUTOSENSE*/* ) begin
      result = res;
      
   end

   
   
endmodule // alu4
