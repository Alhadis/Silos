//NAME: COMP412
//NETID: comp412
//SIM INPUT:
//OUTPUT: 200 400 800
//
// This report block is the contributed block unrelated_stores.i
//
// COMP 412, Lab 3
// Usage before scheduling: ./sim -s 3 < report15.i
// Expected output: 200 400 800
// 
// Maniacal code that tests your dependence of
// memory operations. Naive code will make all
// memory operations depend on one another; code
// that examines the exact locations in question
// should generate a much tighter schedule.
//
// Does not need any input memory locations.
//
loadI 1024 => r1
loadI 200 => r6
store r6 => r1
//
loadI 1028 => r2
loadI 400 => r7
store r7 => r2
//
loadI 1032 => r3
loadI 600 => r8
store r8 => r3
//
loadI 1036 => r4
loadI 800 => r9
store r9 => r4
//
loadI 1040 => r5
loadI 1000 => r10
store r10 => r5
//
load r1 => r10
load r2 => r9
load r3 => r8
load r4 => r7
load r5 => r6
//
store r10 => r1
store r9 => r3
store r7 => r5
store r8 => r4
store r6 => r2
//
output 1024
// print 200
output 1032
// print 400
output 1040
// print 800
