
_init_adc:

;lab_pwm.c,1 :: 		void init_adc(){
;lab_pwm.c,2 :: 		ADMUX=0b01000111;   //channel ADC7
	LDI        R27, 71
	OUT        ADMUX+0, R27
;lab_pwm.c,3 :: 		ADCSRA = 0b10101111;//IE = ADC bit 3 Auto trigger bit 5
	LDI        R27, 175
	OUT        ADCSRA+0, R27
;lab_pwm.c,4 :: 		SFIOR = 0b01000000;
	LDI        R27, 64
	OUT        SFIOR+0, R27
;lab_pwm.c,6 :: 		}
L_end_init_adc:
	RET
; end of _init_adc

_adc:

;lab_pwm.c,15 :: 		int adc(char ch){
;lab_pwm.c,16 :: 		ADMUX&=0b11100000;
	IN         R16, ADMUX+0
	ANDI       R16, 224
	OUT        ADMUX+0, R16
;lab_pwm.c,17 :: 		ADMUX |=ch;
	OR         R16, R2
	OUT        ADMUX+0, R16
;lab_pwm.c,18 :: 		ADCSRA |= (1<<6);
	IN         R27, ADCSRA+0
	SBR        R27, 64
	OUT        ADCSRA+0, R27
;lab_pwm.c,19 :: 		while(ADCSRA&(1<<6));
L_adc0:
	IN         R16, ADCSRA+0
	SBRS       R16, 6
	JMP        L_adc1
	JMP        L_adc0
L_adc1:
;lab_pwm.c,20 :: 		l = ADCL;
	IN         R16, ADCL+0
	STS        _l+0, R16
	LDI        R27, 0
	STS        _l+1, R27
;lab_pwm.c,21 :: 		h = ADCH;
	IN         R16, ADCH+0
	STS        _h+0, R16
	LDI        R27, 0
	STS        _h+1, R27
;lab_pwm.c,22 :: 		return h<<8|l;
	LDS        R16, _h+0
	LDS        R17, _h+1
	MOV        R19, R16
	CLR        R18
	LDS        R16, _l+0
	LDS        R17, _l+1
	OR         R16, R18
	OR         R17, R19
;lab_pwm.c,24 :: 		}
L_end_adc:
	RET
; end of _adc

_adc_isr:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;lab_pwm.c,25 :: 		void adc_isr() iv IVT_ADDR_ADC ics ICS_AUTO {
;lab_pwm.c,26 :: 		l = ADCL;
	IN         R16, ADCL+0
	STS        _l+0, R16
	LDI        R27, 0
	STS        _l+1, R27
;lab_pwm.c,27 :: 		h = ADCH;
	IN         R16, ADCH+0
	STS        _h+0, R16
	LDI        R27, 0
	STS        _h+1, R27
;lab_pwm.c,28 :: 		adv = h<<8|l;
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
;lab_pwm.c,29 :: 		}
L_end_adc_isr:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _adc_isr

_init_timer0:

;lab_pwm.c,31 :: 		void init_timer0(){
;lab_pwm.c,32 :: 		TCCR0 = 0b00001011; //CTC-3,6,Prescaler 0,1,2
	LDI        R27, 11
	OUT        TCCR0+0, R27
;lab_pwm.c,33 :: 		TCNT0 = 0;
	LDI        R27, 0
	OUT        TCNT0+0, R27
;lab_pwm.c,34 :: 		OCR0 = 125;
	LDI        R27, 125
	OUT        OCR0+0, R27
;lab_pwm.c,35 :: 		TIMSK |= 0b00000010;
	IN         R27, TIMSK+0
	SBR        R27, 2
	OUT        TIMSK+0, R27
;lab_pwm.c,36 :: 		}
L_end_init_timer0:
	RET
; end of _init_timer0

_display:

;lab_pwm.c,38 :: 		void display(int p , int c)
;lab_pwm.c,40 :: 		PORTA&=0b11110000;
	IN         R16, PORTA+0
	ANDI       R16, 240
	OUT        PORTA+0, R16
