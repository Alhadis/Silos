//NAME: COMP412
//NETID: comp412
//SIM INPUT: -i 1024 0 1
//OUTPUT: 0 1 1 2 3 5 8 13 21 34 55 89
//
// Comp 412 Lab # 3 - report10.i
//
// Fibonacci numbers, using few registers (6)
// Takes as input the first two numbers in the series at memory 
// locations 1024 and 1028.  These would usually be 0 and 1.
// Usage before scheduling: ./sim -s 3 -i 1024 0 1 < report10.i
//
        loadI   0       => r0 
        loadI   4       => r1 
        loadI   1024    => r2
	load	r2	=> r2
        loadI   1028    => r3
	load	r3	=> r3 
        loadI   2000    => r5
// f0
        store   r2      => r5
// f1
        add     r2,r3   => r4
        add     r3,r0   => r2
        add     r4,r0   => r3
        add     r5,r1   => r5
        store   r2      => r5
// f2
        add     r2,r3   => r4
        add     r3,r0   => r2
        add     r4,r0   => r3
        add     r5,r1   => r5
        store   r2      => r5
// f3
        add     r2,r3   => r4
        add     r3,r0   => r2
        add     r4,r0   => r3
        add     r5,r1   => r5
        store   r2      => r5
// f4
        add     r2,r3   => r4
        add     r3,r0   => r2
        add     r4,r0   => r3
        add     r5,r1   => r5
        store   r2      => r5
// f5
        add     r2,r3   => r4
        add     r3,r0   => r2
        add     r4,r0   => r3
        add     r5,r1   => r5
        store   r2      => r5
// f6
        add     r2,r3   => r4
        add     r3,r0   => r2
        add     r4,r0   => r3
        add     r5,r1   => r5
        store   r2      => r5
// f7
        add     r2,r3   => r4
        add     r3,r0   => r2
        add     r4,r0   => r3
        add     r5,r1   => r5
        store   r2      => r5
// f8
        add     r2,r3   => r4
        add     r3,r0   => r2
        add     r4,r0   => r3
        add     r5,r1   => r5
        store   r2      => r5
// f9
        add     r2,r3   => r4
        add     r3,r0   => r2
        add     r4,r0   => r3
        add     r5,r1   => r5
        store   r2      => r5
// f10
        add     r2,r3   => r4
        add     r3,r0   => r2
        add     r4,r0   => r3
        add     r5,r1   => r5
        store   r2      => r5
// f11
	add	r5,r1	=> r5
	store	r3	=> r5
//
        output  2000
        output  2004
        output  2008
        output  2012
        output  2016
        output  2020
        output  2024
        output  2028
        output  2032
        output  2036
        output  2040
	output  2044
// end of block
