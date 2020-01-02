//NAME:   comp412
//NETID:  comp412
//SIM INPUT: -i 0 1 100
//OUTPUT: 16 65536 43046721 1296
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
add   r3,r12 => r28
store r21 => r28
//---------------------
loadI 1 => r30
mult r30,r2 => r31  
mult r30,r6 => r32  
mult r30,r2 => r33  
mult r30,r6 => r34  
mult r30,r2 => r35  
mult r30,r6 => r36  
mult r30,r2 => r37  
mult r30,r6 => r38
mult r31,r32 => r31  
mult r33,r34 => r33  
mult r35,r36 => r35  
mult r37,r38 => r37
mult r31,r33 => r31  
mult r35,r37 => r35
mult r31,r35 => r31
add  r3,r28  => r38
store r31    => r38
output 100
output 104
output 108
output 112
