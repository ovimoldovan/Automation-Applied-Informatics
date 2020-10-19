
_init_timer0:

;lab4_intrerupere.c,5 :: 		void init_timer0(){
;lab4_intrerupere.c,6 :: 		TCCR0 = 0b00001011; //CTC-3,6,Prescaler 0,1,2
	LDI        R27, 11
	OUT        TCCR0+0, R27
;lab4_intrerupere.c,7 :: 		TCNT0 = 0;
	LDI        R27, 0
	OUT        TCNT0+0, R27
;lab4_intrerupere.c,8 :: 		OCR0 = 124;
	LDI        R27, 124
	OUT        OCR0+0, R27
;lab4_intrerupere.c,9 :: 		TIMSK|= 0b00000010;//set interrupt OCM
	IN         R27, TIMSK+0
	SBR        R27, 2
	OUT        TIMSK+0, R27
;lab4_intrerupere.c,10 :: 		SREG|=1<<7;
	IN         R16, SREG+0
	ORI        R16, 128
	OUT        SREG+0, R16
;lab4_intrerupere.c,11 :: 		}
L_end_init_timer0:
	RET
; end of _init_timer0

_init_timer1:

;lab4_intrerupere.c,13 :: 		void init_timer1(){
;lab4_intrerupere.c,14 :: 		TCCR1A=0b00000000;
	LDI        R27, 0
	OUT        TCCR1A+0, R27
;lab4_intrerupere.c,15 :: 		TCCR1B=0b00001100;
	LDI        R27, 12
	OUT        TCCR1B+0, R27
;lab4_intrerupere.c,16 :: 		TCNT1H=0;
	LDI        R27, 0
	OUT        TCNT1H+0, R27
;lab4_intrerupere.c,17 :: 		TCNT1L=0;
	LDI        R27, 0
	OUT        TCNT1L+0, R27
;lab4_intrerupere.c,18 :: 		OCR1AH=31250>>8;
	LDI        R27, 122
	OUT        OCR1AH+0, R27
;lab4_intrerupere.c,19 :: 		OCR1AL=31250;
	LDI        R27, 18
	OUT        OCR1AL+0, R27
;lab4_intrerupere.c,20 :: 		TIMSK|=0b00010000;;
	IN         R27, TIMSK+0
	SBR        R27, 16
	OUT        TIMSK+0, R27
;lab4_intrerupere.c,21 :: 		SREG|=1<<7;
	IN         R16, SREG+0
	ORI        R16, 128
	OUT        SREG+0, R16
;lab4_intrerupere.c,22 :: 		}
L_end_init_timer1:
	RET
; end of _init_timer1

_display:

