//NAME: COMP412
//NETID: comp412
//SIM INPUT: -i 2000 0 1 2 3 4 5 6
//OUTPUT: 56
//
// COMP 412, FALL 1997, Lab 3
// Instruction Scheduling
// report block 3; constrained version of report block 2
//
// Usage before scheduling: ./sim -s 3 -i 2000 0 1 2 3 4 5 6 < report03.i
//
loadI 4		=> r1
loadI 2000	=> r2
load r2		=> r10
add r2, r1	=> r2
load r2		=> r11
add r2, r1	=> r2
load r2		=> r12
add r2, r1	=> r2
load r2		=> r13
add r2, r1	=> r2
load r2		=> r13
add r2, r1	=> r2
load r2		=> r14
add r2, r1	=> r2
load r2		=> r15
mult r15, r14	=> r20
mult r13, r12	=> r21
mult r11, r10	=> r22
add r15, r10	=> r23
add r14, r11	=> r24
add r13, r12	=> r25
add r20, r21	=> r30
add r30, r22	=> r30
add r30, r23	=> r30
add r30, r24	=> r30
add r30, r25	=> r30
add r2, r1	=> r2
store r30	=> r2
output 2028
//end of block 
