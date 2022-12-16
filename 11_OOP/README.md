# Notes

[Example1](./Example1/) - Class, extended class, overloaded operator  
[Example2](./Example2/) - Abstract class, type guarding with `select type` construct

[ex1](./Exercise1/ex1.f90) - Example of arrays held in 2D array, **creating 2D cartesian grid**  
**[ex2](./Exercise2/ex2.f90)** - FULL formatted class, extended class, overloaded assignment, getter functions

## Exercises

### ex1

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

### ex2

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

### ex3

Not really clear what to do with the `feed` method. These instructions are too wishy washy especially for non-biologists. SKIP! SEE [Example 2](./Example2/ice_cream_test.f90) for an abstract class example.

! Write an abstract type amniote with attributes  
! order, genus name, species name, diet, average lifespan,  
! and a flag indicating diurnal or nocturnal.  
!  
! Write interfaces for deferred methods birth, breeding,  
! forage, and death. The birth and death methods should  
! return logicals; the breeding method should return  
! a logical and number of offspring  
! (which may be zero if the animal is not breeding),  
! and forage should return a logical and if true,  
! what the animal ate. Extend the abstract type with  
! types reptile, bird, and mammal.  
!  
! Include for reptiles at least an attribute to indicate  
! whether it is a turtle, a lizard or snake, or a crocodilian.  
! For birds include at least an attribute indicating whether  
! it is flightless, passerine (perching birds),  
! a pheasant like bird, or a waterfowl.  
! For mammals indicate whether it is a monotreme (platypus, echidna),  
! marsupial, or placental.  
!  
! Implement at least one polymorphic non deferred method feed  
! which indicates for breeding animals how it feeds its young  
! (self feeder should be a possibility)  
! Include a constructor for each implemented type.  
! The specified methods are minimums and the student should be  
! creative in developing a crude model of an animal that could  
! be used in a larger program such as an ecosystem model.  
! Write a test unit to exercise the objects.
