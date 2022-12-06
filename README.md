# Fortran

Notes and Exercises from:       
[SCIENTIFIC PROGRAMMING IN FORTRAN 2003](https://wiki.uiowa.edu/download/attachments/109785161/fortran-novella-holcomb.pdf)      
A tutorial Including Object-Oriented Programming
Katherine Holcomb

Notes on above:

1. Pg 12 Relational operator .ne. NOT .neq. as in book.
2. Uses old array construction notation in Ch3.
3. Pg 24 error, for ROW major ordering use:
   ````
   order = (/2, 1/)
   ````
4. No method to write arrays neatly given to check your work. Use [tutorialspoint](https://www.tutorialspoint.com.cach3.com/programming_example/hhj1FL/fortran-reshape-functions.html) seen in Ch3 ex2 code (***[03_Arrays/ex2.f90](./03_Arrays/ex2.f90)***) or output to csv (later chapter).
5. Ch5 ex1 when the author says upper bound the meaning is the size of the array.
6. Ch5 ex3 exercise says to declare dx but not used in program.

## lrz course

The directory contains some code and bits from the Leibniz Supercomputing Centre course [Programming with Fortran](https://doku.lrz.de/display/PUBLIC/Programming+with+Fortran),
to supplment the Holcomb pdf.

# Questions:

1. Block construct - what does ***it has finalisation control*** mean? Memory thing? Allows memory to be written over.
2. Functions why bother if there are subroutines? Functions small things, clearer? Subroutines can alter variables - function returns one thing.
3. What's the best way to allow a function to take an argument of SP or DP type? Surely lots of code dup if the whole function has to be copied?