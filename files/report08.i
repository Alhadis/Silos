//NAME: Jonathan Jao
//NETID: jfj2
//SIM INPUT:
//OUTPUT: 7 50
//
// This block is the 2014 Lab 3 contributed block jfj2.i
//
// Usage before scheduling: ./sim -s 3 <  report08.i
//
//This testlock tests for correct dependence when 
//scheduling by mangling the store address.
//Without scheduling this testblock executes 
//16 instructions and 16 operations in 26 cycles.
//
loadI 1028 => r0

loadI 7 => r20
store r20 => r0
output 1028

loadI 6 => r1
loadI 4 => r2
mult r1,r2 => r3

loadI 1 => r5
loadI 2 => r4
mult r0, r4 => r0
rshift r0, r5 => r0

add r0,r3 => r7
loadI 50 => r8
sub r7,r3 => r9
store r8 => r9
output 1028
