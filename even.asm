.data
	start:		.word		1
	value: 		.word		1
	end:		.word		5
	n:		.asciiz		"\n"
	d: 		.asciiz		"-"
	
.globl main
.text

main:
	lw $t0, start # starting index
	lw $t1, end #ednig index
	lw $t2, value # our actual value
	li $t3, 2 # our divider/ denominator=
	
	loop:
	
		
		div $t2, $t3 # divide value by 2 ----> t2/t3
		mfhi $t4 # store our remainder or modulo into register t4
	
		

		#beq $t4, $zero, even # if our remainder is equl to zero, branch to the even "label"
		
		li $v0, 1
		move $a0, $t2
		syscall
		
		li $v0, 4
		la $a0, d
		syscall
		
		li $v0, 1
		move $a0, $t4
		syscall
		
		li $v0, 4
		la $a0, n
		syscall
		
		
		bgt $t0, $t1, exit # if start > end, jump to "end" label
		
		addi $t0, $t0, 1 # increment out starting index
		
		move $t2, $t0
		
		j loop # jump back to start of the loop
		
		
even:

	li $v0, 1 # syscall number 1 to print out integer
	move $a0, $t0 # move the value in t0 into a0 for printinhg
	syscall
	
	j loop # jump back to our loop after printing
	

	
exit:
	li $v0, 10
	syscall	