;lab_pwm.c,41 :: 		PORTC&=0b00000000;
	IN         R16, PORTC+0
	ANDI       R16, 0
	OUT        PORTC+0, R16
;lab_pwm.c,42 :: 		switch(c){
	JMP        L_display2
;lab_pwm.c,43 :: 		case 0: PORTC|=0b00111111;
L_display4:
	IN         R16, PORTC+0
	ORI        R16, 63
	OUT        PORTC+0, R16
;lab_pwm.c,44 :: 		break;
	JMP        L_display3
;lab_pwm.c,45 :: 		case 1: PORTC|=0b00000110;
L_display5:
	IN         R16, PORTC+0
	ORI        R16, 6
	OUT        PORTC+0, R16
;lab_pwm.c,46 :: 		break;
	JMP        L_display3
;lab_pwm.c,47 :: 		case 2: PORTC|=0b01011011;
L_display6:
	IN         R16, PORTC+0
	ORI        R16, 91
	OUT        PORTC+0, R16
;lab_pwm.c,48 :: 		break;
	JMP        L_display3
;lab_pwm.c,49 :: 		case 3: PORTC|=0b01001111;
L_display7:
	IN         R16, PORTC+0
	ORI        R16, 79
	OUT        PORTC+0, R16
;lab_pwm.c,50 :: 		break;
	JMP        L_display3
;lab_pwm.c,51 :: 		case 4: PORTC|=0b01100110;
L_display8:
	IN         R16, PORTC+0
	ORI        R16, 102
	OUT        PORTC+0, R16
;lab_pwm.c,52 :: 		break;
	JMP        L_display3
;lab_pwm.c,53 :: 		case 5: PORTC|=0b01101101;
L_display9:
	IN         R16, PORTC+0
	ORI        R16, 109
	OUT        PORTC+0, R16
;lab_pwm.c,54 :: 		break;
	JMP        L_display3
;lab_pwm.c,55 :: 		case 6: PORTC|=0b01111101;
L_display10:
	IN         R16, PORTC+0
	ORI        R16, 125
	OUT        PORTC+0, R16
;lab_pwm.c,56 :: 		break;
	JMP        L_display3
;lab_pwm.c,57 :: 		case 7: PORTC|=0b00000111;
L_display11:
	IN         R16, PORTC+0
	ORI        R16, 7
	OUT        PORTC+0, R16
;lab_pwm.c,58 :: 		break;
	JMP        L_display3
;lab_pwm.c,59 :: 		case 8: PORTC|=0b01111111;
L_display12:
	IN         R16, PORTC+0
	ORI        R16, 127
	OUT        PORTC+0, R16
;lab_pwm.c,60 :: 		break;
	JMP        L_display3
;lab_pwm.c,61 :: 		case 9: PORTC|=0b01101111;
L_display13:
	IN         R16, PORTC+0
	ORI        R16, 111
	OUT        PORTC+0, R16
;lab_pwm.c,62 :: 		}
	JMP        L_display3
L_display2:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display40
	LDI        R27, 0
	CP         R4, R27
L__display40:
	BRNE       L__display41
	JMP        L_display4
L__display41:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display42
	LDI        R27, 1
	CP         R4, R27
L__display42:
	BRNE       L__display43
	JMP        L_display5
L__display43:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display44
	LDI        R27, 2
	CP         R4, R27
L__display44:
	BRNE       L__display45
	JMP        L_display6
L__display45:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display46
	LDI        R27, 3
	CP         R4, R27
L__display46:
	BRNE       L__display47
	JMP        L_display7
L__display47:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display48
	LDI        R27, 4
	CP         R4, R27
L__display48:
	BRNE       L__display49
	JMP        L_display8
L__display49:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display50
	LDI        R27, 5
	CP         R4, R27
L__display50:
	BRNE       L__display51
	JMP        L_display9
L__display51:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display52
	LDI        R27, 6
	CP         R4, R27
L__display52:
	BRNE       L__display53
	JMP        L_display10
L__display53:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display54
	LDI        R27, 7
	CP         R4, R27
