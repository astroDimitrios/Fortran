Exercises from - https://wiki.uiowa.edu/download/attachments/109785161/fortran-novella-holcomb.pdf
SCIENTIFIC PROGRAMMING IN FORTRAN 2003
A tutorial Including Object-Oriented Programming
Katherine Holcomb

Notes on above:

1. Pg 12 Relational operator .ne. NOT .neq. as in book.
2. Uses old array construction notation in Ch3.
3. Pg 24 error, for ROW major ordering use:
   ````
   order = (/2, 1/)
   ````
4. No method to write arrays neatly given to check your work. Use https://www.tutorialspoint.com.cach3.com/programming_example/hhj1FL/fortran-reshape-functions.html seen in Ch3 ex2 code (***3_Arrays/ex2.f90***) or output to csv (later chapter).
5. Ch5 ex1 when the author says upper bound the meaning is the size of the array.
6. Ch5 ex3 exercise says to declare dx but not used in program.

For Later:

https://doku.lrz.de/display/PUBLIC/Programming+with+Fortran

Questions:

1. Block finalisation control?
2. Functions why bother if there are subroutines?