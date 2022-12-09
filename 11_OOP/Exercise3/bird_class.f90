module bird_class

    use amniote_abstract_class, only: amniote
    implicit none

    private
    public bird

    type, extends(amniote) :: bird 
        private
        logical :: can_fly
        logical :: is_perching ! passerine
        ! type, 1=pheasant like, 2=waterfowl
        integer :: type
    contains
        procedure, public :: birth
        procedure, public :: breed
        procedure, public :: forage
        procedure, public :: death
    end type bird

    interface bird
        module procedure init_bird
    end interface bird

contains

    type(bird) function init_bird()
            
    end function init_bird

    logical function birth(self)
        class(bird), intent(in) :: self

    end function birth

    subroutine breed(self, breed_success, num_offspring)
        class(bird), intent(inout) :: self
        logical, intent(inout)     :: breed_success
        integer, intent(inout)     :: num_offspring

    end subroutine breed

    subroutine forage(self, forage_success, food)
        class(bird), intent(inout)       :: self
        logical, intent(inout)           :: forage_success
        character(len=20), intent(inout) :: food

    end subroutine forage

    logical function death(self)
        class(bird), intent(in) :: self

    end function death

end module bird_class