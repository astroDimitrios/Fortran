module holiday_ice_cream_class
    
    use ice_cream_base, only: ice_cream
    implicit none
    
    private
    public holiday_ice_cream

    type, extends(ice_cream) :: holiday_ice_cream
        private
    contains
        ! must have this procedure defined in base class
        procedure, public :: check_holiday
    end type holiday_ice_cream

    interface holiday_ice_cream
        module procedure init_holiday_ice_cream
    end interface holiday_ice_cream

contains

    type(holiday_ice_cream) function init_holiday_ice_cream(name)
        character(len=15), intent(in) :: name
        init_holiday_ice_cream%name = name
        init_holiday_ice_cream%holiday_only = .true.
    end function init_holiday_ice_cream

    subroutine check_holiday(self)
        class(holiday_ice_cream), intent(in) :: self
        print *, trim(self%name), ' is a holiday only ice cream.'
    end subroutine check_holiday

end module holiday_ice_cream_class