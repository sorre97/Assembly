# Si chiede di scrivere il programma assembly che legge 3 valori a, b, e c memorizzati  
# nella memoria all’etichetta “valori” nei registri $t0, $t1, $t2 e calcola:

# case1: La somma dei tre valori in $s0 se il primo valore e’ positivo

# case2: Il prodotto dei tre numeri in $s0 se il primo valore e’ negativo

# case3: L’AND del secondo e del terzo numero se il primo e’ uguale a zero.

# Si chiede di memorizzare il risultato in memoria nella locazione subito dopo il terzo valore.

# INPUT VERSION (syscall)

.data
	string : .asciiz "Write 3 int values\n"
	values: .word 0
	mem: .word 0

.text
	.globl main

main: 
	li $v0, 4			# loading print_string value on syscall argument register $v0
	la $a0, string 		# loading addsress of string to print on parameter register for syscall
	syscall				# calling I/O SO serice (Output)

	add $t3, $0, 3		# cycle predisposition
	and $t4, $t4, $0	# forcing $t4 register to zero value
	la $t4, values		# loading value address
	
	input:
		beq $t3, $0, end_cycle
		li $v0, 5 			# loading read_string value on syscall argument register $v0
		syscall				# calling I/O SO serice (Input)
		move $t0, $v0		# moving input value into temprary register
		sw $t0, 0($t4)		# storing input in memory
		addi $t4, $t4, 4	# shifting memory address by one space
		sub $t3, $t3, 1 	# decrementing counter of three inputs
		j input

	end_cycle:
		la $t4, values		# loading values on registers
		lw $t0, 0($t4)
		lw $t1, 4($t4)
		lw $t2, 8($t4) 

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
		j fine

	case2:
		mul $s0, $t0, $t1
		mul $s0, $s0, $t2
		j fine

	case3:
		and $s0, $t1, $t2
		j fine

	fine:
		la $t0, mem
		sw $s0, 0($t0)
		li $v0, 10
		syscall