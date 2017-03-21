module mytest;
   wire    cout;
   wire  signed [8-1:0]   res;
   reg   signed [8-1:0]   a, b;
   reg    cin, less, ain, bin;
   reg   [1:0] op;
   parameter stoptime = 1000;

   alu8 m1(.src1(a),
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
      a=8'b0000; b=8'b0000; op=2'b00;
      #10 a=8'b10010110; b=8'b11011011;op=2'b00;
      #10 a=8'b11110001; b=8'b00101110;op=2'b00; 
      #10 a=8'b10100101; b=8'b01010101;op=2'b00;
      #10 a=8'b00111010; b=8'b11001101;op=2'b01;
      $display("OR");
      #10 a=8'b00101110; b=8'b11000101;op=2'b01;
      #10 a=8'b11010010; b=8'b11110001;op=2'b01;   
      #10 a=8'b01000110; b=8'b10000010;op=2'b01;
      #10 a=8'b00010101; b=8'b11111110;op=2'b10;
      $display("add cin=0");      
      #10 a=8'b01101100; b=8'b10010001;op=2'b10;
      #10 a=8'b01010011; b=8'b10010101;op=2'b10;
      #10 a=8'b00110100; b=8'b11110110;op=2'b10;
      #10 cin=1;a=8'b11110000;b=8'b10110000;op=2'b10;
      $display("add cin=1");
      #10 a=8'b00110101; b=8'b10010010;op=2'b10;
      #10 a=8'b10010011; b=8'b11101101;op=2'b10;
      #10 a=8'b00010001; b=8'b10010001;op=2'b10;
   end
   initial begin
      $monitor ($time, "a=%d, b=%d, op=%d, cin=%b, res=%d, cout=%b",a,b,op,cin,res,cout);
   end
endmodule
