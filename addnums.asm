.data
	num1:	.byte	10
	num2:	.byte	5


.text
.globl main
main:
	lb $t1, num1
	lb $t2, num2
	add $t3, $t1, $t2
	
	li $v0, 11
	
	lb $a0, $t3
	syscall
	
	li $v0, 10
	syscall