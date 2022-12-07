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

module bird_species_class
    implicit none
    private

    public bird_species

    type bird_species
        private
        character(len=20) :: genus_name, species_name
        integer           :: incubation_period         ! days
        real              :: mean_clutch_size          ! number of eggs
        character(len=15) :: diet
        integer           :: life_span                 ! days
    contains
        private
        procedure, public :: hatch
        procedure         :: equate_bird_species
        generic, public   :: assignment(=) => equate_bird_species
        final             :: destroy_bird_species
    end type bird_species

    interface bird_species
        module procedure init_bird_species
    end interface

contains

    function init_bird_species() result(new_species)
        implicit none
        type(bird_species) :: new_species

    end function init_bird_species

    subroutine hatch(self, chick)
        implicit none
        class(bird_species), intent(inout) :: self
        class(bird_species), intent(out)   :: chick

        real :: rand
        call random_number(rand)

        if ( rand > 0.5 ) then
            chick = self
            write (*,*) 'The chick survived!'
        else 
            write (*,*) 'The chick died...'
        end if

    end subroutine hatch

    subroutine equate_bird_species( lhs_bird, rhs_bird )
        implicit none
        class(bird_species), intent(in)  :: rhs_bird
        class(bird_species), intent(out) :: lhs_bird

        lhs_bird%genus_name = rhs_bird%genus_name
        lhs_bird%species_name = rhs_bird%species_name
        lhs_bird%incubation_period = rhs_bird%incubation_period
        lhs_bird%mean_clutch_size = rhs_bird%mean_clutch_size
        lhs_bird%diet = rhs_bird%diet
        lhs_bird%life_span = rhs_bird%life_span

    end subroutine equate_bird_species

    subroutine destroy_bird_species(self)
        implicit none
        type(bird_species) :: self

    end subroutine destroy_bird_species

end module bird_species_class