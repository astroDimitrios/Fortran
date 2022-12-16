# Fortran

> Jump straight to the [NOTES](./01_Notes/README.md) section.

Notes and Exercises from:  
[SCIENTIFIC PROGRAMMING IN FORTRAN 2003](https://wiki.uiowa.edu/download/attachments/109785161/fortran-novella-holcomb.pdf)  
A tutorial Including Object-Oriented Programming
Katherine Holcomb

Notes on above:

1. Pg 12 Relational operator .ne. NOT .neq. as in book.
2. Uses old array construction notation in Ch3.
3. Pg 24 error, for ROW major ordering use:

   ````fortran
   order = [2, 1]
   ````

4. No method to write arrays neatly given to check your work. Use [tutorialspoint](https://www.tutorialspoint.com.cach3.com/programming_example/hhj1FL/fortran-reshape-functions.html) seen in Ch3 ex2 code (***[03_Arrays/ex2.f90](./03_Arrays/ex2.f90)***) or output to csv (later chapter).
5. Ch5 ex1 when the author says upper bound the meaning is the size of the array.
6. Ch5 ex3 exercise says to declare dx but not used in program.
7. Ch8 onwards gets hard to read the text because the pdf render has messed up formatting and no syntax hihglighting. Recommend find other online tutorials.

## EXTRAS

Everything in directories **12** and up are from sources other than Holcomb.

### [12 lrz course](./12_lrz_course/README.md)

Contains some tests based off the Leibniz Supercomputing Centre course [Programming with Fortran](https://doku.lrz.de/display/PUBLIC/Programming+with+Fortran),
to supplment the Holcomb pdf. Jump to [Notes](./01_Notes/12_lrz_course.md).

### [13 Doxygen](./13_Doxygen/)

Contains two examples showing documentation creation using Doxygen. Jump to [Notes](./01_Notes/13_Doxygen.md).

### [14 Coarrays](./14_Coarrays/)

Contains an example from the Intel tutorial [Using Coarray Fortran](https://www.intel.com/content/www/us/en/docs/fortran-compiler/tutorial-coarray/18-0/overview.html). Jump to [Notes](./01_Notes/14_Coarrays.md).

## Questions

1. Block construct - what does ***it has finalisation control*** mean?  
   Allows memory to be written over.
2. What's the best way to allow a function to take an argument of SP or DP type? Surely lots of code dup if the whole function has to be copied?  
   Procedure overloading, sep - modules for precision ... depends.
3. Does the file extension actually matter? `.f90` vs `.f95` etc.  
   Use `.f90` to denote free-form Fortran. Use `.F90` if the file needs [preprocessing](https://fortranwiki.org/fortran/show/File+extensions).

## Links

- Fortran, [https://fortran-lang.org/en/learn/](https://fortran-lang.org/en/learn/)
- Fortran Wiki, [https://fortranwiki.org/fortran/show/HomePage](https://fortranwiki.org/fortran/show/HomePage)
- Fortran90 Python Fortran Rosetta Stone, [https://www.fortran90.org/src/rosetta.html](https://www.fortran90.org/src/rosetta.html)
- Scientific Programming in Fortran 2003, Katherine Holcomb, 2008, [https://wiki.uiowa.edu/download/attachments/109785161/fortran-novella-holcomb.pdf](https://wiki.uiowa.edu/download/attachments/109785161/fortran-novella-holcomb.pdf)
- Programming with Fortran, lrz course, [https://doku.lrz.de/display/PUBLIC/Programming+with+Fortran](https://doku.lrz.de/display/PUBLIC/Programming+with+Fortran) - **Lots of Exercises**
- Programming with Fortran, unlv course, Ed Jorgensen, [http://www.egr.unlv.edu/~ed/fortran.html](http://www.egr.unlv.edu/~ed/fortran.html) - **Lots of Exercises**
