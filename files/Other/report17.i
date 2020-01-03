//NAME: COMP412
//NETID: comp412
//SIM INPUT: -i 1024 100 2 3 4
//OUTPUT: 10992 295400
//
// This report block is the contributed block TestTiebreaking.i
//
// Usage before scheduling: ./sim -s 3 -i 1024 100 2 3 4 < report17.i
// A test of tie-breaking heuristics
loadI 1036 => r12
load r12=>r12
loadI 7 =>r15
loadI 2052 =>r13
loadI 1032 =>r4
load r4=>r4
add r4,r4=>r4
loadI 1028 => r2
load r2=>r2
add r2,r2 =>r2
loadI 1024 => r1
load r1=>r1
add r1,r1 => r6
add r12,r6 =>r12
add r12, r15 =>r16
mult r6, r15 =>r12
mult r16,r12 =>r17
store r17=>r13
add r1,r2 => r3
add r6, r3 =>r7
add r7,r7 => r7
add r7,r7 => r7
sub r1,r4 =>r5
mult r3,r5 =>r8
add r7,r8=>r9
loadI 2048=>r10
store r9=>r10
output 2048
output 2052
