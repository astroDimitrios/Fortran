module mammal_class

    use amniote_abstract_class, only: amniote
    implicit none

    private
    public mammal

    type, extends(amniote) :: mammal 
        private
        ! type, 1=monotreme, 2=marsupial, 3=placental
        integer :: type
    contains
        procedure, public :: birth
        procedure, public :: breed
        procedure, public :: forage
        procedure, public :: death
    end type mammal

    interface mammal
        module procedure init_mammal
    end interface mammal

contains

    type(mammal) function init_mammal()
            
    end function init_mammal

    logical function birth(self)
        class(mammal), intent(in) :: self

    end function birth

    subroutine breed(self, breed_success, num_offspring)
        class(mammal), intent(inout) :: self
        logical, intent(inout)       :: breed_success
        integer, intent(inout)       :: num_offspring

    end subroutine breed

    subroutine forage(self, forage_success, food)
        class(mammal), intent(inout)     :: self
        logical, intent(inout)           :: forage_success
        character(len=20), intent(inout) :: food

    end subroutine forage

    logical function death(self)
        class(mammal), intent(in) :: self

    end function death

end module mammal_class