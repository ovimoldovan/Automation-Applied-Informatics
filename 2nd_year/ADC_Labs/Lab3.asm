
_display_p:

;Lab3.c,4 :: 		void display_p(){
;Lab3.c,8 :: 		PORTA|=(1<<0);
	IN         R16, PORTA+0
	ORI        R16, 1
	OUT        PORTA+0, R16
;Lab3.c,9 :: 		PORTC=0b01111100;
	LDI        R27, 124
	OUT        PORTC+0, R27
;Lab3.c,10 :: 		Delay_ms(2);
	LDI        R17, 42
	LDI        R16, 142
L_display_p0:
	DEC        R16
	BRNE       L_display_p0
	DEC        R17
	BRNE       L_display_p0
	NOP
;Lab3.c,11 :: 		PORTA|=(1<<1);
	IN         R27, PORTA+0
	SBR        R27, 2
	OUT        PORTA+0, R27
;Lab3.c,12 :: 		PORTC=0b00110000;
	LDI        R27, 48
	OUT        PORTC+0, R27
;Lab3.c,13 :: 		Delay_ms(2);
	LDI        R17, 42
	LDI        R16, 142
L_display_p2:
	DEC        R16
	BRNE       L_display_p2
	DEC        R17
	BRNE       L_display_p2
	NOP
;Lab3.c,14 :: 		PORTA|=(1<<2);
	IN         R16, PORTA+0
	ORI        R16, 4
	OUT        PORTA+0, R16
;Lab3.c,15 :: 		PORTC=0b01011100;
	LDI        R27, 92
	OUT        PORTC+0, R27
;Lab3.c,16 :: 		Delay_ms(2);
	LDI        R17, 42
	LDI        R16, 142
L_display_p4:
	DEC        R16
	BRNE       L_display_p4
	DEC        R17
	BRNE       L_display_p4
	NOP
;Lab3.c,17 :: 		PORTA|=(1<<3);
	IN         R16, PORTA+0
	ORI        R16, 8
	OUT        PORTA+0, R16
;Lab3.c,18 :: 		PORTC=0b01011000;
	LDI        R27, 88
	OUT        PORTC+0, R27
;Lab3.c,19 :: 		Delay_ms(2);
	LDI        R17, 42
	LDI        R16, 142
L_display_p6:
	DEC        R16
	BRNE       L_display_p6
	DEC        R17
	BRNE       L_display_p6
	NOP
;Lab3.c,20 :: 		}
L_end_display_p:
	RET
; end of _display_p

_display:

;Lab3.c,21 :: 		void display(char p, char c){
;Lab3.c,22 :: 		PORTA&=0b11110000;
	IN         R16, PORTA+0
	ANDI       R16, 240
	OUT        PORTA+0, R16
;Lab3.c,23 :: 		PORTC&=0b00000000;
	IN         R16, PORTC+0
	ANDI       R16, 0
	OUT        PORTC+0, R16
;Lab3.c,24 :: 		switch(c){
	JMP        L_display8
;Lab3.c,25 :: 		case 0: PORTC|=0b00111111;break;
L_display10:
	IN         R16, PORTC+0
	ORI        R16, 63
	OUT        PORTC+0, R16
	JMP        L_display9
;Lab3.c,26 :: 		case 1: PORTC|=0b00000110;break;
L_display11:
	IN         R16, PORTC+0
	ORI        R16, 6
	OUT        PORTC+0, R16
	JMP        L_display9
;Lab3.c,27 :: 		case 2: PORTC|=0b01011011;break;
L_display12:
	IN         R16, PORTC+0
	ORI        R16, 91
	OUT        PORTC+0, R16
	JMP        L_display9
;Lab3.c,28 :: 		case 3: PORTC|=0b01001111;break;
L_display13:
	IN         R16, PORTC+0
	ORI        R16, 79
	OUT        PORTC+0, R16
	JMP        L_display9
;Lab3.c,29 :: 		case 4: PORTC|=0b01100110;break;
L_display14:
	IN         R16, PORTC+0
	ORI        R16, 102
	OUT        PORTC+0, R16
	JMP        L_display9
;Lab3.c,30 :: 		case 5: PORTC|=0b01101101;break;
L_display15:
	IN         R16, PORTC+0
	ORI        R16, 109
	OUT        PORTC+0, R16
	JMP        L_display9
;Lab3.c,31 :: 		case 6: PORTC|=0b01111101;break;
L_display16:
	IN         R16, PORTC+0
	ORI        R16, 125
	OUT        PORTC+0, R16
	JMP        L_display9
;Lab3.c,32 :: 		case 7: PORTC|=0b00000111;break;
L_display17:
	IN         R16, PORTC+0
	ORI        R16, 7
	OUT        PORTC+0, R16
	JMP        L_display9
;Lab3.c,33 :: 		case 8: PORTC|=0b01111111;break;
L_display18:
	IN         R16, PORTC+0
	ORI        R16, 127
	OUT        PORTC+0, R16
	JMP        L_display9
;Lab3.c,34 :: 		case 9: PORTC|=0b01101111;break;
L_display19:
	IN         R16, PORTC+0
	ORI        R16, 111
	OUT        PORTC+0, R16
	JMP        L_display9
;Lab3.c,35 :: 		}
L_display8:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__display40
	JMP        L_display10
L__display40:
	LDI        R27, 1
	CP         R3, R27
	BRNE       L__display41
	JMP        L_display11
L__display41:
	LDI        R27, 2
	CP         R3, R27
	BRNE       L__display42
	JMP        L_display12
L__display42:
	LDI        R27, 3
	CP         R3, R27
	BRNE       L__display43
	JMP        L_display13
L__display43:
	LDI        R27, 4
	CP         R3, R27
	BRNE       L__display44
	JMP        L_display14
L__display44:
	LDI        R27, 5
	CP         R3, R27
	BRNE       L__display45
	JMP        L_display15
L__display45:
	LDI        R27, 6
	CP         R3, R27
	BRNE       L__display46
	JMP        L_display16
L__display46:
	LDI        R27, 7
	CP         R3, R27
	BRNE       L__display47
	JMP        L_display17
L__display47:
	LDI        R27, 8
	CP         R3, R27
	BRNE       L__display48
	JMP        L_display18
L__display48:
	LDI        R27, 9
	CP         R3, R27
	BRNE       L__display49
	JMP        L_display19
L__display49:
L_display9:
;Lab3.c,36 :: 		PORTA|=(1<<(p-1));
	MOV        R16, R2
	SUBI       R16, 1
	MOV        R27, R16
	LDI        R17, 1
	TST        R27
	BREQ       L__display51
L__display50:
	LSL        R17
	DEC        R27
	BRNE       L__display50
L__display51:
	IN         R16, PORTA+0
	OR         R16, R17
	OUT        PORTA+0, R16
;Lab3.c,37 :: 		Delay_ms(freq);
	LDI        R17, 42
	LDI        R16, 142
L_display20:
	DEC        R16
	BRNE       L_display20
	DEC        R17
	BRNE       L_display20
	NOP
;Lab3.c,38 :: 		}
L_end_display:
	RET
