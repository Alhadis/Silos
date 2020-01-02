//NAME: COMP412
//NETID: comp412
//SIM INPUT: -i 2000 0 1 2 3 4 5
//OUTPUT: 37
//
// COMP 412, FALL 1997, Lab 3
// Instruction Scheduling
// report block 1; constrained name space version of test block 
// /clear/courses/comp412/students/ILOC/blocks/lab3/block02.i
//
// Usage before scheduling: ./sim -s 3 -i 2000 0 1 2 3 4 5 < report01.i
//
loadI 4		=> r1
loadI 2000	=> r2
load r2		=> r10
add r2, r1	=> r2
load r2		=> r11
add r10, r11	=> r20
add r2, r1	=> r2
load r2		=> r12
add r2, r1	=> r2
load r2		=> r13
add r12, r13	=> r21
add r2, r1	=> r2
load r2		=> r14
add r2, r1	=> r2
load r2		=> r15
mult r14, r15	=> r22
mult r13, r12	=> r23
add r22, r23	=> r22
add r21, r20	=> r20
add r22, r20	=> r20
add r2, r1	=> r2
store r20	=> r2
loadI 2000	=> r40
load r40	=> r50
add r40, r1	=> r40
load r40	=> r51
mult r50, r51	=> r52
add r40, r1	=> r40
load r40	=> r53
add r40, r1	=> r40
load r40	=> r54
add r54, r53	=> r55
add r55, r52	=> r55
add r55, r20	=> r55
store r55	=> r2
output 2024
//end of block
