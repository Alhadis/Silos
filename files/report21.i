//NAME:   comp412
//NETID:  comp412
//SIM INPUT: -i 0 1 100
//OUTPUT: 16 65536 43046721 1679616
//
// COMP 412, Fall 2016, Lab 3
// Instruction Scheduling
// Report Block
loadI  0 => r0
load  r0 => r1
add   r1,r1 => r2
mult  r2,r2 => r3
mult  r2,r3 => r4
mult  r2,r4 => r5
add   r1,r2 => r6
load  r3 => r7
store r5 => r7
// generated base data ... now for some component trees
loadI 1 => r10
mult  r10,r2 => r11
mult  r11,r2 => r11
mult  r11,r2 => r11
mult  r11,r2 => r11
mult  r11,r2 => r11
mult  r11,r2 => r11
mult  r11,r2 => r11
mult  r11,r2 => r11
mult  r11,r2 => r11
mult  r11,r2 => r11
mult  r11,r2 => r11
mult  r11,r2 => r11
mult  r11,r2 => r11
mult  r11,r2 => r11
mult  r11,r2 => r11
mult  r11,r2 => r11
add   r3,r7 => r12
store r11 => r12
//---------------------
loadI 1 => r20
mult  r20,r6  => r21
mult  r21,r6  => r21
mult  r21,r6  => r21
mult  r21,r6  => r21
mult  r21,r6  => r21
mult  r21,r6  => r21
mult  r21,r6  => r21
mult  r21,r6  => r21
mult  r21,r6  => r21
mult  r21,r6  => r21
mult  r21,r6  => r21
mult  r21,r6  => r21  
mult  r21,r6  => r21
mult  r21,r6  => r21
mult  r21,r6  => r21
mult  r21,r6  => r21
add   r3,r12  => r22
store r21     => r22  
//---------------------
loadI 1 => r30
mult  r30,r2 => r30
mult  r30,r6 => r30
mult  r30,r2 => r30
mult  r30,r6 => r30
mult  r30,r2 => r30
mult  r30,r6 => r30
mult  r30,r2 => r30
mult  r30,r6 => r30
mult  r30,r2 => r30
mult  r30,r6 => r30
mult  r30,r2 => r30
mult  r30,r6 => r30
mult  r30,r2 => r30
mult  r30,r6 => r30
mult  r30,r2 => r30
mult  r30,r6 => r30
add   r3,r22 => r31
store r30 => r31
output 100
output 104
output 108
output 112  
  
