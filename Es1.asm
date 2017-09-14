# Si chiede di scrivere il programma assembly che legge 3 valori a, b, e c memorizzati 
# nella memoria all’etichetta “valori” nei registri $t0, $t1, $t2 e calcola:

# case1: La somma dei tre valori in $s0 se il primo valore e’ positivo

# case2: Il prodotto dei tre numeri in $s0 se il primo valore e’ negativo

# case3: L’AND del secondo e del terzo numero se il primo e’ uguale a zero.

# Si chiede di memorizzare il risultato in memoria nella locazione subito dopo il terzo valore.

.data
	valori: .word 8, 7, 8
	mem: .word 0

.text
	.globl main

main: 
	la $t5, valori
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