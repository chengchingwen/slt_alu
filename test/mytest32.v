module mytest;
   wire  [32-1:0]   res;
   reg   [32-1:0]   a, b;
   wire    zero, cout, overflow;
   reg [4-1:0] ac;
   parameter stoptime = 3000;
   reg [3-1:0] bn;
   
   alu a1(.rst_n(1'b1),
	  .src1(a),
          .src2(b),
	  .ALU_control(ac),
	  .bonus_control(bn),
	  .result(res),
	  .zero(zero),
	  .cout(cout),
	  .overflow(overflow)
          );
   initial begin
      #stoptime $finish;
   end
   initial begin
      a <= 32'h11111111;b <= 32'h11111111;ac <= 4'hd;bn <= 3'h0;
      #100 a <= 32'h11111111;b <= 32'h11111111;ac <= 4'hd;
      #100 a <= 32'hffff0000;b <= 32'h0000ffff;ac <= 4'h0;
      #100 a <= 32'h3113c398;b <= 32'h088e4954;ac <= 4'h1;
      #100 a <= 32'hffffffff;b <= 32'h00000001;ac <= 4'h2;
      #100 a <= 32'h7eda5023;b <= 32'h2ec36ae5;ac <= 4'h6;
      #100 a <= 32'h78563412;b <= 32'h78563412;ac <= 4'h7;bn <= 3'h6;
      #100 a <= 32'hffffffff;b <= 32'h00000001;ac <= 4'h7;bn <= 3'h0;
      #100 a <= 32'h7fee3c5b;b <= 32'h71bcbbfa;ac <= 4'h7;bn <= 3'h3;
      #100 a <= 32'h787207f7;b <= 32'h066926e8;ac <= 4'h7;bn <= 3'h2;
      #100 a <= 32'h4760ee5a;b <= 32'h07c09267;ac <= 4'h7;bn <= 3'h1;
      #100 a <= 32'h11111111;b <= 32'h11111111;ac <= 4'h7;bn <= 3'h4;      

      
   end
   initial begin
      $monitor ($time, "a=%h, b=%h, ac=%h,  res=%h, Z=%b, C=%b, V=%b, bn=%d",a,b,ac,res,zero,cout,overflow, bn);
   end
endmodule
