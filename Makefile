TOPMODULE=alu.v


SUB_ALU=alu_top.v cla4.v alu4.v
SUB_ALU8=alu_top.v cla8.v alu8.v
SUB_ALU32=alu_top.v cla8.v alu8.v cla4.v alu32.v

MYTEST=mytest
MYTEST8=mytest8
MYTEST32=mytest32

VPATH = verilog:test

alu.vvp: testbench.v ${TOPMODULE} ${SUB_ALU32} 
	iverilog -o $@ $+
${MYTEST}.vvp: ${MYTEST}.v ${SUB_ALU}
	iverilog -o $@ $^
${MYTEST8}.vvp: ${MYTEST8}.v ${SUB_ALU8}
	iverilog -o $@ $^
${MYTEST32}.vvp: ${MYTEST32}.v ${TOPMODULE} ${SUB_ALU32}
	iverilog -o $@ $^
sim: ${MYTEST}.vvp
	vvp $<
sim8: ${MYTEST8}.vvp
	vvp $<
sim32: ${MYTEST32}.vvp
	vvp $<
test: alu.vvp
	cd bonus_data && vvp ../$< 
.PHONY: clean
clean:
	rm -f *.vvp
	find . -name *~ -delete
