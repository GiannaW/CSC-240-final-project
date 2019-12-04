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

	ldi workhorse, 0b00000000
	sts PORTB_DIR, workhorse
	ldi workhorse, 0b00001000
	sts PORTB_PIN1CTRL, workhorse

	



loop1:
; ROCK:1
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
	rcall GFX_refresh_screen ; calls the refresh screen

	ldi r18 ,11; set the x position
	ldi r19,4;set the y position
	rcall GFX_set_array_pos
	ldi offset, 83 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	ldi r18 ,12; set the x position
	ldi r19,4;set the y position
	rcall GFX_set_array_pos
	ldi offset, 58; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	
	ldi r18 ,13; set the x position
	ldi r19,4;set the y position
	rcall GFX_set_array_pos
	ldi offset, 51; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	rcall clear_button
	

	rjmp loop1

	

clear_button: 
	lds workhorse, PORTB_IN
	andi workhorse, 0b0000010;only care about pin 1
	cpi workhorse, 0b00000000; checks if all 0
	breq turnoff; Goes to another subrotine
	ret ; if not 0 then goes loop1


turnoff:
	rcall GFX_clear_array

	;rcall GFX_refresh_screen
	;rcall Game_Routine 



Rock_Button:
	lds workhorse, PORTB_IN
	andi workhorse, 0b0000100;only care about pin 1
	cpi workhorse, 0b00000000; checks if all 0
	breq ; Goes that shows rocks
	; compare the chracter aganist rock if (go back to python file)  to another subrotine
	ret ; if not 0 then goes loop1
	
	
	
	
	
   
