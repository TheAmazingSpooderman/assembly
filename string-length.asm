.globl main
main:

.data
	nums:		.word		1, 2, 3, 4, 5
	n:		.asciiz		"\n"
	name:		.asciiz		"Paulinho"
	
.text
	la $t0, name # name[0]
	
	li $t1, 0 # start
	
loop:
	lb $t2, 0($t0)
	
	beq $t2, $zero, end # if char = 0, end (null terminated)

	addi $t0, $t0, 1 # move to next char
	
	addi $t1, $t1, 1 # increment index

j loop

end:
	li $v0, 1
	move $a0, $t1
	syscall