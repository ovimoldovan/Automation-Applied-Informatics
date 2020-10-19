
_init_adc:

;lab_convertoranalogdigital.c,1 :: 		void init_adc(){
;lab_convertoranalogdigital.c,2 :: 		ADMUX=0b01000111;   //channel ADC7
	LDI        R27, 71
	OUT        ADMUX+0, R27
;lab_convertoranalogdigital.c,3 :: 		ADCSRA = 0b10101111;//IE = ADC bit 3 Auto trigger bit 5
	LDI        R27, 175
	OUT        ADCSRA+0, R27
;lab_convertoranalogdigital.c,4 :: 		SFIOR = 0b01000000;
	LDI        R27, 64
	OUT        SFIOR+0, R27
;lab_convertoranalogdigital.c,6 :: 		}
L_end_init_adc:
	RET
; end of _init_adc

_adc:

;lab_convertoranalogdigital.c,12 :: 		void adc(char ch){
;lab_convertoranalogdigital.c,13 :: 		ADMUX&=0b11100000;
	IN         R16, ADMUX+0
	ANDI       R16, 224
	OUT        ADMUX+0, R16
;lab_convertoranalogdigital.c,14 :: 		ADMUX |=ch;
	OR         R16, R2
	OUT        ADMUX+0, R16
;lab_convertoranalogdigital.c,21 :: 		}
L_end_adc:
	RET
; end of _adc

_adc_isr:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;lab_convertoranalogdigital.c,22 :: 		void adc_isr() iv IVT_ADDR_ADC ics ICS_AUTO {
;lab_convertoranalogdigital.c,23 :: 		l = ADCL;
	IN         R16, ADCL+0
	STS        _l+0, R16
	LDI        R27, 0
	STS        _l+1, R27
;lab_convertoranalogdigital.c,24 :: 		h = ADCH;
	IN         R16, ADCH+0
	STS        _h+0, R16
	LDI        R27, 0
	STS        _h+1, R27
;lab_convertoranalogdigital.c,25 :: 		adv = h<<8|l;
	LDS        R16, _h+0
	LDS        R17, _h+1
	MOV        R19, R16
	CLR        R18
	LDS        R16, _l+0
	LDS        R17, _l+1
	OR         R16, R18
	OR         R17, R19
	STS        _adv+0, R16
	STS        _adv+1, R17
;lab_convertoranalogdigital.c,26 :: 		}
L_end_adc_isr:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _adc_isr

_init_INT0:

;lab_convertoranalogdigital.c,28 :: 		void init_INT0(){
;lab_convertoranalogdigital.c,29 :: 		GICR=0b01000000;      //IE INT 0
	LDI        R27, 64
	OUT        GICR+0, R27
;lab_convertoranalogdigital.c,30 :: 		MCUCR=0b00000011;   //rising edge
	LDI        R27, 3
	OUT        MCUCR+0, R27
;lab_convertoranalogdigital.c,31 :: 		}
L_end_init_INT0:
	RET
; end of _init_INT0

_ISR_INT0:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;lab_convertoranalogdigital.c,32 :: 		void ISR_INT0() iv IVT_ADDR_INT0 ics ICS_AUTO {
;lab_convertoranalogdigital.c,34 :: 		}
L_end_ISR_INT0:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _ISR_INT0

_init_timer0:

;lab_convertoranalogdigital.c,37 :: 		void init_timer0(){
;lab_convertoranalogdigital.c,38 :: 		TCCR0 = 0b00001011; //CTC-3,6,Prescaler 0,1,2
	LDI        R27, 11
	OUT        TCCR0+0, R27
;lab_convertoranalogdigital.c,39 :: 		TCNT0 = 0;
	LDI        R27, 0
	OUT        TCNT0+0, R27
;lab_convertoranalogdigital.c,40 :: 		OCR0 = 125;
	LDI        R27, 125
	OUT        OCR0+0, R27
;lab_convertoranalogdigital.c,41 :: 		TIMSK |= 0b00000010;
	IN         R27, TIMSK+0
	SBR        R27, 2
	OUT        TIMSK+0, R27
;lab_convertoranalogdigital.c,42 :: 		}
L_end_init_timer0:
	RET
; end of _init_timer0

_display:

;lab_convertoranalogdigital.c,44 :: 		void display(int p , int c)
;lab_convertoranalogdigital.c,46 :: 		PORTA&=0b11110000;
	IN         R16, PORTA+0
	ANDI       R16, 240
	OUT        PORTA+0, R16
