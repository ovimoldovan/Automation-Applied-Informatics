
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;lab2.c,16 :: 		void main(){
;lab2.c,17 :: 		DDRA |= (1<<5);
	IN         R27, DDRA+0
	SBR        R27, 32
	OUT        DDRA+0, R27
;lab2.c,18 :: 		DDRD &= ~(1<<7);
	IN         R16, DDRD+0
	ANDI       R16, 127
	OUT        DDRD+0, R16
;lab2.c,19 :: 		DDRD &= ~(1<<5);
	ANDI       R16, 223
	OUT        DDRD+0, R16
;lab2.c,20 :: 		DDRB = 0b11111111;
	LDI        R27, 255
	OUT        DDRB+0, R27
;lab2.c,22 :: 		for(;;){
L_main0:
;lab2.c,23 :: 		if(PIND & (1<<7)) {
	IN         R16, PIND+0
	SBRS       R16, 7
	JMP        L_main3
;lab2.c,24 :: 		for(i=0;i<10;i++){
	LDI        R27, 0
	STS        _i+0, R27
	STS        _i+1, R27
L_main4:
	LDS        R18, _i+0
	LDS        R19, _i+1
	LDI        R16, 10
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__main15
	JMP        L_main5
L__main15:
;lab2.c,25 :: 		PORTA |= (1<<5);
	IN         R16, PORTA+0
	ORI        R16, 32
	OUT        PORTA+0, R16
;lab2.c,26 :: 		Delay_ms(200);
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_main7:
	DEC        R16
	BRNE       L_main7
	DEC        R17
	BRNE       L_main7
	DEC        R18
	BRNE       L_main7
	NOP
;lab2.c,27 :: 		PORTA &= ~(1<<5);
	IN         R16, PORTA+0
	ANDI       R16, 223
	OUT        PORTA+0, R16
;lab2.c,28 :: 		Delay_ms(200);
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_main9:
	DEC        R16
	BRNE       L_main9
	DEC        R17
	BRNE       L_main9
	DEC        R18
	BRNE       L_main9
	NOP
;lab2.c,24 :: 		for(i=0;i<10;i++){
	LDS        R16, _i+0
	LDS        R17, _i+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _i+0, R16
	STS        _i+1, R17
;lab2.c,29 :: 		}
	JMP        L_main4
L_main5:
;lab2.c,30 :: 		}
L_main3:
;lab2.c,31 :: 		if(PIND & (1<<5)) {
	IN         R16, PIND+0
	SBRS       R16, 5
	JMP        L_main11
;lab2.c,32 :: 		k++;
	LDS        R16, _k+0
	LDS        R17, _k+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _k+0, R16
	STS        _k+1, R17
;lab2.c,33 :: 		Delay_ms(300);
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L_main12:
	DEC        R16
	BRNE       L_main12
	DEC        R17
	BRNE       L_main12
	DEC        R18
	BRNE       L_main12
	NOP
	NOP
;lab2.c,34 :: 		PORTB = k;
	LDS        R16, _k+0
	OUT        PORTB+0, R16
;lab2.c,35 :: 		}
L_main11:
;lab2.c,36 :: 		}
	JMP        L_main0
;lab2.c,37 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
