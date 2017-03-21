`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:15:11 08/18/2010
// Design Name:
// Module Name:    alu
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module alu(
           rst_n,         // negative reset            (input)
           src1,          // 32 bits source 1          (input)
           src2,          // 32 bits source 2          (input)
           ALU_control,   // 4 bits ALU control input  (input)
	   bonus_control, // 3 bits bonus control input(input) 
           result,        // 32 bits result            (output)
           zero,          // 1 bit when the output is 0, zero must be set (output)
           cout,          // 1 bit carry out           (output)
           overflow       // 1 bit overflow            (output)
           );
   

   input           rst_n;
   input [32-1:0]  src1;
   input [32-1:0]  src2;
   input [4-1:0]   ALU_control;
   input   [3-1:0] bonus_control; 

   output [32-1:0] result;
   output          zero;
   output          cout;
   output          overflow;

   reg [32-1:0]    result;
   reg             zero;
   reg             cout;
   reg             overflow;

   
   wire   [32-1:0] res;
   wire            c;
   wire 	   slt;
   wire [32-1:0]   eq; 	   
   wire 	   sign_check, ad;
   wire 	   eql;
   wire 	   set;
   wire 	   v;
   
   
   alu32 a1(.src1(src1),
            .src2(src2),
            .less(set),
            .A_invert(ALU_control[3]),
            .B_invert(ALU_control[2]),
            .cin(ALU_control[2]),
            .operation(ALU_control[1:0]),
            .result(res),
            .cout(c),
	    .eq(eq),
	    .V(v)
            );
   
   assign sign_check = eq[31] ; //(src1[31] ^ src2[31]);
   assign lt = sign_check ? res[31] : src1[31] & ~src2[31];
   assign ad = ALU_control[1] & ~ALU_control[0];
   assign eql = &eq;

   assign set = (~bonus_control[2] & (bonus_control[0] ^ lt)) | bonus_control[1] & eql;
   
 
   always @ ( /*AUTOSENSE*/*  ) begin
      if (rst_n) begin
         result <= res;
	 zero <= ~|res;         
	 cout <= c & ALU_control[1] & ~ALU_control[0];
	 overflow <= v;
	 
/*
	 if ( sign_check ) begin 
	    overflow <= (res[31] ^ src1[31]) & ALU_control[2] & ad;
	 end
	 else begin
	    overflow <= (res[31] ^ src1[31]) & ad;
	 end
*/	 
         
      end 
      
   end
   
   

endmodule
