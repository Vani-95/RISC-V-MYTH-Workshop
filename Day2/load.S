.section .text
.global load
.type load, @function

load: 
	add a4, a0, zero // Initialize sum reg a4 with 0x0
	add a2, a0, a1 // astore count of 10 in reg a2. Reg a1 is loaded with 0xa(dec 10) from main
	add a3, a0, zero // initialize intermediate reg a3 with 0
	
loop: 
	add a4, a3, a4 // a4= a3+a4, Increment addition
	addi a3, a3, 1 // increment a3 by 1
	blt a3, a2, loop // If a3<a2, branch to label named loop
	add a0, a4, zero // Store final result to a0, so that it can be read by main prgm
	ret // return 

