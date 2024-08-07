
_automatic_traffic:

;test3.c,14 :: 		void automatic_traffic() {
;test3.c,16 :: 		while(automatic == 1) {
L_automatic_traffic0:
	BTFSS      PORTA+0, 1
	GOTO       L_automatic_traffic1
;test3.c,17 :: 		for(counter = 15; counter > 0; counter--) {
	MOVLW      15
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
L_automatic_traffic2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__automatic_traffic33
	MOVF       _counter+0, 0
	SUBLW      0
L__automatic_traffic33:
	BTFSC      STATUS+0, 0
	GOTO       L_automatic_traffic3
;test3.c,19 :: 		portb.b1 =1 ;
	BSF        PORTB+0, 1
;test3.c,20 :: 		portb.b2=1;
	BSF        PORTB+0, 2
;test3.c,21 :: 		portb.b3=1;
	BSF        PORTB+0, 3
;test3.c,22 :: 		portb.b4=1;
	BSF        PORTB+0, 4
;test3.c,23 :: 		portc = (counter % 10) + (counter / 10) * 16;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__automatic_traffic+0
	MOVF       R0+1, 0
	MOVWF      FLOC__automatic_traffic+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      4
	MOVWF      R3+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R3+0, 0
L__automatic_traffic34:
	BTFSC      STATUS+0, 2
	GOTO       L__automatic_traffic35
	RLF        R2+0, 1
	BCF        R2+0, 0
	ADDLW      255
	GOTO       L__automatic_traffic34
L__automatic_traffic35:
	MOVF       R2+0, 0
	ADDWF      FLOC__automatic_traffic+0, 0
	MOVWF      PORTC+0
;test3.c,27 :: 		if(counter > 3) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__automatic_traffic36
	MOVF       _counter+0, 0
	SUBLW      3
L__automatic_traffic36:
	BTFSC      STATUS+0, 0
	GOTO       L_automatic_traffic5
;test3.c,28 :: 		rw = 1; gs = 1;
	BSF        PORTD+0, 0
	BSF        PORTD+0, 3
;test3.c,29 :: 		rs = 0; ys = 0; gw = 0; yw = 0;
	BCF        PORTD+0, 5
	BCF        PORTD+0, 4
	BCF        PORTD+0, 2
	BCF        PORTD+0, 1
;test3.c,30 :: 		} else {
	GOTO       L_automatic_traffic6
L_automatic_traffic5:
;test3.c,31 :: 		ys = 1; rw = 1;
	BSF        PORTD+0, 4
	BSF        PORTD+0, 0
;test3.c,32 :: 		gw = 0; yw = 0; gs = 0; rs = 0;
	BCF        PORTD+0, 2
	BCF        PORTD+0, 1
	BCF        PORTD+0, 3
	BCF        PORTD+0, 5
;test3.c,33 :: 		}
L_automatic_traffic6:
;test3.c,35 :: 		if(start == 0) {
	BTFSC      PORTA+0, 0
	GOTO       L_automatic_traffic7
;test3.c,36 :: 		portc = 0;
	CLRF       PORTC+0
;test3.c,37 :: 		break;
	GOTO       L_automatic_traffic3
;test3.c,38 :: 		}
L_automatic_traffic7:
;test3.c,40 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_automatic_traffic8:
	DECFSZ     R13+0, 1
	GOTO       L_automatic_traffic8
	DECFSZ     R12+0, 1
	GOTO       L_automatic_traffic8
	DECFSZ     R11+0, 1
	GOTO       L_automatic_traffic8
	NOP
	NOP
;test3.c,17 :: 		for(counter = 15; counter > 0; counter--) {
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
;test3.c,41 :: 		}
	GOTO       L_automatic_traffic2
L_automatic_traffic3:
;test3.c,43 :: 		for(counter = 23; counter > 0; counter--) {
	MOVLW      23
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
L_automatic_traffic9:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__automatic_traffic37
	MOVF       _counter+0, 0
	SUBLW      0
L__automatic_traffic37:
	BTFSC      STATUS+0, 0
	GOTO       L_automatic_traffic10
;test3.c,44 :: 		if(start == 0) {
	BTFSC      PORTA+0, 0
	GOTO       L_automatic_traffic12
;test3.c,45 :: 		portc = 0;
	CLRF       PORTC+0
;test3.c,46 :: 		break;
	GOTO       L_automatic_traffic10
;test3.c,47 :: 		}
L_automatic_traffic12:
;test3.c,49 :: 		portC = (counter % 10) + (counter / 10) * 16;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__automatic_traffic+0
	MOVF       R0+1, 0
	MOVWF      FLOC__automatic_traffic+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      4
	MOVWF      R3+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R3+0, 0
L__automatic_traffic38:
	BTFSC      STATUS+0, 2
	GOTO       L__automatic_traffic39
	RLF        R2+0, 1
	BCF        R2+0, 0
	ADDLW      255
	GOTO       L__automatic_traffic38
L__automatic_traffic39:
	MOVF       R2+0, 0
	ADDWF      FLOC__automatic_traffic+0, 0
	MOVWF      PORTC+0
;test3.c,50 :: 		portb.b1 =1 ;
	BSF        PORTB+0, 1
;test3.c,51 :: 		portb.b2=1;
	BSF        PORTB+0, 2
;test3.c,52 :: 		portb.b3=1;
	BSF        PORTB+0, 3
;test3.c,53 :: 		portb.b4=1;
	BSF        PORTB+0, 4
;test3.c,55 :: 		if(counter > 3) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__automatic_traffic40
	MOVF       _counter+0, 0
	SUBLW      3
L__automatic_traffic40:
	BTFSC      STATUS+0, 0
	GOTO       L_automatic_traffic13
;test3.c,56 :: 		gw = 1; rs = 1;
	BSF        PORTD+0, 2
	BSF        PORTD+0, 5
;test3.c,57 :: 		ys = 0; gs = 0; yw = 0; rw = 0;
	BCF        PORTD+0, 4
	BCF        PORTD+0, 3
	BCF        PORTD+0, 1
	BCF        PORTD+0, 0
;test3.c,58 :: 		} else {
	GOTO       L_automatic_traffic14
L_automatic_traffic13:
;test3.c,59 :: 		yw = 1; rs = 1;
	BSF        PORTD+0, 1
	BSF        PORTD+0, 5
;test3.c,60 :: 		gw = 0; rw = 0; ys = 0; gs = 0;
	BCF        PORTD+0, 2
	BCF        PORTD+0, 0
	BCF        PORTD+0, 4
	BCF        PORTD+0, 3
;test3.c,61 :: 		}
L_automatic_traffic14:
;test3.c,63 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_automatic_traffic15:
	DECFSZ     R13+0, 1
	GOTO       L_automatic_traffic15
	DECFSZ     R12+0, 1
	GOTO       L_automatic_traffic15
	DECFSZ     R11+0, 1
	GOTO       L_automatic_traffic15
	NOP
	NOP
;test3.c,43 :: 		for(counter = 23; counter > 0; counter--) {
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
;test3.c,64 :: 		}
	GOTO       L_automatic_traffic9
L_automatic_traffic10:
;test3.c,65 :: 		}
	GOTO       L_automatic_traffic0
L_automatic_traffic1:
;test3.c,66 :: 		}
L_end_automatic_traffic:
	RETURN
