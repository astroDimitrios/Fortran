program type_ext
    implicit none

    type species
        character(len=20) :: genus_name
        character(len=20) :: species_name
    end type species

    type, extends(species) :: bird
        character(len=20) :: bird_name
    end type bird
    
end program type_ext