;
; RPS.asm
;
; Created: 12/3/2019 11:04:26 AM
; Author : Physics Lab
;


; Replace with your application code

;LABELS THE REGISTERS
.equ OLED_WIDTH =128;SETS THE DIMMENSIONS 
.equ OLED_HEIGHT =64

.def offset=r17 
.def  workhorse =r16 
.def  PlayA =r28
.def  PlayB =r29

.cseg

.org 0x0000
rjmp setup
.org 0x0100

;CALLS ALL other .asm files

.include    "lib_delay.asm"
.include	"lib_SSD1306_OLED.asm"
.include	"lib_GFX.asm"



setup:
	
	rcall OLED_initialize ;intializes the OLED
	rcall GFX_clear_array ;clears the array
	rcall GFX_refresh_screen; refresh screen



	;ldi workhorse , 0b11111111 ; turns on bits
	;sts PORTB_DIR, r16 ; turns on bits
	;ldi workhorse , 0b00001000
	;sts PORTB_PIN1CTRL,workhorse



	;ldi r21, 0b00000000
	
	;ldi workhorse, 0b00001000 

	;sets the outputs
	ldi workhorse, 0b00000000
	sts PORTB_DIR, workhorse
	sts PORTC_DIR, workhorse
	
	;does an inversion 
	ldi workhorse, 0b10001000
	;Sets the pins for playerA
	sts PORTB_PIN3CTRL, workhorse;clear
	sts PORTB_PIN0CTRL, workhorse;rock
	sts PORTB_PIN1CTRL, workhorse;paper
	sts PORTB_PIN2CTRL, workhorse;scissor

	;Sets the pins for playerB
	sts PORTC_PIN0CTRL, workhorse
	sts PORTC_PIN1CTRL, workhorse
	sts PORTC_PIN2CTRL, workhorse
	
	rcall menu
	rcall delay_1s
	
	

loop:
	; gameactoon

	rcall clear_button ;clears the button
	;rcall Rock_Button1
	;rcall Paper_Button1
	;rcall Scissors_Button1
	;rcall Rock_Button2
	;rcall Paper_Button2
	;rcall Scissors_Button2
	rcall FindPlayer;checks the player
	rcall ScreenPlayB ;calls method
	rcall ScreenPlayA
	


	
	



	rjmp loop


FindPlayer:
	;lds workhorse, PORTB_IN

	lds PlayA, PORTB_IN ;loads the directpin for portB
	andi PlayA, 0b00000111; must be enabled to the same
	lds PlayB, PORTC_IN;loads the direct directpin for portC
	andi PlayB, 0b00000111;must be the same to compare
	

	ret





ScreenPlayA:
	andi PlayA, 0b00000111;
	cpi PlayA ,	0b00000001;Player A rock
	breq Arock
	cpi PlayA,	0b00000010 ;Player A paper
	breq APaper
	cpi PlayA,	0b00000100;player A Scissors
	breq AScissors
	ret

Arock:
	rcall rock1
	
	cpi	PlayB, 0b00000001;goes aganist player B, B=Rock
	breq Tie ;displays its a TIE
	cpi	PlayB, 0b00000010 ;goes aganist player B B=Paper
	breq Player_BWin ;displays Player B won
	cpi PlayB, 0b00000100 ;goes aganist player B B=Scissors 
	breq Player_AWin ;displays Player A won

Apaper:
	rcall paper1
	cpi	PlayB, 0b00000001 ;goes aganist player B, B=Rock
	breq Player_AWin ;displays Player A won
	cpi	PlayB, 0b00000010 ;goes aganist player B, B=Paper
	breq Tie ;displays its a TIE
	cpi PlayB, 0b00000100 ;goes aganist player B, B=Scissors
	breq Player_BWin ;displays Player B won
	ret


AScissors:
	rcall Scissor1 
	cpi	PlayB, 0b00000001
	breq Player_BWin;Player B won
	cpi	PlayB, 0b00000010
	breq Player_AWin;Player A won
	cpi PlayB, 0b00000100
	breq Tie  ;displays its a TIE
	ret



Player_AWin:


	;A
	ldi r18 ,6; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 65 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen


	ldi r18 ,8; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 87 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	
	ldi r18 ,9; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 79 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen


	
	ldi r18 ,10; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 78 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen






	







	ret

Tie:
	
	;T
	ldi r18 ,4; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 84 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen
	;I
	ldi r18 ,5; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 73 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen
	;E
	ldi r18 ,6; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 69 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen


	ret



Player_BWin:
	
	;A
	ldi r18 ,6; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 66; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen



	
	ldi r18 ,8; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 87 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

	
	ldi r18 ,9; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 79 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen


	
	ldi r18 ,10; set the x position
	ldi r19,3;set the y position
	rcall GFX_set_array_pos
	ldi offset, 78 ; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen




	ret


	








	

clear_button: 
	lds workhorse, PORTB_IN
	andi workhorse, 0b00001000;only care about pin 
	cpi workhorse, 0b00001000; checks if all 0
	breq turnoff; Goes to another subrotine
	ret ; if not 0 then goes loop


turnoff:
	rcall GFX_clear_array

	rcall GFX_refresh_screen
	ret
	;rcall Game_Routine 










ScreenPlayB:
	andi PlayB, 0b00000111;checks to see if the pins I need are enabled 
	cpi PlayB ,	0b00000001; if Player B rock is pressed
	breq Brock ;goes to Brock button
	cpi PlayB,	0b00000010 ; if Player B paper is pressed
	breq BPaper; goes to BPaper
	cpi PlayB,	0b00000100;if player B Scissors is pressed
	breq BScissor; goes to BScisor
	ret


Brock:;displays rock
	ldi r18 ,7; set the x position
	ldi r19,0;set the y position
	rcall GFX_set_array_pos
	ldi offset, 8; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen
	

	rjmp bDone;jumps to nothing

Bpaper:;display paper

	ldi r18 ,7; set the x position
	ldi r19,0;set the y position
	rcall GFX_set_array_pos
	ldi offset, 219; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen


	rjmp bDone;jumps to nop



BScissor:;display scisors 



	ldi r18 ,7; set the x position
	ldi r19,0;set the y position
	rcall GFX_set_array_pos
	ldi offset, 62; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen
	
	rjmp bDone;jumps to nop




bDone:;does nothing
	nop
	ret


rock1:
	ldi r18 ,55; set the x position
	ldi r19,36;set the y position
	rcall GFX_set_array_pos
	ldi offset, 8; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen
	

	ret

	

paper1:

	ldi r18 ,55; set the x position
	ldi r19,36;set the y position
	rcall GFX_set_array_pos
	ldi offset, 219; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen


	ret

	
Scissor1:



	ldi r18 ,55; set the x position
	ldi r19,36;set the y position
	rcall GFX_set_array_pos
	ldi offset, 62; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen

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
	ldi offset, 8 ; set offset to the location of my name
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
	ldi offset, 219; set offset to the location of my name
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
	ldi offset, 62; set offset to the location of my name
	st X ,offset;outputs info
	rcall GFX_refresh_screen ; calls the refresh screen





ret



	

	

	
	
   