.data
	num1:	.word	12		# Store 12 at memory adress "num1"
	num2:	.word	13		# Store 13 at memory adress "num2"
	num3:	.word	0		# Store 0 at memory adress "num3"

.text					# Code section

.globl	main				# Declare the lable main as global

# Program that loads words from memory and stores words to memory

main:					# Starting point
	lw	$t1, num1		# Load the value of num1 (12) into register t1 
	lw	$t2, num2		# Load the value of num2 (13) int register t2
	add	$t3, $t1, $t2		# Add the values located at registers t1 and t2 and store the result in t3
	swr	$t3, num3		# Store the value located at register t3 (t1 + t2) into the memory adress num3

exit:					# Label "exit"
	li, $v0, 10			# Call syscall 10 to exit the program
	syscall				# Perform syscall 10
	
	
