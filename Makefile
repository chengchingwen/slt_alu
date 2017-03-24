TOPMODULE=alu.v


SUB_ALU=alu_top.v cla4.v alu4.v
SUB_ALU8=alu_top.v cla8.v alu8.v
SUB_ALU32=alu_top.v cla8.v alu8.v cla4.v alu32.v
BONUS=fuckyoubonuslayer.v
DOT=alu.dot alu32.dot alu8.dot alu_top.dot cla4.dot cla8.dot fkl.dot
DOTPATH=dot
MYTEST=mytest
MYTEST8=mytest8
MYTEST32=mytest32
GRAPH=graph
VPATH = verilog:test:dot

alu.vvp: testbench.v ${TOPMODULE} ${SUB_ALU32} ${BONUS}
	iverilog -o $@ $+
${MYTEST}.vvp: ${MYTEST}.v ${SUB_ALU}
	iverilog -o $@ $^
${MYTEST8}.vvp: ${MYTEST8}.v ${SUB_ALU8}
	iverilog -o $@ $^
${MYTEST32}.vvp: ${MYTEST32}.v ${TOPMODULE} ${SUB_ALU32} ${BONUS}
	iverilog -o $@ $^
sim: ${MYTEST}.vvp
	vvp $<
sim8: ${MYTEST8}.vvp
	vvp $<
sim32: ${MYTEST32}.vvp
	vvp $<
test: alu.vvp
	cd bonus_data && vvp ../$<
synth: synth.ys
	yosys synth.ys
pre_graph: ${DOT}
	sed -i.bu '/digraph/r  dot/style.txt' $+
graph: pre_graph
	dot ${DOTPATH}/alu.dot -Tpdf -o ${GRAPH}/alu.pdf
	dot ${DOTPATH}/alu32.dot -Tpdf -o ${GRAPH}/alu32.pdf
	dot ${DOTPATH}/alu8.dot -Tpdf -o ${GRAPH}/alu8.pdf
	dot ${DOTPATH}/alu_top.dot -Tpdf -o ${GRAPH}/alu_top.pdf
	dot ${DOTPATH}/cla4.dot -Tpdf -o ${GRAPH}/cla4.pdf
	dot ${DOTPATH}/cla8.dot -Tpdf -o ${GRAPH}/cla8.pdf
	dot ${DOTPATH}/fkl.dot -Tpdf -o ${GRAPH}/flk.pdf



.PHONY: clean
clean:
	rm -f *.vvp
	find . -name "*~" -delete
	find . -name "*.bu" -delete