; end of _display

_display_V:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 4
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;Lab3.c,40 :: 		void display_V(){
;Lab3.c,41 :: 		int copie = val;
	PUSH       R2
	PUSH       R3
	LDS        R16, _val+0
	LDS        R17, _val+1
	STD        Y+0, R16
	STD        Y+1, R17
;Lab3.c,42 :: 		int i = 1;
	LDI        R27, 1
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
;Lab3.c,43 :: 		while(copie){
L_display_V22:
	LDD        R16, Y+0
	LDD        R17, Y+1
	MOV        R27, R16
	OR         R27, R17
	BRNE       L__display_V53
	JMP        L_display_V23
L__display_V53:
;Lab3.c,44 :: 		display(i,copie%10);
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+0
	LDD        R17, Y+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	MOV        R3, R16
	LDD        R2, Y+2
	CALL       _display+0
;Lab3.c,45 :: 		copie=copie/10;
	LDI        R20, 10
	LDI        R21, 0
	LDD        R16, Y+0
	LDD        R17, Y+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	STD        Y+0, R16
	STD        Y+1, R17
;Lab3.c,46 :: 		i++;
	LDD        R16, Y+2
	LDD        R17, Y+3
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+2, R16
	STD        Y+3, R17
;Lab3.c,47 :: 		}
	JMP        L_display_V22
L_display_V23:
;Lab3.c,48 :: 		}
L_end_display_V:
	POP        R3
	POP        R2
	ADIW       R28, 3
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _display_V

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Lab3.c,51 :: 		void main(){
;Lab3.c,52 :: 		DDRA|=0b00001111;
	IN         R16, DDRA+0
	ORI        R16, 15
	OUT        DDRA+0, R16
;Lab3.c,53 :: 		DDRC|=0b11111111;
	IN         R16, DDRC+0
	ORI        R16, 255
	OUT        DDRC+0, R16
;Lab3.c,54 :: 		DDRB|=0b10101111;
	IN         R16, DDRB+0
	ORI        R16, 175
	OUT        DDRB+0, R16
;Lab3.c,69 :: 		for(;;){
L_main24:
;Lab3.c,71 :: 		if(PINB&(1<<4)){
	IN         R16, PINB+0
	SBRS       R16, 4
	JMP        L_main27
;Lab3.c,72 :: 		display_p();
	CALL       _display_p+0
;Lab3.c,74 :: 		}
	JMP        L_main28
L_main27:
;Lab3.c,83 :: 		if(!(PINB&(1<<6))){
	IN         R16, PINB+0
	SBRC       R16, 6
	JMP        L_main29
;Lab3.c,84 :: 		k =0;
	LDI        R27, 0
	STS        _k+0, R27
;Lab3.c,85 :: 		}
L_main29:
;Lab3.c,86 :: 		if(PINB&(1<<6)&& k==0){
	IN         R16, PINB+0
	SBRS       R16, 6
	JMP        L__main37
	LDS        R16, _k+0
	CPI        R16, 0
	BREQ       L__main55
	JMP        L__main36
L__main55:
L__main35:
;Lab3.c,87 :: 		if(PINA&(1<<6)){val--;
	IN         R16, PINA+0
	SBRS       R16, 6
	JMP        L_main33
	LDS        R16, _val+0
	LDS        R17, _val+1
	SUBI       R16, 1
	SBCI       R17, 0
	STS        _val+0, R16
	STS        _val+1, R17
;Lab3.c,88 :: 		}
	JMP        L_main34
L_main33:
;Lab3.c,90 :: 		val++;
	LDS        R16, _val+0
	LDS        R17, _val+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _val+0, R16
	STS        _val+1, R17
L_main34:
;Lab3.c,91 :: 		k=1;
	LDI        R27, 1
	STS        _k+0, R27
;Lab3.c,86 :: 		if(PINB&(1<<6)&& k==0){
L__main37:
L__main36:
;Lab3.c,94 :: 		display_V();
	CALL       _display_V+0
;Lab3.c,95 :: 		}
L_main28:
;Lab3.c,96 :: 		}
	JMP        L_main24
;Lab3.c,97 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
