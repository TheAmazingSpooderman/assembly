.data
	start:		.word		0x000
	end:		.word		0x064
	n:		.asciiz		"\n"
	
.globl main

.text 
main:
	lw $t0, start
	lw $t1, end
	loop:
		bgt $t0, $t1, exit
		
		li $v0, 1
		move $a0, $t0
		syscall
		
		li $v0, 4
		la $a0, n
		syscall
		
		addi $t0, $t0, 1
		j loop
exit:
	li $v0, 10
	syscall
