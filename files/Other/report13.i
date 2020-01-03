//NAME: COMP412
//NETID: comp412
//SIM INPUT: -i 2016 4
//OUTPUT: 8 2024
//
// This report block is the contributed block jwc.i
//
// Usage before scheduling: ./sim -s 3 -i 2016 4 < report13.i
//
// Expected output: 8 2024
// for the simulation, value at mem(2016) was set to 4
loadI 2016 => r0
// r0 = 2016
loadI 8 => r1
// r1 = 8
loadI 2000 => r2
// r2 = 2000
loadI 2004 => r3
// r3 = 2004
load r0 => r4
// r4 = mem(2016) (= 4, unknown to compiler)
sub r3, r4 => r5
// r5 = 2004 - r4 (= 2000, unknown to compiler)
sub r0, r1 => r6
// r6 = 2016 - 8 = 2008
sub r6, r1 => r7
// r7 = 2008 - 8 = 2000
store r0 => r5
// 2016 => mem(r5) (= mem(2000), unknown to compiler)
store r1 => r7
// 8 => mem(2000)
load r5 => r8
// r8 = mem(r5) (= 8, unknown to compiler)
add r0, r8 => r9
// r9 = 2016 + r8 (= 2024, unknown to compiler)
store r9 => r3
// r9 => mem(2004)
output 2000
// print 8
output 2004
// print 2024