L__display54:
	BRNE       L__display55
	JMP        L_display11
L__display55:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display56
	LDI        R27, 8
	CP         R4, R27
L__display56:
	BRNE       L__display57
	JMP        L_display12
L__display57:
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__display58
	LDI        R27, 9
	CP         R4, R27
L__display58:
	BRNE       L__display59
	JMP        L_display13
L__display59:
L_display3:
;lab_pwm.c,63 :: 		switch(p){
	JMP        L_display14
;lab_pwm.c,64 :: 		case 1: PORTA|=0b00000001;
L_display16:
	IN         R16, PORTA+0
	ORI        R16, 1
	OUT        PORTA+0, R16
;lab_pwm.c,65 :: 		break;
	JMP        L_display15
;lab_pwm.c,66 :: 		case 2: PORTA|=0b00000010;
L_display17:
	IN         R27, PORTA+0
	SBR        R27, 2
	OUT        PORTA+0, R27
;lab_pwm.c,67 :: 		break;
	JMP        L_display15
;lab_pwm.c,68 :: 		case 3: PORTA|=0b00000100;
L_display18:
	IN         R16, PORTA+0
	ORI        R16, 4
	OUT        PORTA+0, R16
;lab_pwm.c,69 :: 		break;
	JMP        L_display15
;lab_pwm.c,70 :: 		case 4:PORTA|= 0b00001000;
L_display19:
	IN         R16, PORTA+0
	ORI        R16, 8
	OUT        PORTA+0, R16
;lab_pwm.c,71 :: 		break;
	JMP        L_display15
;lab_pwm.c,72 :: 		}//Delay_ms(4);
L_display14:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__display60
	LDI        R27, 1
	CP         R2, R27
L__display60:
	BRNE       L__display61
	JMP        L_display16
L__display61:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__display62
	LDI        R27, 2
	CP         R2, R27
L__display62:
	BRNE       L__display63
	JMP        L_display17
L__display63:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__display64
	LDI        R27, 3
	CP         R2, R27
L__display64:
	BRNE       L__display65
	JMP        L_display18
L__display65:
	LDI        R27, 0
	CP         R3, R27
	BRNE       L__display66
	LDI        R27, 4
	CP         R2, R27
L__display66:
	BRNE       L__display67
	JMP        L_display19
L__display67:
L_display15:
;lab_pwm.c,73 :: 		}
L_end_display:
	RET
; end of _display

_Timer0_ISR:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;lab_pwm.c,75 :: 		void Timer0_ISR() iv IVT_ADDR_TIMER0_COMP ics ICS_AUTO {
;lab_pwm.c,76 :: 		poz++;
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
;lab_pwm.c,77 :: 		switch(poz)
	JMP        L_Timer0_ISR20
;lab_pwm.c,79 :: 		case 1: display(1, value%10); break;
L_Timer0_ISR22:
	LDI        R20, 10
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	LDS        R16, _value+0
	LDS        R17, _value+1
	LDS        R18, _value+2
	LDS        R19, _value+3
	CALL       _Div_32x32_S+0
	MOVW       R16, R22
	MOVW       R18, R24
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _display+0
	JMP        L_Timer0_ISR21
;lab_pwm.c,80 :: 		case 2: display(2, (value/10)%10); break;
L_Timer0_ISR23:
	LDI        R20, 10
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	LDS        R16, _value+0
	LDS        R17, _value+1
	LDS        R18, _value+2
	LDS        R19, _value+3
	CALL       _Div_32x32_S+0
	MOVW       R16, R18
	MOVW       R18, R20
	LDI        R20, 10
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	CALL       _Div_32x32_S+0
	MOVW       R16, R22
	MOVW       R18, R24
	MOVW       R4, R16
	LDI        R27, 2
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _display+0
	JMP        L_Timer0_ISR21
;lab_pwm.c,81 :: 		case 3: display(3, (value/100)%10); break;
L_Timer0_ISR24:
	LDI        R20, 100
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	LDS        R16, _value+0
	LDS        R17, _value+1
	LDS        R18, _value+2
	LDS        R19, _value+3
	CALL       _Div_32x32_S+0
	MOVW       R16, R18
	MOVW       R18, R20
	LDI        R20, 10
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	CALL       _Div_32x32_S+0
	MOVW       R16, R22
	MOVW       R18, R24
	MOVW       R4, R16
	LDI        R27, 3
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _display+0
	JMP        L_Timer0_ISR21
;lab_pwm.c,82 :: 		case 4: display(4, (value/1000)%10); poz=0; break;
L_Timer0_ISR25:
	LDI        R20, 232
	LDI        R21, 3
	LDI        R22, 0
	LDI        R23, 0
	LDS        R16, _value+0
	LDS        R17, _value+1
	LDS        R18, _value+2
	LDS        R19, _value+3
	CALL       _Div_32x32_S+0
	MOVW       R16, R18
	MOVW       R18, R20
	LDI        R20, 10
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	CALL       _Div_32x32_S+0
	MOVW       R16, R22
	MOVW       R18, R24
	MOVW       R4, R16
	LDI        R27, 4
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _display+0
	LDI        R27, 0
	STS        _poz+0, R27
	STS        _poz+1, R27
	JMP        L_Timer0_ISR21
;lab_pwm.c,83 :: 		}
L_Timer0_ISR20:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__Timer0_ISR69
	CPI        R16, 1
