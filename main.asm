;
; RPS.asm
;
; Created: 12/3/2019 11:04:26 AM
; Author : Physics Lab
;


; Replace with your application code

.equ OLED_WIDTH =128
.equ OLED_HEIGHT =64
.def offset=r17 
.def  workhorse =r16 
.def  workhorse2 =r21

.cseg

.org 0x0000
rjmp setup
.org 0x0100

.include    "lib_delay.asm"
.include	"lib_SSD1306_OLED.asm"
.include	"lib_GFX.asm"



setup:
	
	rcall OLED_initialize
	rcall GFX_clear_array
	rcall GFX_refresh_screen



	;ldi workhorse , 0b11111111 ; turns on bits
	;sts PORTB_DIR, r16 ; turns on bits
	;ldi workhorse , 0b00001000
	;sts PORTB_PIN1CTRL,workhorse



	;ldi r21, 0b00000000
	
	;ldi workhorse, 0b00001000 

	ldi workhorse, 0b00000000
	sts PORTB_DIR, workhorse
	
	ldi workhorse, 0b00001000
	
	
	sts PORTB_PIN1CTRL, workhorse
	sts PORTB_PIN2CTRL, workhorse
	sts PORTB_PIN3CTRL, workhorse
	sts PORTB_PIN4CTRL, workhorse


	sts PORTA_PIN2CTRL, workhorse
	sts PORTA_PIN7CTRL, workhorse
	sts PORTA_PIN5CTRL, workhorse
	
	rcall menu
	

loop:
	; gameactoon

	rcall clear_button
	rcall Rock_Button1
	rcall Paper_Button1
	rcall Scissors_Button1
	rcall Rock_Button2
	rcall Paper_Button2
	rcall Scissors_Button2
	


	
	



	rjmp loop



;loop1:
; ROCK:1
	
	;rcall clear_button


	;rcall Rock_Button
	

	;rjmp loop1

	

clear_button: 
	lds workhorse, PORTB_IN
	andi workhorse, 0b00000010;only care about pin 
	cpi workhorse, 0b00000000; checks if all 0
	breq turnoff; Goes to another subrotine
	ret ; if not 0 then goes loop1


turnoff:
	rcall GFX_clear_array

	rcall GFX_refresh_screen
	ret
	;rcall Game_Routine 




Rock_Button1:
	lds workhorse, PORTB_IN
	andi workhorse, 0b00000100;only care about pin 2
	cpi workhorse, 0b00000000; checks if all 0
    breq rock1 ; Goes that shows rocks
	; compare the chracter aganist rock if (go back to python file)  to another subrotine
	ret ; if not 0 then goes loop1


rock1:
	ldi r18 ,7.5; set the x position
	ldi r19,0;set the y position
	rcall GFX_set_array_pos
	ldi offset, 49; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	ret


Rock_Button2:
	lds workhorse, PORTA_IN
	andi workhorse, 0b00000100;only care about pin 2
	cpi workhorse, 0b00000000; checks if all 0
    breq rock2 ; Goes that shows rocks
	; compare the chracter aganist rock if (go back to python file)  to another subrotine
	ret ; if not 0 then goes loop1


rock2:
	ldi r18 ,55; set the x position
	ldi r19,36;set the y position
	rcall GFX_set_array_pos
	ldi offset, 49; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	ret






Paper_Button1:
	lds workhorse, PORTB_IN
	andi workhorse, 0b00001000;only care about pin 1
	cpi workhorse, 0b00000000; checks if all 0
    breq paper1; Goes that shows rocks
	; compare the chracter aganist rock if (go back to python file)  to another subrotine
	ret ; if not 0 then goes loop1
	
	

paper1:

	ldi r18 ,7.5; set the x position
	ldi r19,0;set the y position
	rcall GFX_set_array_pos
	ldi offset, 50; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	ret


Paper_Button2:
	lds workhorse, PORTA_IN
	andi workhorse, 0b10000000;only care about pin 1
	cpi workhorse, 0b00000000; checks if all 0
    breq paper2; Goes that shows rocks
	; compare the chracter aganist rock if (go back to python file)  to another subrotine
	ret ; if not 0 then goes loop1
	
	

paper2:

	ldi r18 ,55; set the x position
	ldi r19,36;set the y position
	rcall GFX_set_array_pos
	ldi offset, 50; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	ret


Scissors_Button1:
	lds workhorse, PORTB_IN
	andi workhorse, 0b00010000;only care about pin 1
	cpi workhorse, 0b00000000; checks if all 0
    breq Scissors1; Goes that shows rocks
	; compare the chracter aganist rock if (go back to python file)  to another subrotine

	ret
	
