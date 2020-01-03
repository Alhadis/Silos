//NAME: COMP412
//NETID: comp412
//SIM INPUT:
//OUTPUT: 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4
//
//  This block is the 2013 contributed block s52_test.i
//
// Usage before scheduling: ./sim -s 3 < report19.i
// based on the prasad.i
// memory references, especially the dependence of output and store
loadI 1024 => r0
loadI 1028 => r1
loadI 0 => r2
loadI 4 => r3
// Start store from 1024, then test loads after the store
store r2 => r0
// This load should not depend on "store r2 => r0"
load r1 => r4
// This load should depend on "store r2 => r0"
load r0 => r5
loadI 1024 => r6
// This load should also depend on "store r2 => r0"
load r6 => r7
// This store should depend on "store r2 => r0", "load r0 => r5", and "load r6
// => r7"
store r3 => r0
// Obfuscate this load -- should still depend on "store r3 = > r0"
add r0, r2 => r8
load r8 => r9
output 1024
output 1024
output 1024
output 1024
output 1024
output 1024
output 1024
output 1024
output 1024
output 1024
output 1024
output 1024
output 1024
output 1024
output 1024
output 1024
output 1024
output 1024
output 1024
output 1024
store r0 => r8
