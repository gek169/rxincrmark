#!/usr/bin/sisa16_asm -run

..include"libc.hasm"
..main(1):
lrx0 %/0x30000%;
//proc_krenel;
farjmprx0

halt;



..(0x3):
	clock
	rx0a
$|
	[while]{ //busy loop until the number of ms changes, i.e. get to the edge of a tick.
		clock;
		brx0;
		cmp;
	}{
		;
	}
$|

	//get clock
	clock;rx3a;
	//do delay
	lcall %delay%
	//get clock and subtract
	clock;brx3;sub;
	//print milliseconds
	rx0a
	lrx1 %/buf%
	proc_utoa_dec
	lrx0 %/buf%
	//print milliseconds
	proc_prints
	la '\n'
	putchar
	
lb 0
div
halt;

buf:
	fill 30,0;

//to mimic the volatile variable of the C code.
myvar:
	fill 4,0;
delay:
	lb 0
	rx1b
	rx0b
	strx0 %myvar%
	sc %delay_looptop%

	delay_looptop:
		ldrx0 %myvar%
		rxincr
		strx0 %myvar%
		rxcmp
		jmpifneq
	ret
