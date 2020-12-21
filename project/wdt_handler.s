	.file	"_wdt_handler.c"
.text
	.balign 2
	.global	WDT
	.section	__interrupt_vector_11,"ax",@progbits
 	.word	WDT
	.text
	

	.extern redrawScreen
	.extern wdt_c_handler
	.extern moveLeft
	.extern moveRight
	.extern moveUp
	.extern moveDown
	.extern buttons

jt:
	.word left
	.word up
	.word down
	.word right
WDT:
; start of function
; attributes: interrupt 
; framesize_regs:     24
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          24
; elim ap -> fp       26
; elim fp -> sp       0
; saved regs: R4 R5 R6 R7 R8 R9 R10 R11 R12 R13 R14 R15
	; start of prologue
	PUSH	R15
	PUSH	R14
	PUSH	R13
	PUSH	R12
	PUSH	R11
	PUSH	R10
	PUSH	R9
	PUSH	R8
	PUSH	R7
	PUSH	R6
	PUSH	R5
	PUSH	R4
	; end of prologue
	CALL	#wdt_c_handler
	; start of epilogue
	POP	R4
	POP	R5
	POP	R6
	POP	R7
	POP	R8
	POP	R9
	POP	R10
	POP	R11
	POP	R12
	POP	R13
	POP	R14
	POP	R15
	cmp	#0, &redrawScreen
	jz	ball_no_move
				;Jump Table

	cmp     #4,&buttons
        jhs     ball_no_move
	mov     &buttons,r13
	add     r13,r13
	mov     jt(r13),r0
	
	and	#0xffef, 0(r1)	; clear CPU off in saved SR
ball_no_move:	

	RETI
	.size	WDT, .-WDT
	.local	count
	.comm	count,1,1
	.ident	"GCC: (GNU) 4.9.1 20140707 (prerelease (msp430-14r1-364)) (GNUPro 14r1) (Based on: GCC 4.8 GDB 7.7 Binutils 2.24 Newlib 2.1)"

left:
	call #moveLeft
	jmp default
right:
	call #moveRight
	jmp default
up:
	call #moveUp
	jmp default
down:
	call #moveDown
	jmp default

default:
	mov #4, &buttons
	jmp  ball_no_move
	
