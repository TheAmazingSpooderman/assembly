.data 
	chars:		.byte		'a', 'b', 'c', 'd'
	iterator:	.word		0
	size:		.word		3
	
main:

	la $t0, chars
	lw $t1, iterator
	lw $t2, size
	
	start:
	
	bgt $t1, $t2, exit # if the iterator is greater than the size of the chars array, branch out to the exit branch
	
	addi $t3, $t0, 1
	
	sll $t3, 0($t3), 2
	
	lb $a0, $t3
	li $v0, 11
	syscall

	# inccrement iterator
	addi $t1, $t1, 1 # iterator = iterator + 1
	
	j start # jump back to the start of the loop
	
exit:
	li $v0, 10
	syscall