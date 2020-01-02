//NAME: David Dai
//NETID: wd16
//SIM INPUT:
//OUTPUT: 653 1201 2209

loadI 1 => r0
loadI 1 => r1
loadI 1 => r2
loadI 1024 => r20
loadI 1028 => r21
loadI 1032 => r22


add r0, r1 => r0
add r0, r2 => r0
add r0, r1 => r1
add r1, r2 => r1
add r0, r2 => r2
add r1, r2 => r2
add r0, r1 => r0
add r0, r2 => r0
add r0, r1 => r1
add r1, r2 => r1
add r0, r2 => r2
add r2, r1 => r2


store r2 => r20
store r1 => r22
store r0 => r21
load r22 => r1
load r21 => r0
load r20 => r2

add r0, r1 => r0
add r0, r2 => r0
add r0, r1 => r1
add r1, r2 => r1
add r0, r2 => r2
add r1, r2 => r2
add r0, r1 => r0
add r0, r2 => r0
add r0, r1 => r1
add r1, r2 => r1
add r0, r2 => r2
add r1, r2 => r2

store r0 => r20
store r1 => r21
store r2 => r22


output 1024
output 1028
output 1032
