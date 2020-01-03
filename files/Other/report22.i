//NAME:   comp412
//NETID:  comp412
//SIM INPUT: -i 0 1 100
//OUTPUT: 16 65536 43046721
//
// COMP 412, Fall 2016, Lab 3
// Instruction Scheduling
// Report Block
loadI  0    => r0
load  r0    => r1
add   r1,r1 => r2
mult  r2,r2 => r3
mult  r2,r3 => r4
mult  r2,r4 => r5
add   r1,r2 => r6
load  r3    => r7
store r5    => r7
// generated base data ... now for some component trees
add   r0,r2   => r10
mult  r10,r2  => r11
mult  r10,r2  => r12
mult  r10,r2  => r13
mult  r10,r2  => r14
mult  r10,r2  => r15
mult  r10,r2  => r16
mult  r10,r2  => r17
mult  r10,r2  => r18
mult  r11,r12 => r11
mult  r13,r14 => r13
mult  r15,r16 => r15
mult  r17,r18 => r17  
mult  r11,r13 => r11
mult  r15,r17 => r15
mult  r11,r15 => r11
add   r3,r7 => r18
store r11 => r18
//
mult  r6,r6   => r21
mult  r6,r6   => r22
mult  r6,r6   => r23
mult  r6,r6   => r24
mult  r6,r6   => r25
mult  r6,r6   => r26
mult  r6,r6   => r27
mult  r6,r6   => r28
mult  r21,r22 => r21
mult  r23,r24 => r23
mult  r25,r26 => r25
mult  r27,r28 => r27  
mult  r21,r23 => r21
mult  r25,r27 => r25
mult  r21,r25 => r21
add   r3,r18 => r28
store r21 => r28  
output 100
output 104  
output 108


  