; end of _automatic_traffic

_manual_traffic:

;test3.c,68 :: 		void manual_traffic(){
;test3.c,69 :: 		if(manual==1){
	BTFSS      PORTB+0, 0
	GOTO       L_manual_traffic16
;test3.c,71 :: 		yw=1; rw=0; gw=0;
	BSF        PORTD+0, 1
	BCF        PORTD+0, 0
	BCF        PORTD+0, 2
;test3.c,72 :: 		ys=0; gs=1; rs=0;
	BCF        PORTD+0, 4
	BSF        PORTD+0, 3
	BCF        PORTD+0, 5
;test3.c,73 :: 		portb.b1 =1 ;
	BSF        PORTB+0, 1
;test3.c,74 :: 		portb.b2=1;
	BSF        PORTB+0, 2
;test3.c,75 :: 		portb.b3=1;
	BSF        PORTB+0, 3
;test3.c,76 :: 		portb.b4=1;
	BSF        PORTB+0, 4
;test3.c,77 :: 		portC=0;
	CLRF       PORTC+0
;test3.c,79 :: 		} else {
	GOTO       L_manual_traffic17
L_manual_traffic16:
;test3.c,81 :: 		yw=0; rw=0; gw=1;
	BCF        PORTD+0, 1
	BCF        PORTD+0, 0
	BSF        PORTD+0, 2
;test3.c,82 :: 		ys=1; gs=0; rs=0;
	BSF        PORTD+0, 4
	BCF        PORTD+0, 3
	BCF        PORTD+0, 5
;test3.c,83 :: 		portb.b1 =1 ;
	BSF        PORTB+0, 1
;test3.c,84 :: 		portb.b2=1;
	BSF        PORTB+0, 2
;test3.c,85 :: 		portb.b3=1;
	BSF        PORTB+0, 3
;test3.c,86 :: 		portb.b4=1;
	BSF        PORTB+0, 4
;test3.c,87 :: 		portc=0;
	CLRF       PORTC+0
;test3.c,88 :: 		}
L_manual_traffic17:
;test3.c,89 :: 		}
L_end_manual_traffic:
	RETURN
