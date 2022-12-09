module reptile_class

    use amniote_abstract_class, only: amniote
    implicit none

    private
    public reptile

    type, extends(amniote) :: reptile 
        private
        ! tpye, 1=turtle, 2=lizard or snake, 3=crocodilian 
        integer :: type
    contains
        procedure, public :: birth
        procedure, public :: breed
        procedure, public :: forage
        procedure, public :: death
    end type reptile

    interface reptile
        module procedure init_reptile
    end interface reptile

contains

    type(reptile) function init_reptile()
            
    end function init_reptile

    logical function birth(self)
        class(reptile), intent(in) :: self

    end function birth

    subroutine breed(self, breed_success, num_offspring)
        class(reptile), intent(inout) :: self
        logical, intent(inout)        :: breed_success
        integer, intent(inout)        :: num_offspring

    end subroutine breed

    subroutine forage(self, forage_success, food)
        class(reptile), intent(inout)    :: self
        logical, intent(inout)           :: forage_success
        character(len=20), intent(inout) :: food

    end subroutine forage

    logical function death(self)
        class(reptile), intent(in) :: self

    end function death

end module reptile_class