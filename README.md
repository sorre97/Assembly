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

1: *Spim is a self-contained simulator that runs MIPS32 programs. It implements almost the entire MIPS32 assembler-extended instruction set.*
