//NAME: COMP412
//NETID: comp412
//SIM INPUT:
//OUTPUT: 200
//
// This report block is the contributed block trickystores.i
//
// COMP 412, Lab 3
// Usage before scheduling: ./sim -s 3 <  report14.i
// Expected output: 200
// 
// Maniacal code that tests your store/load
// nopping, because otherwise youll clobber
// memory locations.
//
// Does not need any input memory locations.
//
loadI 1024 => r1
loadI 1024 => r2
loadI 100 => r3
loadI 200 => r4
//
store r3 => r1
store r4 => r2
//
load r1 => r5
store r5 => r2
//
// Should output 200 if all works well
output 1024
// print 200