;lab4_intrerupere.c,24 :: 		void display(char p, char c){
;lab4_intrerupere.c,25 :: 		PORTA&=0b11110000;
	IN         R16, PORTA+0
	ANDI       R16, 240
	OUT        PORTA+0, R16
;lab4_intrerupere.c,26 :: 		PORTC&=0b00000000;
	IN         R16, PORTC+0
	ANDI       R16, 0
	OUT        PORTC+0, R16
;lab4_intrerupere.c,27 :: 		switch(c){
	JMP        L_display0
;lab4_intrerupere.c,28 :: 		case 0: PORTC|=0b00111111;break;
L_display2:
	IN         R16, PORTC+0
	ORI        R16, 63
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4_intrerupere.c,29 :: 		case 1: PORTC|=0b00000110;break;
L_display3:
	IN         R16, PORTC+0
	ORI        R16, 6
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4_intrerupere.c,30 :: 		case 2: PORTC|=0b01011011;break;
L_display4:
	IN         R16, PORTC+0
	ORI        R16, 91
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4_intrerupere.c,31 :: 		case 3: PORTC|=0b01001111;break;
L_display5:
	IN         R16, PORTC+0
	ORI        R16, 79
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4_intrerupere.c,32 :: 		case 4: PORTC|=0b01100110;break;
L_display6:
	IN         R16, PORTC+0
	ORI        R16, 102
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4_intrerupere.c,33 :: 		case 5: PORTC|=0b01101101;break;
L_display7:
	IN         R16, PORTC+0
	ORI        R16, 109
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4_intrerupere.c,34 :: 		case 6: PORTC|=0b01111101;break;
L_display8:
	IN         R16, PORTC+0
	ORI        R16, 125
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4_intrerupere.c,35 :: 		case 7: PORTC|=0b00000111;break;
L_display9:
	IN         R16, PORTC+0
	ORI        R16, 7
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4_intrerupere.c,36 :: 		case 8: PORTC|=0b01111111;break;
L_display10:
	IN         R16, PORTC+0
	ORI        R16, 127
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4_intrerupere.c,37 :: 		case 9: PORTC|=0b01101111;break;
L_display11:
	IN         R16, PORTC+0
	ORI        R16, 111
	OUT        PORTC+0, R16
	JMP        L_display1
;lab4_intrerupere.c,38 :: 		}
L_display0:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__display36
	JMP        L_display2
L__display36:
	LDI        R27, 1
	CP         R3, R27
	BRNE       L__display37
	JMP        L_display3
L__display37:
	LDI        R27, 2
	CP         R3, R27
	BRNE       L__display38
	JMP        L_display4
L__display38:
	LDI        R27, 3
	CP         R3, R27
	BRNE       L__display39
	JMP        L_display5
L__display39:
	LDI        R27, 4
	CP         R3, R27
	BRNE       L__display40
	JMP        L_display6
L__display40:
	LDI        R27, 5
	CP         R3, R27
	BRNE       L__display41
	JMP        L_display7
L__display41:
	LDI        R27, 6
	CP         R3, R27
	BRNE       L__display42
	JMP        L_display8
L__display42:
	LDI        R27, 7
	CP         R3, R27
	BRNE       L__display43
	JMP        L_display9
L__display43:
	LDI        R27, 8
	CP         R3, R27
	BRNE       L__display44
	JMP        L_display10
L__display44:
	LDI        R27, 9
	CP         R3, R27
	BRNE       L__display45
	JMP        L_display11
L__display45:
L_display1:
;lab4_intrerupere.c,43 :: 		switch(p){
	JMP        L_display12
;lab4_intrerupere.c,44 :: 		case 1: PORTA|=0b00001000;break;
L_display14:
	IN         R27, PORTA+0
	SBR        R27, 8
	OUT        PORTA+0, R27
	JMP        L_display13
;lab4_intrerupere.c,45 :: 		case 2: PORTA|=0b00000100;break;
L_display15:
	IN         R16, PORTA+0
	ORI        R16, 4
	OUT        PORTA+0, R16
	JMP        L_display13
;lab4_intrerupere.c,46 :: 		case 3: PORTA|=0b00000010;break;
L_display16:
	IN         R16, PORTA+0
	ORI        R16, 2
	OUT        PORTA+0, R16
	JMP        L_display13
;lab4_intrerupere.c,47 :: 		case 4: PORTA|=0b00000001;break;
L_display17:
	IN         R16, PORTA+0
	ORI        R16, 1
	OUT        PORTA+0, R16
	JMP        L_display13
;lab4_intrerupere.c,48 :: 		}
L_display12:
	LDI        R27, 1
	CP         R2, R27
	BRNE       L__display46
	JMP        L_display14
L__display46:
	LDI        R27, 2
	CP         R2, R27
	BRNE       L__display47
	JMP        L_display15
L__display47:
	LDI        R27, 3
	CP         R2, R27
	BRNE       L__display48
	JMP        L_display16
L__display48:
	LDI        R27, 4
	CP         R2, R27
	BRNE       L__display49
	JMP        L_display17
L__display49:
L_display13:
;lab4_intrerupere.c,49 :: 		}
L_end_display:
	RET
; end of _display

