
_init_timer:

;lab4.c,4 :: 		void init_timer(){
;lab4.c,5 :: 		TCCR0 = 0b00000011;
	LDI        R27, 3
	OUT        TCCR0+0, R27
;lab4.c,6 :: 		TCNT0 = 0;
	LDI        R27, 0
	OUT        TCNT0+0, R27
;lab4.c,7 :: 		}
L_end_init_timer:
	RET
; end of _init_timer

_display:

;lab4.c,8 :: 		void display(char p, char c){
;lab4.c,9 :: 		PORTA&=0b11110000;
	IN         R16, PORTA+0
	ANDI       R16, 240
	OUT        PORTA+0, R16
;lab4.c,10 :: 		PORTC&=0b00000000;
	IN         R16, PORTC+0
	ANDI       R16, 0
	OUT        PORTC+0, R16
;lab4.c,11 :: 		switch(c){
	JMP        L_display0
;lab4.c,12 :: 		case 0: PORTC|=0b00111111;break;
L_display2:
	IN         R16, PORTC+0
	ORI        R16, 63
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4.c,13 :: 		case 1: PORTC|=0b00000110;break;
L_display3:
	IN         R16, PORTC+0
	ORI        R16, 6
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4.c,14 :: 		case 2: PORTC|=0b01011011;break;
L_display4:
	IN         R16, PORTC+0
	ORI        R16, 91
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4.c,15 :: 		case 3: PORTC|=0b01001111;break;
L_display5:
	IN         R16, PORTC+0
	ORI        R16, 79
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4.c,16 :: 		case 4: PORTC|=0b01100110;break;
L_display6:
	IN         R16, PORTC+0
	ORI        R16, 102
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4.c,17 :: 		case 5: PORTC|=0b01101101;break;
L_display7:
	IN         R16, PORTC+0
	ORI        R16, 109
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4.c,18 :: 		case 6: PORTC|=0b01111101;break;
L_display8:
	IN         R16, PORTC+0
	ORI        R16, 125
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4.c,19 :: 		case 7: PORTC|=0b00000111;break;
L_display9:
	IN         R16, PORTC+0
	ORI        R16, 7
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4.c,20 :: 		case 8: PORTC|=0b01111111;break;
L_display10:
	IN         R16, PORTC+0
	ORI        R16, 127
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4.c,21 :: 		case 9: PORTC|=0b01101111;break;
L_display11:
	IN         R16, PORTC+0
	ORI        R16, 111
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4.c,22 :: 		}
L_display0:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__display30
	JMP        L_display2
L__display30:
	LDI        R27, 1
	CP         R3, R27
	BRNE       L__display31
	JMP        L_display3
L__display31:
	LDI        R27, 2
	CP         R3, R27
	BRNE       L__display32
	JMP        L_display4
L__display32:
	LDI        R27, 3
	CP         R3, R27
	BRNE       L__display33
	JMP        L_display5
L__display33:
	LDI        R27, 4
	CP         R3, R27
	BRNE       L__display34
	JMP        L_display6
L__display34:
	LDI        R27, 5
	CP         R3, R27
	BRNE       L__display35
	JMP        L_display7
L__display35:
	LDI        R27, 6
	CP         R3, R27
	BRNE       L__display36
	JMP        L_display8
L__display36:
	LDI        R27, 7
	CP         R3, R27
	BRNE       L__display37
	JMP        L_display9
L__display37:
	LDI        R27, 8
	CP         R3, R27
	BRNE       L__display38
	JMP        L_display10
L__display38:
	LDI        R27, 9
	CP         R3, R27
	BRNE       L__display39
	JMP        L_display11
L__display39:
L_display1:
;lab4.c,27 :: 		switch(p){
	JMP        L_display12
;lab4.c,28 :: 		case 1: PORTA|=0b00001000;break;
L_display14:
	IN         R27, PORTA+0
	SBR        R27, 8
	OUT        PORTA+0, R27
	JMP        L_display13
;lab4.c,29 :: 		case 2: PORTA|=0b00000100;break;
L_display15:
	IN         R16, PORTA+0
	ORI        R16, 4
	OUT        PORTA+0, R16
	JMP        L_display13
;lab4.c,30 :: 		case 3: PORTA|=0b00000010;break;
L_display16:
	IN         R16, PORTA+0
	ORI        R16, 2
	OUT        PORTA+0, R16
	JMP        L_display13
;lab4.c,31 :: 		case 4: PORTA|=0b00000001;break;
L_display17:
	IN         R16, PORTA+0
	ORI        R16, 1
	OUT        PORTA+0, R16
	JMP        L_display13
;lab4.c,32 :: 		}
L_display12:
	LDI        R27, 1
	CP         R2, R27
	BRNE       L__display40
	JMP        L_display14
L__display40:
	LDI        R27, 2
	CP         R2, R27
	BRNE       L__display41
	JMP        L_display15
L__display41:
	LDI        R27, 3
	CP         R2, R27
	BRNE       L__display42
	JMP        L_display16
L__display42:
	LDI        R27, 4
	CP         R2, R27
	BRNE       L__display43
	JMP        L_display17
L__display43:
L_display13:
;lab4.c,33 :: 		}
L_end_display:
	RET
