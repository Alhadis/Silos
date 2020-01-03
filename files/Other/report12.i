//NAME: COMP412
//NETID: comp412
//SIM INPUT: -i 1024 20 26 0 6
//OUTPUT: 6 26 32
//
// Comp 412, Lab # 3, report12.i
//
// A random, tightly knit computation.
// Needs inputs in 1024, 1028, 1032, and 1036
// Usage before scheduling: ./sim -s 3 -i 1024 20 26 0 6 < report12.i
//
// Note:  Use the specified inputs to avoid overlapping memory locations.
//
loadI 1024 => r0
loadI 1028 => r1
loadI 1032 => r4
loadI 1036 => r20
//
load r0 => r10
load r1 => r11
load r4 => r14
load r20 => r21
//
sub r11,r10 => r2
sub r11,r14 => r3
add r2,r3 => r5
add r4,r2 => r6
add r6,r21 => r16
add r5,r16 => r7
add r11,r3 => r8
add r8,r20 => r9
//
store r2 => r16
store r3 => r7
store r5 => r9
//
output 1044
output 1076
output 1088
