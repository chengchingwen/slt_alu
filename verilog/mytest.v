module mytest;
   wire    cout;
   wire signed [4-1:0]   res;
   reg  signed [4-1:0]   a, b;
   reg    cin, less, ain, bin;
   reg   [1:0] op;
   parameter stoptime = 1000;

   alu4 m1(.src1(a),
              .src2(b),
              .less(less),
              .A_invert(ain),
              .B_invert(bin),
              .cin(cin),
              .operation(op),
              .result(res),
              .cout(cout)
              );
   initial begin
      #stoptime $finish;
   end
   initial begin
      less=0;
      ain=0;
      bin=0;
      $display("AND");
      cin=0;
      a=4'b0000; b=4'b0000; op=2'b00;
      #10 a=4'b0110; b=4'b1011;op=2'b00;
      #10 a=4'b0001; b=4'b1110;op=2'b00; 
      #10 a=4'b0101; b=4'b0101;op=2'b00;
      #10 a=4'b1010; b=4'b1101;op=2'b01;
      $display("OR");
      #10 a=4'b1110; b=4'b0101;op=2'b01;
      #10 a=4'b0010; b=4'b0001;op=2'b01;   
      #10 a=4'b0110; b=4'b0010;op=2'b01;
      #10 a=4'b0101; b=4'b1110;op=2'b10;
      $display("add cin=0");      
      #10 a=4'b1100; b=4'b0001;op=2'b10;
      #10 a=4'b0011; b=4'b0101;op=2'b10;
      #10 a=4'b0100; b=4'b0110;op=2'b10;
      #10 cin=1;a=4'b0000;b=4'b0000;op=2'b10;
      $display("add cin=1");
      #10 a=4'b0101; b=4'b0010;op=2'b10;
      #10 a=4'b0011; b=4'b1101;op=2'b10;
      #10 a=4'b0001; b=4'b0001;op=2'b10;
   end
   initial begin
      $monitor ($time, "a=%d, b=%d, op=%d, cin=%b, res=%d, cout=%b",a,b,op,cin,res,cout);
   end
endmodule
