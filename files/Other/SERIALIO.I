FlushSerialBuffer:
	GEMDOS	c_auxis, 2

	cmp.b	#0,d0 ;is the buffer empty?
	bne	.readchar ;no
	beq	.done	;yes

.readchar:
	GEMDOS	c_auxin, 2
	jmp	FlushSerialBuffer

.done:
	rts
