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

! Write a class module that implements a bird_species object.     
! This object will have attributes such as genus name, species name,    
! incubation period, mean clutch size, diet preference,     
! and average life span.   
!     
! The methods should include procedures: hatch, which returns a logical     
! (i.e. did the chick survive);     
! fledge, which also returns a logical for survival or not,    
! and forage, which returns something to indicate whether    
! the bird found food and if so, what it was.     
!     
! Write another module bird which extends bird_species to describe     
! an individual of a particular species.      
! The attributes of each instance of this object will be those     
! relevant to an individual, including age, gender, and whether   
! it is currently breeding.    
! Write a constructor for each type.     
!    
! Write a short program to test your modules.    