;lab_convertoranalogdigital.c,47 :: 		PORTC&=0b00000000;
	IN         R16, PORTC+0
	ANDI       R16, 0
	OUT        PORTC+0, R16
;lab_convertoranalogdigital.c,48 :: 		switch(c){
	JMP        L_display0
;lab_convertoranalogdigital.c,49 :: 		case 0: PORTC|=0b00111111;
L_display2:
	IN         R16, PORTC+0
	ORI        R16, 63
	OUT        PORTC+0, R16
;lab_convertoranalogdigital.c,50 :: 		break;
	JMP        L_display1
;lab_convertoranalogdigital.c,51 :: 		case 1: PORTC|=0b00000110;
L_display3:
	IN         R16, PORTC+0
	ORI        R16, 6
	OUT        PORTC+0, R16
;lab_convertoranalogdigital.c,52 :: 		break;
	JMP        L_display1
;lab_convertoranalogdigital.c,53 :: 		case 2: PORTC|=0b01011011;
L_display4:
	IN         R16, PORTC+0
	ORI        R16, 91
	OUT        PORTC+0, R16
;lab_convertoranalogdigital.c,54 :: 		break;
	JMP        L_display1
;lab_convertoranalogdigital.c,55 :: 		case 3: PORTC|=0b01001111;
L_display5:
	IN         R16, PORTC+0
	ORI        R16, 79
	OUT        PORTC+0, R16
;lab_convertoranalogdigital.c,56 :: 		break;
	JMP        L_display1
;lab_convertoranalogdigital.c,57 :: 		case 4: PORTC|=0b01100110;
L_display6:
	IN         R16, PORTC+0
	ORI        R16, 102
	OUT        PORTC+0, R16
;lab_convertoranalogdigital.c,58 :: 		break;
	JMP        L_display1
;lab_convertoranalogdigital.c,59 :: 		case 5: PORTC|=0b01101101;
L_display7:
	IN         R16, PORTC+0
	ORI        R16, 109
	OUT        PORTC+0, R16
;lab_convertoranalogdigital.c,60 :: 		break;
	JMP        L_display1
;lab_convertoranalogdigital.c,61 :: 		case 6: PORTC|=0b01111101;
L_display8:
	IN         R16, PORTC+0
	ORI        R16, 125
	OUT        PORTC+0, R16
;lab_convertoranalogdigital.c,62 :: 		break;
	JMP        L_display1
;lab_convertoranalogdigital.c,63 :: 		case 7: PORTC|=0b00000111;
L_display9:
	IN         R16, PORTC+0
	ORI        R16, 7
	OUT        PORTC+0, R16
;lab_convertoranalogdigital.c,64 :: 		break;
	JMP        L_display1
;lab_convertoranalogdigital.c,65 :: 		case 8: PORTC|=0b01111111;
L_display10:
	IN         R16, PORTC+0
	ORI        R16, 127
	OUT        PORTC+0, R16
;lab_convertoranalogdigital.c,66 :: 		break;
	JMP        L_display1
;lab_convertoranalogdigital.c,67 :: 		case 9: PORTC|=0b01101111;
L_display11:
	IN         R16, PORTC+0
	ORI        R16, 111
	OUT        PORTC+0, R16
;lab_convertoranalogdigital.c,68 :: 		}
	JMP        L_display1
L_display0:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display36
	LDI        R27, 0
	CP         R4, R27
L__display36:
	BRNE       L__display37
	JMP        L_display2
L__display37:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display38
	LDI        R27, 1
	CP         R4, R27
L__display38:
	BRNE       L__display39
	JMP        L_display3
L__display39:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display40
	LDI        R27, 2
	CP         R4, R27
L__display40:
	BRNE       L__display41
	JMP        L_display4
L__display41:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display42
	LDI        R27, 3
	CP         R4, R27
L__display42:
	BRNE       L__display43
	JMP        L_display5
L__display43:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display44
	LDI        R27, 4
	CP         R4, R27
L__display44:
	BRNE       L__display45
	JMP        L_display6
L__display45:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display46
	LDI        R27, 5
	CP         R4, R27
L__display46:
	BRNE       L__display47
	JMP        L_display7
L__display47:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display48
	LDI        R27, 6
	CP         R4, R27
L__display48:
	BRNE       L__display49
	JMP        L_display8
