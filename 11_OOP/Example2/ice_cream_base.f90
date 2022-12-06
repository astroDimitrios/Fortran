module ice_cream_base
    implicit none
    private

    public :: ice_cream

    ! notice abstract here and before interface
    type, abstract :: ice_cream
        private
        character(len=15), public :: name
        logical, public           :: holiday_only
    contains
        ! procedure all child classes must have
        procedure (holiday), deferred :: check_holiday
    end type ice_cream

    abstract interface
        subroutine holiday(self)
            import ice_cream
            class(ice_cream), intent(in) :: self
        end subroutine holiday
    end interface

end module ice_cream_base