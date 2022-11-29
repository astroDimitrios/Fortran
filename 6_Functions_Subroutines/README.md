# Notes

**[ex2_1](./Exercise2/Part1/ex2_1.f90)** overloaded function      
**[ex2_2](./Exercise2/Part2/ex2_2.f90)** divide by zero error check with ieee exceptions

# Exercises

## ex1

! Write a function that evaluates the hyperbolic cosine of a complex variable z.       
! Use the formula cosh(z) = 0.5*(e**z + e**-z)      
! Do not worry about numerical accuracy.      
! Do not use the name cosh for your function, since that is the name      
! of an intrinsic function.    

## ex2_1

! PART 1      
! Write a calling program for your hyperbolic cosine function.     
! Test for both real and complex parameters. (I interpret as overload)      
! For real parameters, you can use the cosh intrinsic to check that your function is correct.     

## ex2_2

! PART 2     
!   a. Write a function that takes two scalar variables as input and returns their sum.      
!   b. Change your sum function into a subroutine.    
!   c. Write a subroutine that takes two scalar variables as input and returns a vector    
!      with its first element the sum of the input, its second their difference,     
!      its third their product, and its fourth their quotient.    
!      Be sure to check for error conditions and return with a message if an illegal    
!      operation would be attempted, specifically a division by a number that is effectively zero.    

! Needs gfortran5 or ifort to compile with IEEE exceptions      
! [rosettacode](https://rosettacode.org/wiki/Detect_division_by_zero#Fortran) divide by zero check  

## ex3 and ex4

Both in the directory ***[Exercise3](./Exercise3/)*** in the file ***[ex3.f90](./Exercise3/ex3.f90)***.

! Change your program that solves Laplace's equation into    
! a program with at least one subroutine.    
! Pass the initial conditions to the subroutine.    


Laplace and Poisson in depth [here](http://faculty.otterbein.edu/DRobertson/compsci/em-stud.pdf)        
Cool animation [here](https://blog.c0nrad.io/posts/relaxation/)   

! Change this program to allow it to solve Poisson's equation.     
! Note that if 𝜌=0, Poisson's equation reduces to the Laplace equation.     
! Pass both the initial conditions and the source function to the    
! solver subroutine.    
! Be sure to use an interface for the source function.     

## ex5

! Write a subroutine with two mandatory and two optional arguments.     
! Assign a default value to one of the optional arguments.     
! Test whether the optional arguments are passed      
! and perform some operations if they are.     
! Write a calling program that exercises all possibilities    
! for calling this subroutine.    

## ex6

! Write a calling program for the outer_scope and inner_scope    
! block in the text above.     
! Add a variable x to the calling unit and set its value to 30.    
! Print all x variables.    
! What does this illustrate about variable scope?    
! Print z in inner_scope.    