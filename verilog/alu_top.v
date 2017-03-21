`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:58:01 10/10/2011 
// Design Name: 
// Module Name:    alu_top 
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

module alu_top(
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               result,     //1 bit result   (output)
               //cout,       //1 bit carry out(output)
               p,          //1 bit p
               g,          //1 bit g
	       eq,         //1 bit eq
               );

   input         src1;
   input         src2;
   input         less;
   input 	 A_invert;
   input         B_invert;
   input         cin;
   input [2-1:0] operation;

   output        result;
   //output 	 cout;

   output        p, g;
   
   reg 		 result;
   wire 	 AND, OR, ADD;
   wire 	 in1,in2;
   output 	 eq;	 
   
   assign in1 = A_invert ^ src1;
   assign in2 = B_invert ^ src2;

   assign eq = in1 ^ in2;
   
   assign AND = in1 & in2; //G
   assign OR  = in1 | in2; //P
   assign ADD = eq ^ cin;
   

   assign p = OR;
   assign g = AND;
   
   always@( * )
     begin
	case (operation)
	  2'b00 : result = AND;
	  2'b01 : result = OR;
	  2'b10 : result = ADD;
	  2'b11 : result = less;
	endcase
	
     end

endmodule
