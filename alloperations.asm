.data
	num1:		.word	10
	num2:		.word	20
	res:		.word	1
	msg:		.asciiz	"Result: \n"
	new_line:	.asciiz	"\n"

.text
main:
	#print message
	la $a0, msg
	li, $v0, 4
	syscall
	
	lw $t0, num1
	lw $t1, num2
	add $t3, $t0, $t1 # num1 + num2 => 10 + 20
	sw $t3, res	# num1 + num2 -> t0 + t1 = t3 = 30 => res
	
	li $v0, 1 # print integer with sycall number 1
	lw $a0, res # load res in to a0 so we can print it out
	syscall
	
	# print new line
	li $v0, 4
	la $a0, new_line
	syscall
	
	#print message
	la $a0, msg
	li, $v0, 4
	syscall
	
	li $t0, 2 # load constant 2 into register t0
	lw $t1, res
	mult $t0, $t1	#multiply 2 * res => 30 * 2
	mfhi $t0
	mflo $t1
	add $t3, $t0, $t1
	sw $t3, res
	
	li $v0, 1
	lw $a0, res
	syscall
	
	#print new ine
	la $a0, new_line
	li $v0, 4
	syscall
	
	li $t0, 7
	lw $t1, res # 60
	div $t1, $t0 # 60 / 7
	mflo $t1 # res
	mfhi $t0 # remainder
	sw $t1, res
	
	
	la $a0, msg
	li $v0, 4
	syscall
	
	lw $a0, res
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, new_line
	syscall
	
	move $a0, $t0 # move the remoainder of division to a0
	li $v0, 1 # call syscall 1 to print out result (integer)
	syscall
	
	li $v0, 10 # call syscall 10 to end program
	syscall
	
	
	