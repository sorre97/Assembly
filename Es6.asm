# Write an assembly program that writes numbers from 20 to 30 starting from memory-location
# 0x10010000 up to 0x10010028 using a cylce and ends the program.

.data	# data segment starts from 0x10010000
	values: .word 0	
.text
	.globl main

main:
	la $t0, values
	li $t1, 11
	li $t2, 20
	cycle:
		beqz $t1, end 			# counter check
		sw $t2, 0($t0)			# storing value in memory

		addi $t0, 4				# shifting memory location
		addi $t2, 1				# changing number to load by one
		addi $t1, -1			# decrementing counter
		j cycle

end:
	li $v0, 10					# calling exit syscall function
	syscall


# # # # # # # # # # # # # # # # # # # # # # # # # # # 
# 
#	This would have been the equal of
# 	for(int i = 0; i <= 11; i++){
#		int j = 20
# 		sw j, 0($t0)
# 		j++
# 	}
# 
# 