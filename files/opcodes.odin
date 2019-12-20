NOP    :: 0x00;
LDRC   :: 0x01;
LDRR   :: 0x02;
ADDRC  :: 0x03;
ADDRR  :: 0x04;
SUBRC  :: 0x05;
SUBRR  :: 0x06;
LDSPCC :: 0x07;
LDSPRR :: 0x08;

LDSBCC :: 0x09;
LDSBRR :: 0x0A;

HLT   :: 0x0B;
PUSHR :: 0x0C;
PUSHC :: 0x0D;
POPR  :: 0x0E;
POP   :: 0x0F;

/*

INCR  - INC rr

JMPRR - JMP rr:rc
JMPREL - JMP +-rr
JMPC - JMP c:d
CALLRR - CALL rr:rc
CALLC  - CALL c:d

*/