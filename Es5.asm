# Write an assembly program that calculates the absolute value of an integer
# and prints its value on screen (syscall or mapped I/O) 

.data
	values: .word -24512

.text
	.globl main

main:
	la $t1, values
	lw $a0, 0($t1)
	jal absolute

end:
	move $a0, $v0				# moving int in syscall parameter to be printed
	li $v0, 1					# print_int code
	syscall						# calling SO service, print_int in this case (output handler)
	li $v0, 10					# calling exit syscall function
	syscall

absolute:
	move $t0, $a0				# saving parameter
	bgez $t0, end_procedure
	mul $t0, $t0, -1
	end_procedure:
		move $v0, $t0
		jr $ra					# jump back to the instruction address after jal