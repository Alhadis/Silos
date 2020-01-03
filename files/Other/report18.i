//NAME: COMP412
//NETID: comp412
//SIM INPUT: -i 1000 8
//OUTPUT: 1 2 3
//
// This block is the 2013 contributed block s02_memory_disambiguation_2.i
//
// Usage before scheduling: ./sim -s 3 -i 1000 8 <  report18.i
//
// ****  To ensure word alignment, the input value to location 1000 must
// ****  be a multiple of four.  The value must not be 1004, 1008, or 1012. 
//
//
// Ian Arnold
//
// This test ensures that dependence is correctly established between certain
// undisambiguatable memory references.
//
// We will rely on a user input to location 1000 to introduce an unknown value.
// We will store a value to a location specified by that input, and ensure that
// all subsequent loads keep that store as a dependency.  This is easiest to
// confirm with a dependence graph visualization.
//
// Should print 1, 2, then 3, unless the value supplied at location 1000 is one
// of {1004, 1008, 1012}.
//
//
//
// Rely on a user input at location 1000 to introduce some nondeterminism.
//
   loadI 1000 => r0    // 1
   load r0 => r1       // 2
//
//
// Fill some constants to provide memory locations.
//
   loadI 1004 => r2    // 3
   loadI 1008 => r3    // 4
   loadI 1012 => r4    // 5
//
   loadI 1 => r5       // 6
   loadI 2 => r6       // 7
   loadI 3 => r7       // 8
   loadI 4 => r8       // 9
//
   store r5 => r2      // 10
   store r6 => r3      // 11
   store r7 => r4      // 12
//
//
// This instruction could plausibly overwrite the effects of any of the previous
// three (operations 10 - 12).
//
   store r8 => r1      // 13
//
//
// As such, each of these operations MUST have operation 13 as a dependency,
// causing them to be scheduled STRICTLY AFTER the effects of operation 13
// stabilize.
//
   load r2 => r5       // 14
   load r3 => r6       // 15
   load r4 => r7       // 16
   output 1004         // 17
   output 1008         // 18
   output 1012         // 19
 
