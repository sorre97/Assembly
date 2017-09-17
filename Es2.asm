# Calculate the sum of 10 numbers stored in memory and store the result back in memory

.data
	values: .word 5, 7, 8, 6, 5, 4, 5, 6, 7, 8
	result: .word 0 # placeholder 

.text
	.globl main

main:
	la $t0, values # loading address of the first word starting from data segment (0x10000000)

	and $t1, $t1, $0 	# clearing $t1 value
	addi $t1, $t1, 10 	# predisposition of counter for the loop
						# Parallel pseudoinstruction for and and addi: li $t1, 10 

	sum:
		beq $t1, $0, end
		lw $t2, 0($t0) 		# loading value from address
		add $s0, $s0, $t2 	# adding total and the next number
		sub $t1, $t1, 1		# decrementing counter by one
		add $t0, $t0, 4		# shifting address by 4 bytes (one word) taking next value
		j sum

	end:
		la $t5, result		# loading address where to store the result
		sw $s0, 0($t5)		# storing the result in memory
		li $v0, 10			# calling exit syscall function
		syscall