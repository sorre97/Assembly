# Write a procedure that, given an array stored in data segment and a number 'n' 
# return the n-th element of the array (remember that arrays are '0'-index based)

.data
	array: .word 3, 5, 6, 77, 9, 129, 34, 4
	result: .word 0

.text
	.globl main

main:
	la $a0, array 		# loading array address in convnetional parameter register for the procedure
	li $a1, 3			# loading second value
	jal procedure		# jump for the procedure saving back address in $31 or $ra
	move $s0, $v0		# moving the return value of the procedure to the saved register

end:
	la $t5, result		# loading address where to store the result
	sw $s0, 0($t5)		# storing the result in memory
	li $v0, 10			# calling exit syscall function
	syscall

procedure:
	li $t0, 4				
	mul $t0, $a1, $t0		# multipying the input number and 4 to create a shift (every word is 4 bytes, 4*n = (n+1)-th value of memory)
	add $t0, $a0, $t0		# adding the shift value to the address to point (n+1)-nth element
	lw $v0, 0($t0)			# loading the pointed value in the conventional return register
	jr $ra					# jump back to the instruction address after jal