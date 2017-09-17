# Write an assembly program that reads 3 values a, b and c memorised in memory at the "values" label. Store them in $t0, $t1, and $t2 registers and calculate:
	# Sum of those 3 values if the first one is positive
	# Prod of those 3 values if the first one is negative
	# AND of second and third value is the first one is equal to zero
# Store the final value is the memory location after the last value.

.data
	values: .word 8, 7, 8
	mem: .word 0

.text
	.globl main

main: 
	la $t5, values
	lw $t0, 0($t5) # Loading values
	lw $t1, 4($t5)
	lw $t2, 8($t5) 

	# CASE 1
	# pseudoinstruction
	# bgt $t0, $r0, case1

	# corrispondent ISA instructions
	slt $t3, $t0, $0
	beq $t3, $0, case1

	# CASE 2
	# pseudoinstruction
	# bgt $r0, $t0, case1

	# corrispondent ISA instructions
	slt $t3 $0, $t0
	beq $t3, $0, case2

	# CASE 3
	beq $t0, $0, case3

	case1: 
		add $s0, $t0, $t1
		add $s0, $s0, $t2
		j end

	case2:
		mul $s0, $t0, $t1
		mul $s0, $s0, $t2
		j end

	case3:
		and $s0, $t1, $t2
		j end

	end:
		la $t0, mem
		sw $s0, 0($t0)
		li $v0, 10
		syscall