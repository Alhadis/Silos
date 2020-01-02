//NAME: COMP412
//NETID: comp412
//SIM INPUT: -i 1024 5 9
//OUTPUT: 7418880
//
// Comp 412 Lab #3 - report04.i
//
// example from an intro lecture
// Expects initial values in 1024 and 1028
// Usage before scheduling: ./sim -s 3 -i 1024 n n < report04.i
	loadI	1024	=> r8
	loadI	1028	=> r9
	load	r8	=> r8
	load 	r9	=> r9  
	loadI 	1032	=> r10 
	loadI 	1036	=> r11 
	loadI 	1040	=> r12 
	loadI 	1044	=> r13 
	store 	r8	=> r10
	add   	r8, r9	=> r8 
	store 	r8	=> r11
	add   	r8, r9	=> r8 
	store 	r8	=> r12
	store 	r9	=> r13
	load  	r10	=> r1 
	load  	r11	=> r2 
	load  	r12	=> r3 
	lshift 	r1, r9	=> r1 
	mult   	r1, r2	=> r1 
	load  	r13	=> r2 
	mult   	r1, r3	=> r1 
	mult   	r1, r2	=> r1 
	store 	r1	=> r10 
	output  1032