; end of _manual_traffic

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;test3.c,103 :: 		void interrupt (){
;test3.c,104 :: 		if(manual==1){
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt18
;test3.c,105 :: 		if(intf_bit==1){
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt19
;test3.c,106 :: 		intf_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;test3.c,107 :: 		if(gw==1){
	BTFSS      PORTD+0, 2
	GOTO       L_interrupt20
;test3.c,108 :: 		gw=0; rw=1; yw=0;
	BCF        PORTD+0, 2
	BSF        PORTD+0, 0
	BCF        PORTD+0, 1
;test3.c,109 :: 		ys=1; rs=0; gs=0;
	BSF        PORTD+0, 4
	BCF        PORTD+0, 5
	BCF        PORTD+0, 3
;test3.c,110 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_interrupt21:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt21
	DECFSZ     R12+0, 1
	GOTO       L_interrupt21
	DECFSZ     R11+0, 1
	GOTO       L_interrupt21
	NOP
;test3.c,111 :: 		}
	GOTO       L_interrupt22
L_interrupt20:
;test3.c,112 :: 		else if(gs==1){
	BTFSS      PORTD+0, 3
	GOTO       L_interrupt23
;test3.c,113 :: 		gs=0; rs=1; ys=0;
	BCF        PORTD+0, 3
	BSF        PORTD+0, 5
	BCF        PORTD+0, 4
;test3.c,114 :: 		yw=1; gw=0; rw=0;
	BSF        PORTD+0, 1
	BCF        PORTD+0, 2
	BCF        PORTD+0, 0
;test3.c,115 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_interrupt24:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt24
	DECFSZ     R12+0, 1
	GOTO       L_interrupt24
	DECFSZ     R11+0, 1
	GOTO       L_interrupt24
	NOP
;test3.c,116 :: 		}
L_interrupt23:
L_interrupt22:
;test3.c,119 :: 		}
L_interrupt19:
;test3.c,121 :: 		}
L_interrupt18:
;test3.c,123 :: 		}
L_end_interrupt:
L__interrupt43:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;test3.c,124 :: 		void main() {
;test3.c,125 :: 		adcon1=7;
	MOVLW      7
	MOVWF      ADCON1+0
;test3.c,126 :: 		trisa=0b111111;
	MOVLW      63
	MOVWF      TRISA+0
;test3.c,127 :: 		trisb=0b00000001;
	MOVLW      1
	MOVWF      TRISB+0
;test3.c,129 :: 		trisc=0;
	CLRF       TRISC+0
;test3.c,130 :: 		trisd=0;
	CLRF       TRISD+0
;test3.c,131 :: 		portd=0;
	CLRF       PORTD+0
;test3.c,132 :: 		porta=0b111011;
	MOVLW      59
	MOVWF      PORTA+0
;test3.c,133 :: 		portc=0;
	CLRF       PORTC+0
;test3.c,134 :: 		portb=0b00000001;
	MOVLW      1
	MOVWF      PORTB+0
;test3.c,135 :: 		gie_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;test3.c,136 :: 		inte_bit=1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;test3.c,137 :: 		intedg_bit=0;
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;test3.c,140 :: 		while(start==1);
L_main25:
	BTFSS      PORTA+0, 0
	GOTO       L_main26
	GOTO       L_main25
L_main26:
;test3.c,141 :: 		while(1){
L_main27:
;test3.c,142 :: 		if(automatic==1){
	BTFSS      PORTA+0, 1
	GOTO       L_main29
;test3.c,144 :: 		automatic_traffic();
	CALL       _automatic_traffic+0
;test3.c,146 :: 		}
	GOTO       L_main30
L_main29:
;test3.c,147 :: 		else if(manual==1){
	BTFSS      PORTB+0, 0
	GOTO       L_main31
;test3.c,149 :: 		manual_traffic();
	CALL       _manual_traffic+0
;test3.c,150 :: 		}
L_main31:
L_main30:
;test3.c,154 :: 		}
	GOTO       L_main27
;test3.c,155 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
