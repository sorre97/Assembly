Assembly exercises (MIPS32)
===================
Those are a few exercises I've come with in order to exercise with assembly MIPS32 programming language. 
Simulator I've used to test: *QtSpim*<sup>1</sup> (Also *MARS MIPS* is good to go)

### **Es1.asm**

*Write an assembly program that reads 3 values a, b and c memorised in memory  at the "values" label. Store them in _\$t0, \$t1, and \$t2_ registers and calculate:*

 - *Sum of those 3 values if the first one is positive*

 - *Prod of those 3 values if the first one is negative*

 - *AND of second and third value is the first one is equal to zero*

*Store the final value is the memory location **after the last value**.*

:page_facing_up: [Download the asm file](https://raw.githubusercontent.com/sorre97/Assembly/master/Es1.asm)

----------


### **Es1b.asm** <sup>Input version (use syscall or mapped I/O)</sup>
*Write an assembly program that outputs a string asking for 3 integer values **from input** a, b and c memorised in memory  at the "values" label. Store them in* \$t0, \$t1, *and* \$t2 *registers and calculate:*

- *Sum of those 3 values if the first one is positive*

- *Prod of those 3 values if the first one is negative*

- *AND of second and third value is the first one is equal to zero*

*Store the final value is the memory location **after the last value inserted**.*

:page_facing_up: [Download the asm file](https://raw.githubusercontent.com/sorre97/Assembly/master/Es1b.asm)

----------

### **Es2.asm**

*Calculate the sum of 10 numbers stored in memory and store the result back in memory*

:page_facing_up: [Download the asm file](https://raw.githubusercontent.com/sorre97/Assembly/master/Es2.asm)

-----------

### **Es3.asm**

*Write **a procedure** that, given an array stored in data segment and a number 'n',*
*returns the n-th element of the array (remember that arrays are '0'-index based)*

:page_facing_up: [Download the asm file](https://raw.githubusercontent.com/sorre97/Assembly/master/Es3.asm)

-----------

### **Es4.asm**

*Write **a procedure** that calculates the maximum and the minimum number between integers in the array*
*passed as parameter and prints their value on screen (syscall)*

Use a procedure that calls other two sub-procedures that calculate max and min separately. Remember to save the $ra register using the stack pointer!

:page_facing_up: [Download the asm file](https://raw.githubusercontent.com/sorre97/Assembly/master/Es4.asm)

-----------

### **Es5.asm**

*Write an **assembly procedure** that calculates the absolute value of an integer*
*and prints its value on screen (syscall or mapped I/O)*


:page_facing_up: [Download the asm file](https://raw.githubusercontent.com/sorre97/Assembly/master/Es5.asm)

-----------

### **Es6.asm**

*Write an assembly program that writes numbers from 20 to 30 starting from memory-location*
*0x10010000 up to 0x10010028 using a cylce and ends the program.*
*Remember: data segment starts from 0x10010000 (hex)*


:page_facing_up: [Download the asm file](https://raw.githubusercontent.com/sorre97/Assembly/master/Es6.asm) 

-----------

### **Es7.asm**

*Write a program that writes a string that ends with '\0' in memory (using .asciiz or .ascii)*
*Convert then all 'a's in the string with the 'e' using a cycle that iterates the string in memory.*
*The cycle must end when if finds '\0' **(null char, its value is 0 in ascii table)** *

Note: .asciiz automatically ends the string with \0 (null char), .ascii don't. If using .ascii manually insert \0

##### I'm working with bytes and not words since a single char is 8 bit (1 byte) is ascii code (actaully 7 bit in ascii and 8 bit in ascii extended)
So, given the string 

    "Hi I am a string"

and "string" the label of the data segment of the string

`sb $t3, 0(string)` stores 'H' in \$t3, `sb $t3, 1($t0)` stores 'i' in \$t3 and so on.

:page_facing_up: [Download the asm file](https://raw.githubusercontent.com/sorre97/Assembly/master/Es7.asm)

-----------

### **Es8.asm**

*Write a program that does a research inside an array of integers, in particular:*

 - *$a0 contains the address of the array of integers*

 - *$a1 contains the number of elements inside the array*

 - *$a2 contains the number to search*

*The program must set $s0 at 1 is the number is found, 0 otherwise.*

:page_facing_up: [Download the asm file](https://raw.githubusercontent.com/sorre97/Assembly/master/Es8.asm)

-----------

1: *Spim is a self-contained simulator that runs MIPS32 programs. It implements almost the entire MIPS32 assembler-extended instruction set.*