L__Timer0_ISR69:
	BRNE       L__Timer0_ISR70
	JMP        L_Timer0_ISR22
L__Timer0_ISR70:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__Timer0_ISR71
	CPI        R16, 2
L__Timer0_ISR71:
	BRNE       L__Timer0_ISR72
	JMP        L_Timer0_ISR23
L__Timer0_ISR72:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__Timer0_ISR73
	CPI        R16, 3
L__Timer0_ISR73:
	BRNE       L__Timer0_ISR74
	JMP        L_Timer0_ISR24
L__Timer0_ISR74:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__Timer0_ISR75
	CPI        R16, 4
L__Timer0_ISR75:
	BRNE       L__Timer0_ISR76
	JMP        L_Timer0_ISR25
L__Timer0_ISR76:
L_Timer0_ISR21:
;lab_pwm.c,88 :: 		adv = adc(6);
	LDI        R27, 6
	MOV        R2, R27
	CALL       _adc+0
	STS        _adv+0, R16
	STS        _adv+1, R17
;lab_pwm.c,89 :: 		freq = (fMax-fMin)/ADCmax*adv+fMin;
	LDS        R0, _fMin+0
	LDS        R1, _fMin+1
	LDS        R16, _fMax+0
	LDS        R17, _fMax+1
	SUB        R16, R0
	SBC        R17, R1
	LDS        R20, _ADCmax+0
	LDS        R21, _ADCmax+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	LDS        R20, _adv+0
	LDS        R21, _adv+1
	CALL       _HWMul_16x16+0
	LDS        R18, _fMin+0
	LDS        R19, _fMin+1
	MOVW       R20, R18
	ADD        R20, R16
	ADC        R21, R17
	STS        _freq+0, R20
	STS        _freq+1, R21
;lab_pwm.c,90 :: 		icr = 10000000/freq-1;
	LDI        R22, 0
	SBRC       R21, 7
	LDI        R22, 255
	MOV        R23, R22
	LDI        R16, 128
	LDI        R17, 150
	LDI        R18, 152
	LDI        R19, 0
	CALL       _Div_32x32_S+0
	MOVW       R16, R18
	MOVW       R18, R20
	MOVW       R20, R16
	SUBI       R20, 1
	SBCI       R21, 0
	STS        _icr+0, R20
	STS        _icr+1, R21
;lab_pwm.c,91 :: 		ICR1H = icr>>8;
	MOV        R16, R21
	LDI        R17, 0
	SBRC       R16, 7
	LDI        R17, 255
	OUT        ICR1H+0, R16
;lab_pwm.c,92 :: 		ICR1L = icr;
	OUT        ICR1L+0, R20
