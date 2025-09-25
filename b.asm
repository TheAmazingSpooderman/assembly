.data
	str:	.byte	'a', 'b', 'c', 'd'
	

	
.text
	la $t3, str # start of str

	loop:	
	
		lb $t2, 0($t3)
		
		beq $t2, $zero, stop
		
	
		li $v0, 11
		move $a0, $t3
	
		syscall
		
		addi $t3, $t3, 1 # start++
	
	j loop
	
stop:
	li $v0, 10
	syscall
