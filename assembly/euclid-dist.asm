.globl main
main:
	
.data
	prompt1:		.asciiz		"Enter coordinate one (x1,y2):\n"
	prompt2:		.asciiz		"Enter coordinate two (x2,y2):\n"
	message:		.asciiz		"The distance is:\n"
	n:			.asciiz		"\n"
	
.text 
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0 # x1
	
	li $v0, 5
	syscall
	
	move $t2, $v0 # y1
	
	
	li $v0, 4
	la $a0, prompt2
	syscall
	
	li $v0, 5
	syscall
	
	move $t3, $v0 # x2
	
	li $v0, 5
	syscall
	
	move $t4, $v0 # y2
	
	sub $t1, $t1, $t3 # t1 =  x1 - x2
	
	sub $t2, $t2, $t4 # t2 = y1 - y2
	
	mult $t1, $t1
	
	mfhi $t3
	mflo $t4
	
	add $t1 $t3, $t4 # t1 = (x1 - x2)(x1 - x2)

	
	mult $t2, $t2
	
	mfhi $t3
	mflo $t4
	
	add $t2, $t3, $t4 # t2 = (y1 - y2)(y1 - y2)
	
	
	add $t0, $t1, $t2 # t0 = dx^2 + dy ^2  = n
	
	# n = t0
	
	li $t1, 0 # i = 0
	
	srl $t2, $t0, 1 # $t0 >> 1 , n / 2
	
	move $t3, $t0 # x = t3
	
loop:

	beq $t1, $t2, end # i == n / 2 -> exit
	
	div $t0, $t3 # n / x
	
	# mfhi $t5
	mflo $t6
	
	# add $t4, $t5, $t6 # z = n / x
	
	add $t4, $t6, $t3 # p = z + x
	
	srl $t3, $t4, 1 # x = p >> 1
	
	addi $t1, $t1, 1 # i = i + 1

j loop

end: # print the dist
	li $v0, 4
	la $a0, message
	syscall
	 
	li $v0, 1 # print x
	move $a0, $t3 
	syscall

	
li $v0, 10 # exit
syscall
	
	
