.globl main
main:

.data 
	buffer:		.space		256
	prompt:		.asciiz		"Enter string:\n"

.text
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 8
	la $a0, buffer
	la $a1, 256
	syscall
	
	move $a1, $a0
	
	
	li $t5, 0
	len:
	
		lb $t0, 0($a0)
		beq $t0, $0, exit
		addi $a0, $a0,1
		addi $t5, $t5, 1
		
	
	j len
	
	exit:
		addi $t5, $t5, -1
		
		li $t2, 0 # i
	
	loop:
		lb $t0, 0($a1)
		
		beq $t5, $t2, end
	
		
		addi $t0, $t0, -32
		
		li $v0, 11
		move $a0, $t0
		syscall
		
		addi $t2, $t2, 1
		
		addi $a1, $a1, 1
	
	j loop
	
	end:
		li $v0, 10
		syscall
