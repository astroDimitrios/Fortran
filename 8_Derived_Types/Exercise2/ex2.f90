! Define a derived type that would describe a species,
! with the aim of creating a simple database for the
! use of a code that models an ecosystem.
!
! Elements are up to the programmer's discretion but might
! include entries such as type of species
! (e.g. plant, animal, bacterium, etc.), genus name, species name,
! habitat type, observed population, and so forth.
!
! Make at least one member of the type be an integer vector
! to hold characteristics of the species such as
! habitat type, population, and other descriptors that
! might be useful to an ecology model.

program ex2
    implicit none

    type species
        character(len=20) :: genus_name
        character(len=20) :: species_name
        integer           :: habitat_type
        integer           :: population
    end type species
    
end program ex2