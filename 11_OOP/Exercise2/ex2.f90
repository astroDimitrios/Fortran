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
!
! Compile:
! gfortran -c bird_species_class.f90
! gfortran -c ex2.f90
! gfortran -o ex2 ex2.o bird_species_class.o
! ./ex2

program ex2

    use bird_species_class, only: bird_species
    implicit none

    type(bird_species) :: bird_1, bird_2, child_bird_1
    bird_1 = bird_species()

    call bird_1%hatch(child_bird_1)

end program ex2