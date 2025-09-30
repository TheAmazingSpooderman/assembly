# Reverse a string

.globl main
main:

.data
	buffer:		.space		256 # reserve 256 bytes for user input
	prompt:		.asciiz		"Enter a word:\n"
	message:	.asciiz		"The reversed word is: \n"
	
.text
	li $v0, 4 # print prompt to the user
	la $a0, prompt
	syscall
	
	li $v0, 8 # get string from user
	la $a0, buffer # store the word
	la $a1, 256 # max characters allowed
	syscall
	
	li $t0, 0 # i = 0
	
	
	len_loop: # get length of the string
	
		lb $t5, 0($a0) # buffer[0]
		
		beq $t5, $0, end_len_loop 
		
		addi $t0, $t0, 1 # i += 1
		addi $a0, $a0, 1
		
		
	j len_loop
	
end_len_loop: 
	addi $t0, $t0, -1 # remove '\0' -> len - len -1

	la $t1, buffer # string[0]

	add $t1, $t1, $t0 # go to end of the string -> string[len - 1]

li $v0, 4
la $a0, message
syscall


loop:
	lb $t0, 0($t1) # store last character in t0
	
	beq $t0, $zero, end # if len == 0, end
		
	li $v0, 11 # print current charcter
	move $a0, $t0
	syscall
	
	addi $t1, $t1, -1 # mive one character back
	
	addi $t0, $t0, -1 # decrement len
	
	j loop
	
	
end:
	li $v0, 10 # exit the program
	syscall
	


	