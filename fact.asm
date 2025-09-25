.globl main
main:

.data	
	prompt:		.asciiz		"Enter a number \n"
	message:	.asciiz		"The factorial of the number is: \n"
	
.text
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	
	move $t3, $v0 # store user's input in register t3
	
	beq $t3, $0, base
	
	li $t1, 1 # i = 1
	
	li $t2, 1 # fact (0) - base case
	
	addi $t3, $t3, 1 # n + 1
	
	loop:
		beq $t1, $t3, end # if  i == n, end
		
		mult $t2, $t1 # fact (0) * i
		
		mfhi $t5
		mflo $t6
		
		add $t2, $t5, $t6 # fact = fact * i
		

		addi $t1, $t1, 1 # i = i + 1
	j loop
	
	base: # fact (0)
		li $v0, 4
		la $a0, message
		syscall
		
		li $v0, 1
		li $a0, 1
		syscall
		
		li $v0, 10
		syscall
	
end:
	li $v0, 4
	la $a0, message
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
li $v0, 10
syscall