Scissors1:



	ldi r18 ,7.5; set the x position
	ldi r19,0;set the y position
	rcall GFX_set_array_pos
	ldi offset, 51; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	ret 



Scissors_Button2:
	lds workhorse, PORTB_IN
	andi workhorse, 0b00100000;only care about pin 1
	cpi workhorse, 0b00000000; checks if all 0
    breq Scissors2; Goes that shows rocks
	; compare the chracter aganist rock if (go back to python file)  to another subrotine

	ret
	
Scissors2:



	ldi r18 ,55; set the x position
	ldi r19,36;set the y position
	rcall GFX_set_array_pos
	ldi offset, 51; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	ret 
	
	
	



	ret
menu:
	ldi r18 ,4; set the x position
	ldi r19,0;set the y position
	rcall GFX_set_array_pos
	ldi offset, 77 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen
	ldi r18 ,5; set the x position
	ldi r19,0;set the y position
	rcall GFX_set_array_pos
	ldi offset, 69 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen
	ldi r18 ,6; set the x position
	ldi r19,0;set the y position
	rcall GFX_set_array_pos
	ldi offset, 78 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen
	ldi r18 ,7; set the x position
	ldi r19,0;set the y position
	rcall GFX_set_array_pos
	ldi offset, 85 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	ldi r18 ,4; set the x position
	ldi r19,2;set the y position
	rcall GFX_set_array_pos
	ldi offset, 82 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen
	ldi r18 ,5; set the x position
	ldi r19,2;set the y position
	rcall GFX_set_array_pos
	ldi offset, 79 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen
	ldi r18 ,6; set the x position
	ldi r19,2;set the y position
	rcall GFX_set_array_pos
	ldi offset, 67 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen
	ldi r18 ,7; set the x position
	ldi r19,2;set the y position
	rcall GFX_set_array_pos
	ldi offset, 75 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	ldi r18 ,8; set the x position
	ldi r19,2;set the y position
	rcall GFX_set_array_pos
	ldi offset, 58 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	
	ldi r18 ,9; set the x position
	ldi r19,2;set the y position
	rcall GFX_set_array_pos
	ldi offset, 49 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen


	ldi r18 ,4; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 80 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen
	ldi r18 ,5; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 65 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen
	ldi r18 ,6; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 80 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen
	ldi r18 ,7; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 69 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen
	ldi r18 ,8; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 82 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	
	ldi r18 ,9; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 58; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	ldi r18 ,10; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 50; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen






	ldi r18 ,4; set the x position
	ldi r19,4;set the y position
	rcall GFX_set_array_pos
	ldi offset, 83 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	ldi r18 ,5; set the x position
	ldi r19,4;set the y position
	rcall GFX_set_array_pos
	ldi offset, 67 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	ldi r18 ,6; set the x position
	ldi r19,4;set the y position
	rcall GFX_set_array_pos
	ldi offset, 73 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	ldi r18 ,7; set the x position
	ldi r19,4;set the y position
	rcall GFX_set_array_pos
	ldi offset, 83 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	ldi r18 ,8; set the x position
	ldi r19,4;set the y position
	rcall GFX_set_array_pos
	ldi offset, 83 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	ldi r18 ,9; set the x position
	ldi r19,4;set the y position
	rcall GFX_set_array_pos
	ldi offset, 79 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen


	ldi r18 ,10; set the x position
	ldi r19,4;set the y position
	rcall GFX_set_array_pos
	ldi offset, 82 ; set offset to the location of my name
	st X ,offset;outputs info
;	rcall GFX_refresh_screen ; calls the refresh screen

	ldi r18 ,11; set the x position
	ldi r19,4;set the y position
	rcall GFX_set_array_pos
	ldi offset, 83 ; set offset to the location of my name
	st X ,offset;outputs info
;	rcall GFX_refresh_screen ; calls the refresh screen

	ldi r18 ,12; set the x position
	ldi r19,4;set the y position
	rcall GFX_set_array_pos
	ldi offset, 58; set offset to the location of my name
	st X ,offset;outputs info
;	rcall GFX_refresh_screen ; calls the refresh screen

	
	ldi r18 ,13; set the x position
	ldi r19,4;set the y position
	rcall GFX_set_array_pos
	ldi offset, 51; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	;rcall idk

ret


;idk:; Delay 333 000 cycles; 100ms at 3.33 MHz   
 ;ldi  r18, 2    
 ;ldi  r19, 177   
 ;ldi  r20, 117



	

	
	
   
