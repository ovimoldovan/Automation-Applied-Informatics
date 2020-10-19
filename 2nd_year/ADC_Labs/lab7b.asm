
_init_timer0:

;lab7b.c,5 :: 		void init_timer0(){
;lab7b.c,6 :: 		TCCR0 = 0b00001011; //CTC-3,6,Prescaler 0,1,2
	LDI        R27, 11
	OUT        TCCR0+0, R27
;lab7b.c,7 :: 		TCNT0 = 0;
	LDI        R27, 0
	OUT        TCNT0+0, R27
;lab7b.c,8 :: 		OCR0 = 125;
	LDI        R27, 125
	OUT        OCR0+0, R27
;lab7b.c,9 :: 		TIMSK |= 0b00000010;
	IN         R27, TIMSK+0
	SBR        R27, 2
	OUT        TIMSK+0, R27
;lab7b.c,10 :: 		}
L_end_init_timer0:
	RET
; end of _init_timer0

_display:

;lab7b.c,16 :: 		void display(char p, char c){
;lab7b.c,17 :: 		PORTA&=0b11110000;
	IN         R16, PORTA+0
	ANDI       R16, 240
	OUT        PORTA+0, R16
;lab7b.c,18 :: 		PORTC&=0b00000000;
	IN         R16, PORTC+0
	ANDI       R16, 0
	OUT        PORTC+0, R16
;lab7b.c,19 :: 		switch(c){
	JMP        L_display0
;lab7b.c,20 :: 		case 0: PORTC|=0b00111111;break;
L_display2:
	IN         R16, PORTC+0
	ORI        R16, 63
	OUT        PORTC+0, R16
	JMP        L_display1
;lab7b.c,21 :: 		case 1: PORTC|=0b00000110;break;
L_display3:
	IN         R16, PORTC+0
	ORI        R16, 6
	OUT        PORTC+0, R16
	JMP        L_display1
;lab7b.c,22 :: 		case 2: PORTC|=0b01011011;break;
L_display4:
	IN         R16, PORTC+0
	ORI        R16, 91
	OUT        PORTC+0, R16
	JMP        L_display1
;lab7b.c,23 :: 		case 3: PORTC|=0b01001111;break;
L_display5:
	IN         R16, PORTC+0
	ORI        R16, 79
	OUT        PORTC+0, R16
	JMP        L_display1
;lab7b.c,24 :: 		case 4: PORTC|=0b01100110;break;
L_display6:
	IN         R16, PORTC+0
	ORI        R16, 102
	OUT        PORTC+0, R16
	JMP        L_display1
;lab7b.c,25 :: 		case 5: PORTC|=0b01101101;break;
L_display7:
	IN         R16, PORTC+0
	ORI        R16, 109
	OUT        PORTC+0, R16
	JMP        L_display1
;lab7b.c,26 :: 		case 6: PORTC|=0b01111101;break;
L_display8:
	IN         R16, PORTC+0
	ORI        R16, 125
	OUT        PORTC+0, R16
	JMP        L_display1
;lab7b.c,27 :: 		case 7: PORTC|=0b00000111;break;
L_display9:
	IN         R16, PORTC+0
	ORI        R16, 7
	OUT        PORTC+0, R16
	JMP        L_display1
;lab7b.c,28 :: 		case 8: PORTC|=0b01111111;break;
L_display10:
	IN         R16, PORTC+0
	ORI        R16, 127
	OUT        PORTC+0, R16
	JMP        L_display1
;lab7b.c,29 :: 		case 9: PORTC|=0b01101111;break;
L_display11:
	IN         R16, PORTC+0
	ORI        R16, 111
	OUT        PORTC+0, R16
	JMP        L_display1
;lab7b.c,30 :: 		}
L_display0:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__display31
	JMP        L_display2
L__display31:
	LDI        R27, 1
	CP         R3, R27
	BRNE       L__display32
	JMP        L_display3
L__display32:
	LDI        R27, 2
	CP         R3, R27
	BRNE       L__display33
	JMP        L_display4
L__display33:
	LDI        R27, 3
	CP         R3, R27
	BRNE       L__display34
	JMP        L_display5
L__display34:
	LDI        R27, 4
	CP         R3, R27
	BRNE       L__display35
	JMP        L_display6
L__display35:
	LDI        R27, 5
	CP         R3, R27
	BRNE       L__display36
	JMP        L_display7
L__display36:
	LDI        R27, 6
	CP         R3, R27
	BRNE       L__display37
	JMP        L_display8
L__display37:
	LDI        R27, 7
	CP         R3, R27
	BRNE       L__display38
	JMP        L_display9
L__display38:
	LDI        R27, 8
	CP         R3, R27
	BRNE       L__display39
	JMP        L_display10
L__display39:
	LDI        R27, 9
	CP         R3, R27
	BRNE       L__display40
	JMP        L_display11
L__display40:
L_display1:
;lab7b.c,35 :: 		switch(p){
	JMP        L_display12
;lab7b.c,36 :: 		case 1: PORTA|=0b00001000;break;
L_display14:
	IN         R27, PORTA+0
	SBR        R27, 8
	OUT        PORTA+0, R27
	JMP        L_display13
;lab7b.c,37 :: 		case 2: PORTA|=0b00000100;break;
L_display15:
	IN         R16, PORTA+0
	ORI        R16, 4
	OUT        PORTA+0, R16
	JMP        L_display13
;lab7b.c,38 :: 		case 3: PORTA|=0b00000010;break;
L_display16:
	IN         R16, PORTA+0
	ORI        R16, 2
	OUT        PORTA+0, R16
	JMP        L_display13
;lab7b.c,39 :: 		case 4: PORTA|=0b00000001;break;
L_display17:
	IN         R16, PORTA+0
	ORI        R16, 1
	OUT        PORTA+0, R16
	JMP        L_display13
;lab7b.c,40 :: 		}
L_display12:
	LDI        R27, 1
	CP         R2, R27
	BRNE       L__display41
	JMP        L_display14
L__display41:
	LDI        R27, 2
	CP         R2, R27
	BRNE       L__display42
	JMP        L_display15
L__display42:
	LDI        R27, 3
	CP         R2, R27
	BRNE       L__display43
	JMP        L_display16
L__display43:
	LDI        R27, 4
	CP         R2, R27
	BRNE       L__display44
	JMP        L_display17
L__display44:
L_display13:
;lab7b.c,41 :: 		}
L_end_display:
	RET
