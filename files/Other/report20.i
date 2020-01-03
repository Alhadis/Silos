//NAME: COMP412
//NETID: comp412
//SIM INPUT: -i 1024 3 5
//OUTPUT: 3 5 3 5 3 5 3 5 3 5 40
//
//  This block is the 2013 contributed block s48_crowdedStore.i
//
//
// Yanfei Wu
// 
// This block has crowded dependent stores along with some adding operations
// and independent outputs.
//
// A naive mechanism may separate them sparsely, but a good one should make
// them as compact as possible and hence need less cycles to complete execution,
// because those outputs and stores are independent and the dependent latencies
// between stores may be just one cycle, instead of five cycles.
// The arithmetical operations simply add two input number again and again.
//
// Usage before scheduling: ./sim -s 3 -i 1024 a b < report20.i
// (a and b herein denote integers)
// Expected outputs (in order):
//      a then b for five times, and then (a+b)*5

loadI 1024 => r0
load r0 => r1           // r1 = a
loadI 1028 => r0
load r0 => r2           // r2 = b
loadI 1032 => r50       // memory location for stores: r50 = 1032

store r1 => r50
output 1024
add r1, r2 => r3
store r3 => r50
output 1028
add r3, r1 => r3
store r3 => r50
output 1024
add r3, r2 => r3
store r3 => r50
output 1028
add r3, r1 => r3
store r3 => r50
output 1024
add r3, r2 => r3
store r3 => r50
output 1028
add r3, r1 => r3
store r3 => r50
output 1024
add r3, r2 => r3
store r3 => r50
output 1028
add r3, r1 => r3
store r3 => r50
output 1024
add r3, r2 => r3
store r3 => r50
output 1028
output 1032
