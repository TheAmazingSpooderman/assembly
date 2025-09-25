.data
	characters:	.space		4	# allocated 4 bytes of memory, since each character takes a single byte
	char1:		.byte		'a'
	char2:		.byte		'b'
	char3:		.byte		'c'
	char4:		.byte		'd'
	
	array:		.byte		char1, char2, char3, char4
	
	iterator:	.word		0 # counter for our loop
	size:		.word		3

.globl main
.text
# main:
	# la $t0, characters # load array at based address
	#; 
	#; lb $t1, char1
	#; sb $t1, 0($t0)
	#; 
	#; lb $t2, char2
	#; sb $t2, 1($t0)
	#; 
	#; lb $t3, char3
	#; sb $t3, 2($t0)
	#; 
	#; lb $t4, char4
	#; sb $t4, 3($t0)
	#; 
	#; 
	#; # print ith element
	#; lb $a0, 3($t0)
	#; li $v0, 11 # print byte to console
	#; syscall
	#; 
	#; li $v0, 10
	#; syscall
	
main:
	la $t0, array
	lw $t1, iterator
	lw $t2, size
	
	start:
	bgt $t1, $t2, exit_loop
	
	sll $t3, $t1, 1
	
	addu $t3, $t3, $t0 # update current index (t3) to be based address + t3, eg 1i + base address -----> eg t0 = 10000, elemente 1 address = 1*0 + 10000 = 1000, element 2 address = 1 * 1 + 1000 = 1001
	
	lb $a0, 0($t3) # we automatically dealt with offset 2 lines back
	li $v0, 11
	syscall
	
	addi $t1, $t1, 1 # increament ieterator (i)
	
	j start # jump back to the start of the loop
	
exit_loop:
	li $v0, 10
	syscall
