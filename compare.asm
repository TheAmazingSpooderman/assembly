.globl main
main:

.data
	buffer1:		.space		256 # reserve 256 bytes for string 1
	buffer2:		.space		256 # reserve 256 bytes for string 2
	prompt1:		.asciiz		"Enter String 1:\n"
	prompt2:		.asciiz		"Enter String 2:\n"
	
	str1:			.asciiz		"String 1 is greater than string 2\n"
	str2:			.asciiz		"String 2 is greater than string 1\n"
	eq:			.asciiz		"Both strings are equal\n"
	
	n:			.asciiz		"\n"
	
.text
	li $v0, 4 # prompt user for string 1
	la $a0, prompt1
	syscall
	
	li $v0, 8
	la $a0, buffer1 
	la $a1, 256 # max bytes
	syscall
	
	move $a2, $a0 #a2 = buffer1
	
	
	
	li $v0, 4
	la $a0, prompt2
	syscall
	
	
	li $v0, 8
	la $a0, buffer2
	la $a1, 256
	syscall
	
	
	move $a3, $a0 # a3 = buffer2

	
	move $a1, $a0 # a1 = buffer2
	
	
	li $t5, 0 # len

	
	len:
		lb $t7, 0($a1) # a1[0]
		
		beq $t7, $0, end
		
		addi $t5, $t5, 1 # len += 1
		
		addi $a1, $a1, 1 # move to next  
	j len
	
	
	end:
		li $t6, 0 # counter
		
		addi $t5, $t5, -1 # remove null terminator
		
	loop:
		lb $t0, 0($a2)
		lb $t1, 0($a3) # buffer2[0]
		
		
		sub $t2, $t0, $t1 # t0 - t1
		
		bgt $t2, $zero, str2_b # t0 - t1 < 0 -> t1 > t0
		
		blt $t2, $zero, str1_b # t0 - t1 > 0 -> t0 > t1'
		
		beq $t5, $t6, equal
		
		addi $a2, $a2, 1
		addi $a3, $a3, 1

		
		addi $t6, $t6, 1 # counter += 1
	
	j loop
	
	equal:
		li $v0, 4
		la $a0, eq
		syscall
		
		li $v0, 10
		syscall
		
	str1_b:
		li $v0, 4
		la $a0, str1
		syscall
		
		li $v0, 10
		syscall
		
	str2_b:
		li $v0, 4
		la $a0, str2
		syscall
			
		li $v0, 10
		syscall