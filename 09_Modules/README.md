# Notes

The notes for Chapter 9 Modules are [here](../01_Notes/06_1_Modules.md) in my notes.

[ex2](./Exercise2/ex2.f90) - Contains IEEE Inf use, and the `random_number` intrinsic, good module use example  
[ex3](./Exercise3/ex3.f90) - CONSTANTS, proper use of KINDS and constants, good procedure overload example  
[ex4](./Exercise4/ex4.f90) - Overloaded + operator used on a derived type

## Exercises

### ex1

! Write a module that computes the mean and standard deviation  
! of the values in an input vector.  
! Only the return values should be public;  
! all internal variables should be declared private.  
! Use the module in a program.  

### ex2

! Write another module that computes the standard deviation  
! and the sample kurtosis of an input vector.  
! Write a program that uses both modules,  
! but loads the standard deviation function from this module  
! under a different name.  
! Compute the mean, standard deviation, and sample kurtosis  
! for a vector obtained using the random_number intrinsic.

### ex3

! Change one of the modules from the preceding exercise  
! so that the functions will accept either real or  
! double precision input values.

### ex4

! Write a module in which a type is defined consisting of  
! two reals and an array of undetermined size.  
! Define the + operator for this type.  
! Write a main program that uses the module,  
! creates two of this type, and add them.