L__display49:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display50
	LDI        R27, 7
	CP         R4, R27
L__display50:
	BRNE       L__display51
	JMP        L_display9
L__display51:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display52
	LDI        R27, 8
	CP         R4, R27
L__display52:
	BRNE       L__display53
	JMP        L_display10
L__display53:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display54
	LDI        R27, 9
	CP         R4, R27
L__display54:
	BRNE       L__display55
	JMP        L_display11
L__display55:
L_display1:
;lab_convertoranalogdigital.c,69 :: 		switch(p){
	JMP        L_display12
;lab_convertoranalogdigital.c,70 :: 		case 1: PORTA|=0b00000001;
L_display14:
	IN         R16, PORTA+0
	ORI        R16, 1
	OUT        PORTA+0, R16
;lab_convertoranalogdigital.c,71 :: 		break;
	JMP        L_display13
;lab_convertoranalogdigital.c,72 :: 		case 2: PORTA|=0b00000010;
L_display15:
	IN         R27, PORTA+0
	SBR        R27, 2
	OUT        PORTA+0, R27
;lab_convertoranalogdigital.c,73 :: 		break;
	JMP        L_display13
;lab_convertoranalogdigital.c,74 :: 		case 3: PORTA|=0b00000100;
L_display16:
	IN         R16, PORTA+0
	ORI        R16, 4
	OUT        PORTA+0, R16
;lab_convertoranalogdigital.c,75 :: 		break;
	JMP        L_display13
;lab_convertoranalogdigital.c,76 :: 		case 4:PORTA|= 0b00001000;
L_display17:
	IN         R16, PORTA+0
	ORI        R16, 8
	OUT        PORTA+0, R16
;lab_convertoranalogdigital.c,77 :: 		break;
	JMP        L_display13
;lab_convertoranalogdigital.c,78 :: 		}//Delay_ms(4);
L_display12:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__display56
	LDI        R27, 1
	CP         R2, R27
L__display56:
	BRNE       L__display57
	JMP        L_display14
L__display57:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__display58
	LDI        R27, 2
	CP         R2, R27
L__display58:
	BRNE       L__display59
	JMP        L_display15
L__display59:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__display60
	LDI        R27, 3
	CP         R2, R27
L__display60:
	BRNE       L__display61
	JMP        L_display16
L__display61:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__display62
	LDI        R27, 4
	CP         R2, R27
L__display62:
	BRNE       L__display63
	JMP        L_display17
L__display63:
L_display13:
;lab_convertoranalogdigital.c,79 :: 		}
L_end_display:
	RET
; end of _display

_Timer0_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;lab_convertoranalogdigital.c,83 :: 		void Timer0_ISR() iv IVT_ADDR_TIMER0_COMP ics ICS_AUTO {
;lab_convertoranalogdigital.c,84 :: 		poz++;
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _poz+0, R16
	STS        _poz+1, R17
;lab_convertoranalogdigital.c,85 :: 		switch(poz)
	JMP        L_Timer0_ISR18
;lab_convertoranalogdigital.c,87 :: 		case 1: display(1, value%10); break;
L_Timer0_ISR20:
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _value+0
	LDS        R17, _value+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R24
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _display+0
	JMP        L_Timer0_ISR19
;lab_convertoranalogdigital.c,88 :: 		case 2: display(2, (value/10)%10); break;
L_Timer0_ISR21:
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
	MOVW       R4, R16
	LDI        R27, 2
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _display+0
	JMP        L_Timer0_ISR19
;lab_convertoranalogdigital.c,89 :: 		case 3: display(3, (value/100)%10); break;
L_Timer0_ISR22:
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
	MOVW       R4, R16
	LDI        R27, 3
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _display+0
	JMP        L_Timer0_ISR19
;lab_convertoranalogdigital.c,90 :: 		case 4: display(4, (value/1000)%10); poz=0; break;
L_Timer0_ISR23:
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
	MOVW       R4, R16
	LDI        R27, 4
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _display+0
	LDI        R27, 0
	STS        _poz+0, R27
	STS        _poz+1, R27
	JMP        L_Timer0_ISR19
;lab_convertoranalogdigital.c,91 :: 		}
L_Timer0_ISR18:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__Timer0_ISR65
	CPI        R16, 1
L__Timer0_ISR65:
	BRNE       L__Timer0_ISR66
	JMP        L_Timer0_ISR20
L__Timer0_ISR66:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__Timer0_ISR67
	CPI        R16, 2
