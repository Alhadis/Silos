//NAME: Greg Lin
//NETID: gel1
//SIM INPUT: -i 2000 10
//OUTPUT: 10 10 10 10 10 10 10 10
//
// COMP 412, Lab 3, 2014 contributed block "gel1.i"
//
// This block contains a large number of independent stores that use addresses
// calculated from loadI values, sums of loadI values, sums of sums of loadI
// values, and so on. This tests how well the scheduler makes loadI comparisons
// and if the scheduler performs simple arithmetic to determine all values that
// should be known.
//
// Usage before scheduling: ./sim -s 3 -i 2000 10 < report05.i
// Given input a, outputs "a a a a a a a a" (repeats a 8x times)
//
loadI 2000 => r13	// r13 = 2000
load r13 => r14	 	// r14 = mem(2000)
loadI 4 => r0 		// r0 = 4
loadI 4 => r1		// r1 = 4
loadI 4 => r2		// r2 = 4
loadI 4 => r3		// r3 = 4
add r0, r1 => r4	// r4 = 8
add r2, r3 => r5	// r5 = 8
add r4, r5 => r6	// r6 = 16
add r5, r6 => r7	// r7 = 24
add r6, r7 => r8	// r8 = 40
add r7, r8 => r9	// r9 = 64
add r8, r9 => r10	// r10 = 104
add r9, r10 => r11 	// r11 = 168
add r10, r11 => r12	// r12 = 272
//
store r14 => r4		// store to 8
store r14 => r5		// store to 8
store r14 => r6		// store to 16
store r14 => r7		// store to 24
store r14 => r8		// store to 40
store r14 => r9		// store to 64
store r14 => r10	// store to 104
store r14 => r11	// store to 168
store r14 => r12	// store to 272
//
loadI 16 => r15		// some direct loads of the sums above
loadI 24 => r16
loadI 40 => r17
//
add r0, r1 => r18	// useless adds. r18 = 8
add r1, r2 => r19	// r19 = 8
add r2, r3 => r20	// r20 = 8
//
store r14 => r15	// store to 16
store r14 => r16	// store to 24
store r14 => r17	// store to 40
store r14 => r18	// store to 8
store r14 => r19	// store to 8
//
output	8
output	16
output	24
output	40
output	64
output	104
output	168
output	272
