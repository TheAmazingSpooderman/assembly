.data
	num1: .word 10		# Store 10 at memor adress num1
	num2: .word 15		# STore 15 at memory adress num2
	num3: .word 5		# Store 5 at memory adress num3

.text

main:

	li $v0, 1
	la $a0, num1
	lw $t0, num2
	lw $t1, num3
	add $t3, $t0, $t1
	sw $t3, num1
	syscall
	
	li $v0, 10
	syscall