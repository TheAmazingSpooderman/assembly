.globl main
main:
	.data
		count:		.word		0
		prompt:		.asciiz		"Enter a number:\n"
		message:	.asciiz		"The Fibonacci number is:\n"

	.text
		lw $t0, count
		li $t3, 0 # fib (0) n - 1
		li $t4, 1 # fib (1) n

		li $v0, 4
		la $a0, prompt
		syscall

		li $v0, 5
		syscall

		move $t1, $v0 # n

		beq $t1, $zero, z
		beq $t1, 1, o

		addi $t1, $t1, -1 # n - 1




	loop:
		beq $t0, $t1, stop # count == n, stop

		add $t5, $t4, $t3 # fib (n - 1) + fib(n - 2)

		move $t3, $t4

		move $t4, $t5


		addi $t0, $t0, 1

		j loop

	z:
		li $v0, 4
		la $a0, message
		syscall

		li $v0, 1
		li $a0, 0
		syscall

		li $v0, 10
		syscall

	o:	
		li $v0, 4
		la $a0, message
		syscall

		li $v0, 1
		li $a0, 1
		syscall

		li $v0, 10
		syscall	

	stop:

		li $v0, 4
		la $a0, message
		syscall

		li $v0, 1
		move $a0, $t5
		syscall


	li $v0, 10
	syscall