L__Timer0_ISR67:
	BRNE       L__Timer0_ISR68
	JMP        L_Timer0_ISR21
L__Timer0_ISR68:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__Timer0_ISR69
	CPI        R16, 3
L__Timer0_ISR69:
	BRNE       L__Timer0_ISR70
	JMP        L_Timer0_ISR22
L__Timer0_ISR70:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__Timer0_ISR71
	CPI        R16, 4
L__Timer0_ISR71:
	BRNE       L__Timer0_ISR72
	JMP        L_Timer0_ISR23
L__Timer0_ISR72:
L_Timer0_ISR19:
;lab_convertoranalogdigital.c,92 :: 		if(ms==100)
	LDS        R16, _ms+0
	LDS        R17, _ms+1
	CPI        R17, 0
	BRNE       L__Timer0_ISR73
	CPI        R16, 100
L__Timer0_ISR73:
	BREQ       L__Timer0_ISR74
	JMP        L_Timer0_ISR24
L__Timer0_ISR74:
;lab_convertoranalogdigital.c,96 :: 		vin = ((float)adv*5)/1024;
	LDS        R16, _adv+0
	LDS        R17, _adv+1
	LDI        R18, 0
	SBRC       R17, 7
	LDI        R18, 255
	MOV        R19, R18
	CALL       _float_slong2fp+0
	LDI        R20, 0
	LDI        R21, 0
	LDI        R22, 160
	LDI        R23, 64
	CALL       _float_fpmul1+0
	LDI        R20, 0
	LDI        R21, 0
	LDI        R22, 128
	LDI        R23, 68
	CALL       _float_fpdiv1+0
	STS        _vin+0, R16
	STS        _vin+1, R17
	STS        _vin+2, R18
	STS        _vin+3, R19
;lab_convertoranalogdigital.c,97 :: 		tmp = vin*1000/10;
	LDI        R20, 0
	LDI        R21, 0
	LDI        R22, 122
	LDI        R23, 68
	CALL       _float_fpmul1+0
	LDI        R20, 0
	LDI        R21, 0
	LDI        R22, 32
	LDI        R23, 65
	CALL       _float_fpdiv1+0
	STS        _tmp+0, R16
	STS        _tmp+1, R17
	STS        _tmp+2, R18
	STS        _tmp+3, R19
;lab_convertoranalogdigital.c,98 :: 		value = (int)(tmp*10);
	LDI        R20, 0
	LDI        R21, 0
	LDI        R22, 32
	LDI        R23, 65
	CALL       _float_fpmul1+0
	CALL       _float_fpint+0
	STS        _value+0, R16
	STS        _value+1, R17
;lab_convertoranalogdigital.c,99 :: 		ms = 0;
	LDI        R27, 0
	STS        _ms+0, R27
	STS        _ms+1, R27
;lab_convertoranalogdigital.c,100 :: 		}
	JMP        L_Timer0_ISR25
L_Timer0_ISR24:
;lab_convertoranalogdigital.c,101 :: 		else ms++;
	LDS        R16, _ms+0
	LDS        R17, _ms+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _ms+0, R16
	STS        _ms+1, R17
L_Timer0_ISR25:
;lab_convertoranalogdigital.c,102 :: 		}
L_end_Timer0_ISR:
	POP        R5
	POP        R4
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

;lab_convertoranalogdigital.c,104 :: 		void main() {
;lab_convertoranalogdigital.c,105 :: 		DDRA = 0b00001111;
	LDI        R27, 15
	OUT        DDRA+0, R27
;lab_convertoranalogdigital.c,106 :: 		DDRC = 0b11111111;
	LDI        R27, 255
	OUT        DDRC+0, R27
;lab_convertoranalogdigital.c,107 :: 		init_timer0();
	CALL       _init_timer0+0
;lab_convertoranalogdigital.c,108 :: 		init_INT0();
	CALL       _init_INT0+0
;lab_convertoranalogdigital.c,109 :: 		init_adc();
	CALL       _init_adc+0
;lab_convertoranalogdigital.c,110 :: 		SREG |= (1<<7);
	IN         R27, SREG+0
	SBR        R27, 128
	OUT        SREG+0, R27
;lab_convertoranalogdigital.c,111 :: 		for(;;){
L_main26:
;lab_convertoranalogdigital.c,113 :: 		}
	JMP        L_main26
;lab_convertoranalogdigital.c,117 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
