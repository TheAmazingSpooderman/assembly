.data
	start:		.word		0x0 # 0
	end:		.word		0x8 # 3
	characters:	.byte		'a', 'b', 'c', 'd'
	new_line:	.asciiz		"\n"
	
.globl main
.text	

main:
	lw $t0, start
	lw $t1, end
	la $t3, characters

	

loop:
	
	
	bgt $t0, $t1, exit
	
	
	li $v0, 11
	lb $a0, 0($t3)
	
	syscall
	
	
	li $v0, 4
	la $a0, new_line
	syscall
	
	addi $t0, $t0, 1
	
	addi $t3, $t3, 1
	
	j loop	

exit:
	li $v0, 10
	syscall
