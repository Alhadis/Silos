//NAME: Derek Peirce
//NETID: dtp3
//SIM INPUT: -i 2000 1000 7
//OUTPUT: 7
//
// This block is the 2014 Lab 3 contributed block dtp3.i
//
// Usage before scheduling: ./sim -s 3 -i 2000 1000 7 <  report09.i
//
//This block tests whether or not the scheduler can correctly identify that two registers contain values that are
//different offsets from the same memory value, and therefore must be different, so their stores and loads are independent of each other.
// comments assume value stored at 2000 is 1000, and at 2004 is 7, may be different
loadI 2000 => r1 // r1: 2000
load r1 => r2 // r2: 1000
loadI 4 => r3 // r3: 4
add r2, r3 => r4 // r4: 1004
loadI 8 => r5 // r5: 8
add r2, r5 => r6 // r6: 1008
loadI 2004 => r7 // r7: 2004
load r7 => r7 // r7: 7
store r7 => r4 // mem[1004]: 7 
load r4 => r8 // r8: 7 
store r7 => r6 // mem[1008]: 7 
load r6 => r10 // r10: 7
add r8, r10 => r11 // r11: 14
store r11 => r4 // mem[1004]: 14
load r6 => r12 // r12: 7, this is where the independence is tested
store r12 => r1 // mem[2000]: 7 
output 2000 // output 7