; end of _display

_Init_Input_Capture:

;lab7b.c,43 :: 		void Init_Input_Capture(){
;lab7b.c,44 :: 		TCCR1A=0b00000000;
	LDI        R27, 0
	OUT        TCCR1A+0, R27
;lab7b.c,45 :: 		TCCR1B=0b01000010; //bit6 rising edge, bit0-2 Pre = 8
	LDI        R27, 66
	OUT        TCCR1B+0, R27
;lab7b.c,46 :: 		TIMSK |= 1<<5;     //input capture interrupt enable
	IN         R16, TIMSK+0
	ORI        R16, 32
	OUT        TIMSK+0, R16
;lab7b.c,47 :: 		TIMSK |= 1<<2;    //overflow interrupt enable
	ORI        R16, 4
	OUT        TIMSK+0, R16
;lab7b.c,48 :: 		}
L_end_Init_Input_Capture:
	RET
; end of _Init_Input_Capture

_IC_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;lab7b.c,50 :: 		void IC_ISR() iv IVT_ADDR_TIMER1_CAPT ics ICS_AUTO{
;lab7b.c,51 :: 		TCNT1H=0;
	LDI        R27, 0
	OUT        TCNT1H+0, R27
;lab7b.c,52 :: 		TCNT1L=0;
	LDI        R27, 0
	OUT        TCNT1L+0, R27
;lab7b.c,53 :: 		icr_l = ICR1L;
	IN         R16, ICR1L+0
	STS        _icr_l+0, R16
	LDI        R27, 0
	STS        _icr_l+1, R27
;lab7b.c,54 :: 		icr_h = ICR1H;
	IN         R16, ICR1H+0
	STS        _icr_h+0, R16
	LDI        R27, 0
	STS        _icr_h+1, R27
;lab7b.c,55 :: 		trot = (((icr_h << 8) | icr_l) + 65536*cycle)*1*2; //long //microsec
	LDS        R16, _icr_h+0
	LDS        R17, _icr_h+1
	MOV        R19, R16
	CLR        R18
	LDS        R16, _icr_l+0
	LDS        R17, _icr_l+1
	MOVW       R20, R18
	OR         R20, R16
	OR         R21, R17
	LDS        R16, _cycle+0
	LDS        R17, _cycle+1
	MOV        R19, R17
	MOV        R18, R16
	CLR        R16
	CLR        R17
	ADD        R16, R20
	ADC        R17, R21
	LDI        R27, 0
	SBRC       R21, 7
	LDI        R27, 255
	ADC        R18, R27
	ADC        R19, R27
	MOVW       R20, R16
	MOVW       R22, R18
	LSL        R20
	ROL        R21
	ROL        R22
	ROL        R23
	STS        _trot+0, R20
	STS        _trot+1, R21
	STS        _trot+2, R22
	STS        _trot+3, R23
;lab7b.c,56 :: 		rpm = 60000000/trot;
	LDI        R16, 0
	LDI        R17, 135
	LDI        R18, 147
	LDI        R19, 3
	CALL       _Div_32x32_S+0
	MOVW       R16, R18
	MOVW       R18, R20
	STS        _rpm+0, R16
	STS        _rpm+1, R17
;lab7b.c,57 :: 		cycle = 0;
	LDI        R27, 0
	STS        _cycle+0, R27
	STS        _cycle+1, R27
;lab7b.c,58 :: 		}
L_end_IC_ISR:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _IC_ISR

_COMP_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;lab7b.c,60 :: 		void COMP_ISR() iv IVT_ADDR_TIMER1_OVF ics ICS_AUTO{
;lab7b.c,61 :: 		cycle++;
	LDS        R16, _cycle+0
	LDS        R17, _cycle+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _cycle+0, R16
	STS        _cycle+1, R17
;lab7b.c,62 :: 		}
L_end_COMP_ISR:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _COMP_ISR