; end of _display

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;lab4.c,35 :: 		void main() {
;lab4.c,36 :: 		DDRA = 0b00001111;
	PUSH       R2
	PUSH       R3
	LDI        R27, 15
	OUT        DDRA+0, R27
;lab4.c,37 :: 		DDRC = 0b11111111;
	LDI        R27, 255
	OUT        DDRC+0, R27
;lab4.c,38 :: 		DDRB &= 0b11111110;
	IN         R16, DDRB+0
	ANDI       R16, 254
	OUT        DDRB+0, R16
;lab4.c,39 :: 		DDRD &= 0b10000000;
	IN         R16, DDRD+0
	ANDI       R16, 128
	OUT        DDRD+0, R16
;lab4.c,40 :: 		init_timer();
	CALL       _init_timer+0
;lab4.c,41 :: 		for(;;){
L_main18:
;lab4.c,42 :: 		if(PINB==(1<<0)){
	IN         R16, PINB+0
	CPI        R16, 1
	BREQ       L__main45
	JMP        L_main21
L__main45:
;lab4.c,43 :: 		ms = 0; s = 0; m = 0;}
	LDI        R27, 0
	STS        _ms+0, R27
	STS        _ms+1, R27
	LDI        R27, 0
	STS        _s+0, R27
	LDI        R27, 0
	STS        _m+0, R27
L_main21:
;lab4.c,44 :: 		if(PIND==(1<<7)){
	IN         R16, PIND+0
	CPI        R16, 128
	BREQ       L__main46
	JMP        L_main22
L__main46:
;lab4.c,45 :: 		if(s>9) s = s / 10 * 10;
	LDS        R17, _s+0
	LDI        R16, 9
	CP         R16, R17
	BRLT       L__main47
	JMP        L_main23
L__main47:
	LDS        R16, _s+0
	LDI        R20, 10
	LDI        R17, 0
	SBRC       R16, 7
	LDI        R17, 255
	LDI        R21, 0
	SBRC       R20, 7
	LDI        R21, 255
	CALL       _Div_16x16_S+0
	MOV        R16, R22
	LDI        R17, 10
	MUL        R16, R17
	MOV        R16, R0
	STS        _s+0, R16
	JMP        L_main24
L_main23:
;lab4.c,46 :: 		else s=0;
	LDI        R27, 0
	STS        _s+0, R27
L_main24:
;lab4.c,47 :: 		}
L_main22:
;lab4.c,48 :: 		if(TCNT0>=125) //implinirea unei milisecunde
	IN         R16, TCNT0+0
	CPI        R16, 125
	BRSH       L__main48
	JMP        L_main25
L__main48:
;lab4.c,50 :: 		TCNT0 = 0; //resetarea timerului
	LDI        R27, 0
	OUT        TCNT0+0, R27
;lab4.c,51 :: 		ms++;
	LDS        R16, _ms+0
	LDS        R17, _ms+1
	MOVW       R18, R16
	SUBI       R18, 255
	SBCI       R19, 255
	STS        _ms+0, R18
	STS        _ms+1, R19
;lab4.c,52 :: 		if(ms>=1000){
	LDI        R16, 232
	LDI        R17, 3
	CP         R18, R16
	CPC        R19, R17
	BRGE       L__main49
	JMP        L_main26
L__main49:
;lab4.c,53 :: 		ms=0;
	LDI        R27, 0
	STS        _ms+0, R27
	STS        _ms+1, R27
;lab4.c,54 :: 		s++;
	LDS        R16, _s+0
	SUBI       R16, 255
	STS        _s+0, R16
;lab4.c,55 :: 		}
L_main26:
;lab4.c,56 :: 		if(s>=60){
	LDS        R16, _s+0
	CPI        R16, 60
	BRGE       L__main50
	JMP        L_main27
L__main50:
;lab4.c,57 :: 		s = 0;
	LDI        R27, 0
	STS        _s+0, R27
;lab4.c,58 :: 		m++;
	LDS        R16, _m+0
	SUBI       R16, 255
	STS        _m+0, R16
;lab4.c,59 :: 		}
L_main27:
;lab4.c,60 :: 		}
L_main25:
;lab4.c,61 :: 		display(4,s%10);
	LDS        R16, _s+0
	LDI        R20, 10
	LDI        R17, 0
	SBRC       R16, 7
	LDI        R17, 255
	LDI        R21, 0
	SBRC       R20, 7
	LDI        R21, 255
	CALL       _Div_16x16_S+0
	MOV        R16, R24
	MOV        R3, R16
	LDI        R27, 4
	MOV        R2, R27
	CALL       _display+0
;lab4.c,62 :: 		display(3,s/10%10);
	LDS        R16, _s+0
	LDI        R20, 10
	LDI        R17, 0
	SBRC       R16, 7
	LDI        R17, 255
	LDI        R21, 0
	SBRC       R20, 7
	LDI        R21, 255
	CALL       _Div_16x16_S+0
	MOV        R16, R22
	LDI        R20, 10
	LDI        R17, 0
	SBRC       R16, 7
	LDI        R17, 255
	LDI        R21, 0
	SBRC       R20, 7
	LDI        R21, 255
	CALL       _Div_16x16_S+0
	MOV        R16, R24
	MOV        R3, R16
	LDI        R27, 3
	MOV        R2, R27
	CALL       _display+0
;lab4.c,63 :: 		display(2,m%10);
	LDS        R16, _m+0
	LDI        R20, 10
	LDI        R17, 0
	SBRC       R16, 7
	LDI        R17, 255
	LDI        R21, 0
	SBRC       R20, 7
	LDI        R21, 255
	CALL       _Div_16x16_S+0
	MOV        R16, R24
	MOV        R3, R16
	LDI        R27, 2
	MOV        R2, R27
	CALL       _display+0
;lab4.c,64 :: 		display(1,m/10%10);
	LDS        R16, _m+0
	LDI        R20, 10
	LDI        R17, 0
	SBRC       R16, 7
	LDI        R17, 255
	LDI        R21, 0
	SBRC       R20, 7
	LDI        R21, 255
	CALL       _Div_16x16_S+0
	MOV        R16, R22
	LDI        R20, 10
	LDI        R17, 0
	SBRC       R16, 7
	LDI        R17, 255
	LDI        R21, 0
	SBRC       R20, 7
	LDI        R21, 255
	CALL       _Div_16x16_S+0
	MOV        R16, R24
	MOV        R3, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _display+0
;lab4.c,65 :: 		}
	JMP        L_main18
;lab4.c,66 :: 		}
L_end_main:
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
