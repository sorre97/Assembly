# Write a procedure that calculates the maximum and the minimum number between integers in the array
# passed as parameter and prints their value on screen (syscall)

.data
	values: .word -1, 4, 77, 9, 66, 4, 2, 3, 44, 99

.text
	.globl main

main:
	la $a0, values 		# loading array's address and passing it as parameter for the procedure below 
	jal maxMin
	move $s0, $v0		# saving max value returned from the procedure
	move $s1, $v1		# saving min value returned from the procedure
end:
	li $v0, 1			# print_int code
	move $a0, $s0		# moving max in syscall parameter to be printed
	syscall				# calling SO service, print_int in this case (output handler)
	move $a0, $s1
	syscall				# calling SO service, print_int in this case (output handler)
	li $v0, 10			# calling exit syscall function
	syscall
	# No space is provided, it should be 992 -> 99 max and 2 min

maxMin:
	move $t0, $a0 		# preserving parameter of the procedure
	
	addi $sp, -4
	sw $ra, 0($sp) 		# saving $ra before calling nested procedures ($ra will be overwritten)

	jal max 			# calling procedure that calculates max in array
	move $s3, $v0
	jal min 			# calling procedure that calculates min in array
	move $v1, $v0		# returning min in $v1
	move $v0, $s3		# returning max in $v0

	lw $ra, 0($sp) 		# restoing previous $ra address
	jr $ra				# coming back to the caller

# nested procedures
max:
	# # # # # # # # # # # # # # # # # # # # # # # # # # # 
	# 
	#	This procedure iterates over the array  	
	# 	passed as reference with its address is $a0
	# 	and return the max value in the array in $v0
	#

	move $t1, $a0					# saving temporarely array reference
	addi $t2, 8						# setting counter
	lw $s0, 0($t1)					# setting initial max
	cycle:
		beq $t2, $0, end_cycle

		addi $t1, 4					# next values
		addi $t2, -1				# decrementing counter

		lw $t3, 0($t1)				# value to analyze
		sub $t4, $t3, $s0			# difference between the current number and the maximum
		blez $t4, cycle     		# if the sub is less or equal zero, the number is not superior, cycle again with next value
		move $s0, $t3				# save the new max value in the max register
		j cycle
	end_cycle:
		move $v0, $s0				# returning max in the conventinal register
		jr $ra

min:
	# # # # # # # # # # # # # # # # # # # # # # # # # # # 
	# 
	#	This procedure iterates over the array  	
	# 	passed as reference with its address is $a0
	# 	and return the min value in the array in $v0
	# 

	move $t1, $a0					# saving temporarely array reference
	addi $t2, 8						# setting counter
	lw $s0, 0($t1)					# setting initial min
	cycle2:
		beq $t2, $0, end_cycle2

		addi $t1, 4					# next values
		addi $t2, -1				# decrementing counter

		lw $t3, 0($t1)				# value to analyze
		sub $t4, $s0, $t3			# difference between the minimum and the current number
		blez $t4, cycle2     		# if the sub is less or equal zero, the number is not superior, cycle again with next value
		move $s0, $t3				# save the new min value in the min register
		j cycle2
	end_cycle2:
		move $v0, $s0				# returning min in the conventinal register
		jr $ra