;lab_pwm.c,93 :: 		OCR1BH = (icr/2)>>8;
	MOVW       R18, R20
	ASR        R19
	ROR        R18
	MOV        R16, R19
	LDI        R17, 0
	SBRC       R16, 7
	LDI        R17, 255
	OUT        OCR1BH+0, R16
;lab_pwm.c,94 :: 		OCR1BL = icr/2;
	OUT        OCR1BL+0, R18
;lab_pwm.c,95 :: 		value = freq/10;
	LDI        R20, 10
	LDI        R21, 0
	LDS        R16, _freq+0
	LDS        R17, _freq+1
	CALL       _Div_16x16_S+0
	MOVW       R16, R22
	STS        _value+0, R16
	STS        _value+1, R17
	LDI        R27, 0
	SBRC       R17, 7
	LDI        R27, 255
	STS        _value+2, R27
	STS        _value+3, R27
;lab_pwm.c,96 :: 		}
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

_init_Buzzer:

;lab_pwm.c,98 :: 		void init_Buzzer()
;lab_pwm.c,100 :: 		TCCR1A =0b00100010;
	LDI        R27, 34
	OUT        TCCR1A+0, R27
;lab_pwm.c,101 :: 		TCCR1B =0b00011010;
	LDI        R27, 26
	OUT        TCCR1B+0, R27
;lab_pwm.c,102 :: 		}
L_end_init_Buzzer:
	RET
; end of _init_Buzzer

_ISR_Timer1:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;lab_pwm.c,103 :: 		void ISR_Timer1() iv IVT_ADDR_TIMER1_COMPB ics ICS_AUTO {
;lab_pwm.c,105 :: 		poz++;
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
;lab_pwm.c,106 :: 		switch(poz)
	JMP        L_ISR_Timer126
;lab_pwm.c,108 :: 		case 1: display(1, value%10); break;
L_ISR_Timer128:
	LDI        R20, 10
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	LDS        R16, _value+0
	LDS        R17, _value+1
	LDS        R18, _value+2
	LDS        R19, _value+3
	CALL       _Div_32x32_S+0
	MOVW       R16, R22
	MOVW       R18, R24
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _display+0
	JMP        L_ISR_Timer127
;lab_pwm.c,109 :: 		case 2: display(2, (value/10)%10); break;
L_ISR_Timer129:
	LDI        R20, 10
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	LDS        R16, _value+0
	LDS        R17, _value+1
	LDS        R18, _value+2
	LDS        R19, _value+3
	CALL       _Div_32x32_S+0
	MOVW       R16, R18
	MOVW       R18, R20
	LDI        R20, 10
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	CALL       _Div_32x32_S+0
	MOVW       R16, R22
	MOVW       R18, R24
	MOVW       R4, R16
	LDI        R27, 2
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _display+0
	JMP        L_ISR_Timer127
;lab_pwm.c,110 :: 		case 3: display(3, (value/100)%10); break;
L_ISR_Timer130:
	LDI        R20, 100
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	LDS        R16, _value+0
	LDS        R17, _value+1
	LDS        R18, _value+2
	LDS        R19, _value+3
	CALL       _Div_32x32_S+0
	MOVW       R16, R18
	MOVW       R18, R20
	LDI        R20, 10
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	CALL       _Div_32x32_S+0
	MOVW       R16, R22
	MOVW       R18, R24
	MOVW       R4, R16
	LDI        R27, 3
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _display+0
	JMP        L_ISR_Timer127
;lab_pwm.c,111 :: 		case 4: display(4, (value/1000)%10); poz=0; break;
L_ISR_Timer131:
	LDI        R20, 232
	LDI        R21, 3
	LDI        R22, 0
	LDI        R23, 0
	LDS        R16, _value+0
	LDS        R17, _value+1
	LDS        R18, _value+2
	LDS        R19, _value+3
	CALL       _Div_32x32_S+0
	MOVW       R16, R18
	MOVW       R18, R20
	LDI        R20, 10
	LDI        R21, 0
	LDI        R22, 0
	LDI        R23, 0
	CALL       _Div_32x32_S+0
	MOVW       R16, R22
	MOVW       R18, R24
	MOVW       R4, R16
	LDI        R27, 4
	MOV        R2, R27
	LDI        R27, 0
	MOV        R3, R27
	CALL       _display+0
	LDI        R27, 0
	STS        _poz+0, R27
	STS        _poz+1, R27
	JMP        L_ISR_Timer127
;lab_pwm.c,112 :: 		}
L_ISR_Timer126:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__ISR_Timer179
	CPI        R16, 1
