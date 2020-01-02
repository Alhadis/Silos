//NAME: Yi Dai
//NETID: yd9
//SIM INPUT: -i 1024 1056 1052 1048 1044 1040 1036 1032 1028 1024
//OUTPUT: 1032 1028 1024 1036 1056
//
// This block is the 2014 Lab 3 contributed block yd9.i
//
//
// Usage before scheduling: ./sim -s 3 -i 1024 1056 1052 1048 1044 1040 1036 1032 1028 1024 < report16.i
//
// This block tests the intertwined memory operations that do or do not use/refer to the
// same memory addresses. It also includes almost all important possible orderings among
// load, store and output to test on. This is especially helpful when the
// dependency graph has been simplified, user can test to see if the necessary edges are
// there or if there are unnecessary edges.

loadI 1024 => r1
loadI 1028 => r2
loadI 1032 => r3
loadI 1036 => r4
loadI 1040 => r5
loadI 1044 => r6

load r1 => r7
load r2 => r8
load r3 => r9

// stores that use the same memory addresses as the previous loads, but do not use their 
//definitions
store r1 => r2
store r2 => r3
store r3 => r1

// loads that do not use the same memory addresses as the previous stores
load r4 => r10
load r5 => r11
load r6 => r12

//outputs that do not use the same memory addresses as the previous stores
output 1048
output 1052

//output that use the same memory addresses as the previous stores
output 1028

loadI 1048 => r13
loadI 1052 => r14
loadI 1056 => r15

// stores that use the same memory addresses as the previous stores, not the same memory addresses as the previous loads
store r13 => r1
store r14 => r2
store r15 => r3

//stores that do not use the same memory addresses as the previous stores
store r10 => r7
store r11 => r8
store r12 => r9

//loads that use the same memory addresses as the most recent stores
load r7 => r16
load r8 => r17
load r9 => r18

store r1 => r17
store r2 => r18

//loads that do not use the same memory addresses
load r16 => r17
load r17 => r18

store r3 => r17
store r4 => r18

output 1028
output 1032