_ISR_TIM0:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;lab4_intrerupere.c,51 :: 		void ISR_TIM0() iv IVT_ADDR_TIMER0_COMP ics ICS_AUTO {
;lab4_intrerupere.c,52 :: 		if(ms == 3){
	PUSH       R2
	PUSH       R3
	LDS        R16, _ms+0
	LDS        R17, _ms+1
	CPI        R17, 0
	BRNE       L__ISR_TIM051
	CPI        R16, 3
L__ISR_TIM051:
	BREQ       L__ISR_TIM052
	JMP        L_ISR_TIM018
L__ISR_TIM052:
;lab4_intrerupere.c,53 :: 		poz++;
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _poz+0, R16
	STS        _poz+1, R17
;lab4_intrerupere.c,54 :: 		switch(poz){
	JMP        L_ISR_TIM019
;lab4_intrerupere.c,55 :: 		case 1:display(4,s%10);break;
L_ISR_TIM021:
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
	JMP        L_ISR_TIM020
;lab4_intrerupere.c,56 :: 		case 2:display(3,(s/10)%10);break;
L_ISR_TIM022:
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
	JMP        L_ISR_TIM020
;lab4_intrerupere.c,57 :: 		case 3:display(2,m%10);break;
L_ISR_TIM023:
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
	JMP        L_ISR_TIM020
;lab4_intrerupere.c,58 :: 		case 4:display(1,(m/10)%10);poz=0;break;
L_ISR_TIM024:
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
	LDI        R27, 0
	STS        _poz+0, R27
	STS        _poz+1, R27
	JMP        L_ISR_TIM020
;lab4_intrerupere.c,59 :: 		}
L_ISR_TIM019:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__ISR_TIM053
	CPI        R16, 1
L__ISR_TIM053:
	BRNE       L__ISR_TIM054
	JMP        L_ISR_TIM021
L__ISR_TIM054:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__ISR_TIM055
	CPI        R16, 2
L__ISR_TIM055:
	BRNE       L__ISR_TIM056
	JMP        L_ISR_TIM022
L__ISR_TIM056:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__ISR_TIM057
	CPI        R16, 3
L__ISR_TIM057:
	BRNE       L__ISR_TIM058
	JMP        L_ISR_TIM023
L__ISR_TIM058:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__ISR_TIM059
	CPI        R16, 4
L__ISR_TIM059:
	BRNE       L__ISR_TIM060
	JMP        L_ISR_TIM024
L__ISR_TIM060:
L_ISR_TIM020:
;lab4_intrerupere.c,60 :: 		ms=0 ;
	LDI        R27, 0
	STS        _ms+0, R27
	STS        _ms+1, R27
;lab4_intrerupere.c,61 :: 		}
	JMP        L_ISR_TIM025
L_ISR_TIM018:
;lab4_intrerupere.c,62 :: 		else ms++;
	LDS        R16, _ms+0
	LDS        R17, _ms+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _ms+0, R16
	STS        _ms+1, R17
L_ISR_TIM025:
;lab4_intrerupere.c,64 :: 		if(ms2==999){
	LDS        R16, _ms2+0
	LDS        R17, _ms2+1
	CPI        R17, 3
	BRNE       L__ISR_TIM061
	CPI        R16, 231
L__ISR_TIM061:
	BREQ       L__ISR_TIM062
	JMP        L_ISR_TIM026
L__ISR_TIM062:
;lab4_intrerupere.c,65 :: 		s++;
	LDS        R16, _s+0
	SUBI       R16, 255
	STS        _s+0, R16
;lab4_intrerupere.c,66 :: 		ms2=0;
	LDI        R27, 0
	STS        _ms2+0, R27
	STS        _ms2+1, R27
;lab4_intrerupere.c,67 :: 		}
	JMP        L_ISR_TIM027
L_ISR_TIM026:
;lab4_intrerupere.c,68 :: 		else ms2++;
	LDS        R16, _ms2+0
	LDS        R17, _ms2+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _ms2+0, R16
	STS        _ms2+1, R17
L_ISR_TIM027:
;lab4_intrerupere.c,69 :: 		if(s==60){
	LDS        R16, _s+0
	CPI        R16, 60
	BREQ       L__ISR_TIM063
	JMP        L_ISR_TIM028
L__ISR_TIM063:
;lab4_intrerupere.c,70 :: 		m++;
	LDS        R16, _m+0
	SUBI       R16, 255
	STS        _m+0, R16
;lab4_intrerupere.c,71 :: 		s=0;
	LDI        R27, 0
	STS        _s+0, R27
;lab4_intrerupere.c,72 :: 		}
L_ISR_TIM028:
;lab4_intrerupere.c,73 :: 		}
L_end_ISR_TIM0:
	POP        R3
	POP        R2
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _ISR_TIM0

_ISR_TIM1:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;lab4_intrerupere.c,75 :: 		void ISR_TIM1() iv IVT_ADDR_TIMER1_COMPA ics ICS_AUTO {
;lab4_intrerupere.c,77 :: 		s++;
	LDS        R16, _s+0
	SUBI       R16, 255
	STS        _s+0, R16
;lab4_intrerupere.c,78 :: 		if(s=60){
	LDI        R27, 60
	STS        _s+0, R27
;lab4_intrerupere.c,79 :: 		s=0;
	LDI        R27, 0
	STS        _s+0, R27
;lab4_intrerupere.c,80 :: 		m++;
	LDS        R16, _m+0
	SUBI       R16, 255
	STS        _m+0, R16
;lab4_intrerupere.c,82 :: 		}
L_end_ISR_TIM1:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _ISR_TIM1

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;lab4_intrerupere.c,86 :: 		void main() {
;lab4_intrerupere.c,87 :: 		DDRA = 0b00001111;
	LDI        R27, 15
	OUT        DDRA+0, R27
;lab4_intrerupere.c,88 :: 		DDRC = 0b11111111;
	LDI        R27, 255
	OUT        DDRC+0, R27
;lab4_intrerupere.c,89 :: 		DDRB &= 0b11111110;
	IN         R16, DDRB+0
	ANDI       R16, 254
	OUT        DDRB+0, R16
;lab4_intrerupere.c,90 :: 		DDRD &= 0b10000000;
	IN         R16, DDRD+0
	ANDI       R16, 128
	OUT        DDRD+0, R16
;lab4_intrerupere.c,93 :: 		init_timer0();
	CALL       _init_timer0+0
;lab4_intrerupere.c,94 :: 		init_timer1();
	CALL       _init_timer1+0
;lab4_intrerupere.c,95 :: 		for(;;){
L_main30:
;lab4_intrerupere.c,97 :: 		}
	JMP        L_main30
;lab4_intrerupere.c,100 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