_Timer0_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;lab7b.c,64 :: 		void Timer0_ISR() iv IVT_ADDR_TIMER0_COMP{
;lab7b.c,65 :: 		if( ms == 500){
	PUSH       R2
	PUSH       R3
	LDS        R16, _ms+0
	LDS        R17, _ms+1
	CPI        R17, 1
	BRNE       L__Timer0_ISR49
	CPI        R16, 244
L__Timer0_ISR49:
	BREQ       L__Timer0_ISR50
	JMP        L_Timer0_ISR18
L__Timer0_ISR50:
;lab7b.c,66 :: 		value = rpm;
	LDS        R16, _rpm+0
	LDS        R17, _rpm+1
	STS        _value+0, R16
	STS        _value+1, R17
;lab7b.c,67 :: 		ms = 0;
	LDI        R27, 0
	STS        _ms+0, R27
	STS        _ms+1, R27
;lab7b.c,68 :: 		}
	JMP        L_Timer0_ISR19
L_Timer0_ISR18:
;lab7b.c,69 :: 		else ms++;
	LDS        R16, _ms+0
	LDS        R17, _ms+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _ms+0, R16
	STS        _ms+1, R17
L_Timer0_ISR19:
;lab7b.c,70 :: 		{poz++;
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _poz+0, R16
	STS        _poz+1, R17
;lab7b.c,71 :: 		switch(poz)
	JMP        L_Timer0_ISR20
;lab7b.c,72 :: 		{ case 1: display(1,value%10); break;
L_Timer0_ISR22:
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _value+0
	LDS        R17, _value+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	MOV        R3, R16
	LDI        R27, 1
	MOV        R2, R27
	CALL       _display+0
	JMP        L_Timer0_ISR21
;lab7b.c,73 :: 		case 2: display(2,value/10%10); break;
L_Timer0_ISR23:
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _value+0
	LDS        R17, _value+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	MOV        R3, R16
	LDI        R27, 2
	MOV        R2, R27
	CALL       _display+0
	JMP        L_Timer0_ISR21
;lab7b.c,74 :: 		case 3: display(3,value/100%10); break;
L_Timer0_ISR24:
	LDI        R20, 100
	LDI        R21, 0
	LDS        R16, _value+0
	LDS        R17, _value+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	MOV        R3, R16
	LDI        R27, 3
	MOV        R2, R27
	CALL       _display+0
	JMP        L_Timer0_ISR21
;lab7b.c,75 :: 		case 4: display(4,value/1000%10);poz=0;break;
L_Timer0_ISR25:
	LDI        R20, 232
	LDI        R21, 3
	LDS        R16, _value+0
	LDS        R17, _value+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	LDI        R20, 10
	LDI        R21, 0
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	MOV        R3, R16
	LDI        R27, 4
	MOV        R2, R27
	CALL       _display+0
	LDI        R27, 0
	STS        _poz+0, R27
	STS        _poz+1, R27
	JMP        L_Timer0_ISR21
;lab7b.c,76 :: 		}
L_Timer0_ISR20:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__Timer0_ISR51
	CPI        R16, 1
L__Timer0_ISR51:
	BRNE       L__Timer0_ISR52
	JMP        L_Timer0_ISR22
L__Timer0_ISR52:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__Timer0_ISR53
	CPI        R16, 2
L__Timer0_ISR53:
	BRNE       L__Timer0_ISR54
	JMP        L_Timer0_ISR23
L__Timer0_ISR54:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__Timer0_ISR55
	CPI        R16, 3
L__Timer0_ISR55:
	BRNE       L__Timer0_ISR56
	JMP        L_Timer0_ISR24
L__Timer0_ISR56:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__Timer0_ISR57
	CPI        R16, 4
L__Timer0_ISR57:
	BRNE       L__Timer0_ISR58
	JMP        L_Timer0_ISR25
L__Timer0_ISR58:
L_Timer0_ISR21:
;lab7b.c,78 :: 		}
L_end_Timer0_ISR:
	POP        R3
	POP        R2
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _Timer0_ISR

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;lab7b.c,81 :: 		void main() {
;lab7b.c,82 :: 		DDRA = 0b00001111;
	LDI        R27, 15
	OUT        DDRA+0, R27
;lab7b.c,83 :: 		DDRC = 0b11111111;
	LDI        R27, 255
	OUT        DDRC+0, R27
;lab7b.c,84 :: 		DDRD &=~(1<<6); //PD6 input
	IN         R27, DDRD+0
	CBR        R27, 64
	OUT        DDRD+0, R27
;lab7b.c,86 :: 		SREG|=1<<7;
	IN         R16, SREG+0
	ORI        R16, 128
	OUT        SREG+0, R16
;lab7b.c,87 :: 		init_timer0();
	CALL       _init_timer0+0
;lab7b.c,88 :: 		Init_Input_Capture();
	CALL       _Init_Input_Capture+0
;lab7b.c,89 :: 		for(;;){
L_main26:
;lab7b.c,91 :: 		}
	JMP        L_main26
;lab7b.c,94 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
