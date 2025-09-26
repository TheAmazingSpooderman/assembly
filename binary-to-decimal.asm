# binary to decimal converter
.globl main
main:

.data
	buffer:		.space		256
	prompt:		.asciiz		"Enter a binary number:\n"
	message:	.asciiz		"The decimal value is:\n"
	zero:		.byte		'0'

.text

	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 8
	la $a0, buffer
	la $a1, 256
	syscall
	
	move $a1, $a0 # cpy buffer into a1
	
	move $a2, $a0
	
	li $t1, 0 # len
		
	len:
		lb $t0, 0($a1)
		beq $t0, $0, end
		addi $t1, $t1, 1 # len += 1
		addi $a1, $a1, 1 # move to next char
	
	j len
		
	end:
		addi $t1, $t1, -1 # get rid of null-terminator
	
		add $a2, $a2, $t1 # go to end of string
	
	li $t2, 0 # decimal value
	li $t3, -1 # counter 
	lb $t6, zero # '0'
	
	# for some odd reason, the counter needs to be offset by -1 for it to work
	loop:
		lb $t0, 0($a2)
		beq $t0, $0, exit
	
		sub $t0, $t0, $t6 # get convert char to integer - 'x' - '0' = x
		
		
		sllv $t5, $t0, $t3 # z = bit << counter -> bit * 2 ^ counter
		
		
		add $t2, $t2, $t5 # decimal += z
		
		addi $t3, $t3, 1 # counter += 1
		addi $a2, $a2, -1 # move one charcater back
	
	j loop
	
	exit:
		li $v0, 4
		la $a0, message
		syscall
		
		li $v0, 1
		move $a0, $t2
		syscall
