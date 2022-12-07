# Notes

[Example1](./Example1/) - Class, extended class, overloaded operator    
[Example2](./Example2/) - Abstract class, type guarding with `select type` construct

[ex1](./Exercise1/ex1.f90) - Example of arrays held in 2D array, **creating 2D cartesian grid**    

# Exercises

## ex1

! Write a class module that describes a grid for a numerical algorithm.     
! The grid should be two dimensional (x,y).     
!    
! The object should include a definition of the grid type    
! that includes variables for the number of points in each dimension,     
! the numerical coordinates of the first and last points in     
! each dimension, and the distance delta x, delta y    
! between each point in each dimension     
! (assumed constant, but could differ between x and y).     
!
! The object should contain methods that create the grid,     
! compute delta x and delta y, and multiply the number of grid points     
! in each dimension by some factor with a corresponding    
! change to delta x and delta y.     
!     
! Overload the assignment operator to copy a grid to another grid.    
! Write a main program that uses the object.    

## ex2