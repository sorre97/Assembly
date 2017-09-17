# Write a program that does a research inside an array of integers, in particular:  
	# $a0 contains the address of the array of integers
	# $a1 contains the number of elements inside the array
	# $a2 contains the number to search
# The program must set $s0 at 1 is the number is found, 0 otherwise

.data
	array: .word 5, 3, 66, 4, 99, 2, 9, 12, 22, 101
	found_value: .asciiz "The number was found at the position (0-indexed position): "
	not_found_value: .asciiz "The number was not found\n"
.text
	.globl main

main:
	la $a0, array					# loading array address
	li $a1, 10						# loading number of elements inside array
	add $a3, $a1, $0				# saving original numbers of elements value, the pseudoinstruction "move $a3, $a1" would have been the same
	li $a2, 84						# number to search

	cycle:
		beqz $a1, not_found 		# if counter goes to 0, we're at the end of the array, no value found

		lw $t0, 0($a0)				# loading value to compare
		beq $t0, $a2, found 		# if the value is equal to the number to search, jump to found label

		addi $a1, -1				# decrementing counter
		addi $a0, 4					# shifting address to load next value
		j cycle

# If the value is found
	found:						
		li $v0, 4					# calling print_string function
		la $a0, found_value 		# loading string address in syscall parameter
		syscall

		sub $a0, $a3, $a1			# calculating position of the element found (0 indexed, 10th element is at position 9)
		li $v0, 1					# loading print_int in syscall parameter
		syscall

		li $s0, 1					# as requested, set $s0 to 1 if found
		j end

# If the value is NOT found
	not_found:
		li $v0, 4					# calling print_string function
		la $a0, not_found_value 	# loading string address in syscall parameter
		syscall

		li $s0, 0					# as requested, set $s0 to 0 if not found
		j end

	end:
		li $v0, 10					# calling exit syscall function
		syscall

