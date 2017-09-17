# Write a program that writes a string that ends with '\0' in memory (using .asciiz or .ascii)
# Convert then all 'e's in the string with the 'a' using a cycle that iterates the string in memory.
# The cycle must end when if finds '\0' (null char, its value is 0 in ascii table)

# I'm working with bytes and not words since a single char is 8 bit (1 byte) is ascii code (actaully 7 bit in ascii and 8 bit in ascii extended)
# So <sb $t3, 0(string)> stores 'H', <sb $t3, 1($t0)> stores 'i' and so on.

.data
	string: .asciiz "Hi, i em e string!\n"	# \n has nothing to do with \0. 
											# \0 is automatically inserted by .asciiz at the end of the string (after \n)
.text
	.globl main

main:
	la $t0, string
	li $v0, 4						# calling print_string
	move $a0, $t0					# moving the string reference to the syscall register used as parameter
	syscall							# printing original string
	
	addi $t4, 101					# loading 'e' char ascii code (Decimal)
	addi $t3, 97					# loading 'a' char ascii code

	lb $t2, 0($t0)					# loading first char so that the register doesn't equal to 0 at the beginning

	cycle:
		beqz $t2, end 				# jump when char is equal to 0 in ascii table (\0)
		lb $t2, 0($t0)				# loading current char
		bne $t2, $t4, end_cycle		# jump to the end of the cycle if the char doens't equal to 'e'
		sb $t3, 0($t0)				# store in the current position 'a' replacing the current char
		end_cycle:
			addi $t1,-1				# decrementing counter
			addi $t0, 1				# incrementing byte position
			j cycle

end:
	la $t0, string 				# re-loading string data address
	li $v0, 4					# calling print_string
	move $a0, $t0				# moving the string reference to the syscall register used as parameter
	syscall						# printing modified string

	li $v0, 10					# calling exit syscall function
	syscall

