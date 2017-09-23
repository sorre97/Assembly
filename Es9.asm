# Determinate if a triangle is equilateral, iscosceles or scalene. In particular:  
	# An equilateral triangle has all three sides the same length.
	# An isosceles triangle has two sides the same length
	# A scalene triangle has all sides of different lengths
# The program must set $s0 at 2 if the triangle is equilatera, at 1 if is iscosceles and, 0 otherwise

# NOTE: you have to check if the triangle is a valid triangle. So all sides must have length > 0 and
# you have to discuss triangle inequality (the sum of the lengths of any two sides must be greater than or equal to the length of the third side)
# Use two procedures to check it.

.data
	values: 
		side1: .word 25
		side2: .word 4
		side3: .word 3
	not_valid: .asciiz "The triangle is not valid\n"
.text
	.globl main

main:
	la $t0, values			# loading sides address location label
	lw $a0, 0($t0)			# loading side1 (parameter 1)
	lw $a1, 4($t0)			# loading side2	(parameter 2)
	lw $a2, 8($t0)			# loading side3	(parameter 3)

	jal valid_triangle		# procedure that checks if triangle is valid

	bne $v0, $0, else
	# if triangle is not valid
	if:
		li $v0, 4				# calling print_string function
		la $a0, not_valid		# loading string address in syscall parameter
		syscall
		j end
	else:



	end:
		li $v0, 10					# calling exit syscall function
		syscall


valid_triangle:

	# # # # # # # # # # # # # # # # # # # # # # # # # #
	# 
	#	This procedure calls two sub-procedures,  	
	# 	valid_length and valid_inequality
	# 	and returns in $v0 the AND value of both
	#

	addi $sp, -4 			# decrementing stack pointer offset to save $ra
	sw $ra, 0($sp)			# saving $ra in memory

	# Check length > 0
	jal check_length
	move $v1, $v0			# moving return value to another register
	jal check_inequality
	and $v0, $v0, $v1		# valutating both contidion. if one is false the traingle is not valid ($v0 = 0)
	lw $ra, 0($sp)			# restoring $ra from memory
	jr $ra

check_length:
	bltz $a0, if2			# jump if sides are < 0
	bltz $a1, if2
	bltz $a2, if2
	j else2
	if2:
		li $v0, 0
		jr $ra
	else2:
		li $v0, 1
		jr $ra

check_inequality:
	add $t1, $a0, $a1		# sum of 2 sides
	slt $v0, $a3, $t1		# if the third side is less then the sum of the two, $v0 = 1 (valid), else $v0 = 0 (not_valid)
	jr $ra
	