L__ISR_Timer179:
	BRNE       L__ISR_Timer180
	JMP        L_ISR_Timer128
L__ISR_Timer180:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__ISR_Timer181
	CPI        R16, 2
L__ISR_Timer181:
	BRNE       L__ISR_Timer182
	JMP        L_ISR_Timer129
L__ISR_Timer182:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__ISR_Timer183
	CPI        R16, 3
L__ISR_Timer183:
	BRNE       L__ISR_Timer184
	JMP        L_ISR_Timer130
L__ISR_Timer184:
	LDS        R16, _poz+0
	LDS        R17, _poz+1
	CPI        R17, 0
	BRNE       L__ISR_Timer185
	CPI        R16, 4
L__ISR_Timer185:
	BRNE       L__ISR_Timer186
	JMP        L_ISR_Timer131
L__ISR_Timer186:
L_ISR_Timer127:
;lab_pwm.c,115 :: 		}
L_end_ISR_Timer1:
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
; end of _ISR_Timer1

_init_PWM:

;lab_pwm.c,117 :: 		void init_PWM(){
;lab_pwm.c,118 :: 		TCCR2=0b01101001;
	LDI        R27, 105
	OUT        TCCR2+0, R27
;lab_pwm.c,119 :: 		OCR2 = 63;
	LDI        R27, 63
	OUT        OCR2+0, R27
;lab_pwm.c,120 :: 		}
L_end_init_PWM:
	RET
; end of _init_PWM

_func:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;lab_pwm.c,122 :: 		int func(int x){
;lab_pwm.c,123 :: 		int a = (20000-20)/1023;
; a start address is: 18 (R18)
	LDI        R18, 19
	LDI        R19, 0
;lab_pwm.c,124 :: 		int b = 20;
	LDI        R27, 20
	STD        Y+0, R27
	LDI        R27, 0
	STD        Y+1, R27
;lab_pwm.c,125 :: 		return a*x+b;
	MOVW       R16, R18
	MOVW       R20, R2
	CALL       _HWMul_16x16+0
; a end address is: 18 (R18)
	LDD        R18, Y+0
	LDD        R19, Y+1
	ADD        R16, R18
	ADC        R17, R19
;lab_pwm.c,126 :: 		}
L_end_func:
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _func

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;lab_pwm.c,129 :: 		void main() {
;lab_pwm.c,130 :: 		DDRA = 0b00001111;
	LDI        R27, 15
	OUT        DDRA+0, R27
;lab_pwm.c,131 :: 		DDRC = 0b11111111;
	LDI        R27, 255
	OUT        DDRC+0, R27
;lab_pwm.c,135 :: 		DDRD |=1<<7;
	IN         R16, DDRD+0
	ORI        R16, 128
	OUT        DDRD+0, R16
;lab_pwm.c,136 :: 		DDRD |=1<<4;
	ORI        R16, 16
	OUT        DDRD+0, R16
;lab_pwm.c,137 :: 		init_Buzzer();
	CALL       _init_Buzzer+0
;lab_pwm.c,138 :: 		init_timer0();
	CALL       _init_timer0+0
;lab_pwm.c,139 :: 		init_PWM();
	CALL       _init_PWM+0
;lab_pwm.c,140 :: 		init_adc();
	CALL       _init_adc+0
;lab_pwm.c,141 :: 		SREG |= (1<<7);
	IN         R27, SREG+0
	SBR        R27, 128
	OUT        SREG+0, R27
;lab_pwm.c,142 :: 		for(;;){
L_main32:
;lab_pwm.c,144 :: 		}
	JMP        L_main32
;lab_pwm.c,148 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
