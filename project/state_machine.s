	.arch msp430g2553
	.p2align 1,0
	.text

	.extern moveLeft
	.extern moveRight
	.extern moveUp
	.extern moveDown
	.extern buttons
	.global state_machine

jt:
	.word left
	.word up
	.word down
	.word right

state_machine:	
	cmp     #4,&buttons
        jhs     default
	mov     &buttons,r13
	add     r13,r13
	mov     jt(r13),r0
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
	pop r0
	
