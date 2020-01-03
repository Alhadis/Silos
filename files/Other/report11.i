//NAME: COMP412
//NETID: comp412
//SIM INPUT: -i 1024 0 1
//OUTPUT: 0 1 1 2 3 5 8 13 21 34 55 89
//
// Comp 412 Lab #3 - report11.i
//
// Fibonnaci numbers, using more registers (15)
// Takes as input the first two numbers in the series at memory
// locations 1024 and 1028.  These would usually be 0 and 1.
// Usage before scheduling: ./sim -s 3 -i 1024 0 1 < report11.i
//
// Does the difference between report blocks 10 & 11 show up in the performance
// of the final scheduled code?
//
        loadI   0       => r0
        loadI   4       => r1
        loadI   1024    => r2
	load	r2	=> r2
        loadI   1028    => r3
	load	r3	=> r3
        loadI   2000    => r14
// f0
        store   r2      => r14
// f1
        add     r2,r3   => r4
        add     r14,r1  => r14
        store   r3      => r14
// f2
        add     r4,r3   => r5
        add     r14,r1  => r14
        store   r4      => r14
// f3
        add     r5,r4   => r6
        add     r14,r1  => r14
        store   r5      => r14 
// f4
        add     r6,r5   => r7
        add     r14,r1  => r14
        store   r6      => r14
// f5
        add     r7,r6   => r8
        add     r14,r1  => r14
        store   r7      => r14
// f6
        add     r8,r7   => r9
        add     r14,r1  => r14
        store   r8      => r14
// f7
        add     r9,r8   => r10
        add     r14,r1  => r14
        store   r9     => r14
// f8
        add     r10,r9  => r11
        add     r14,r1  => r14
        store   r10     => r14
// f9
        add     r11,r10 => r12
        add     r14,r1  => r14
        store   r11     => r14
// f10
        add     r12,r11 => r13
        add     r14,r1  => r14
        store   r12     => r14
// f11
	add	r14,r1	=> r14
	store	r13	=> r14
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
