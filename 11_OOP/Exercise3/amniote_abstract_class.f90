module amniote_abstract_class
    implicit none
    private

    public :: amniote

    type, abstract :: amniote
        private
        character(len=20) :: order
        character(len=20) :: genus
        character(len=20) :: species
        character(len=20) :: diet
        real              :: avg_lifespan
        logical           :: diurnal
    contains
        procedure (birth), deferred  :: birth
        procedure (breed), deferred  :: breed
        procedure (forage), deferred :: forage
        procedure (death), deferred  :: death
    end type amniote

    abstract interface  

        logical function birth(self)
            import amniote
            class(amniote), intent(in) :: self
        end function birth

        subroutine breed(self, breed_success, num_offspring)
            import amniote
            class(amniote), intent(inout) :: self
            logical, intent(inout)        :: breed_success
            integer, intent(inout)        :: num_offspring
        end subroutine breed

        subroutine forage(self, forage_success, food)
            import amniote
            class(amniote), intent(inout)    :: self
            logical, intent(inout)           :: forage_success
            character(len=20), intent(inout) :: food
        end subroutine forage

        logical function death(self)
            import amniote
            class(amniote), intent(in) :: self
        end function death

    end interface

end module amniote_abstract_class