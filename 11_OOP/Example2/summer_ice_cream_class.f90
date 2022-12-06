module summer_ice_cream_class
    
    use ice_cream_base, only: ice_cream
    implicit none
    
    private
    public summer_ice_cream

    type, extends(ice_cream) :: summer_ice_cream
        private
        character(len=15), public :: fruit
    contains
        ! must have this procedure defined in base class
        procedure, public :: check_holiday
    end type summer_ice_cream

    interface summer_ice_cream
        module procedure init_summer_ice_cream
    end interface summer_ice_cream

contains

    type(summer_ice_cream) function init_summer_ice_cream(name, fruit)
        character(len=15), intent(in) :: name, fruit
        init_summer_ice_cream%name = name
        init_summer_ice_cream%holiday_only = .false.
        init_summer_ice_cream%fruit = fruit
    end function init_summer_ice_cream

    subroutine check_holiday(self)
        class(summer_ice_cream), intent(in) :: self
        print *, trim(self%name), ' is a Summer only ice cream.'
    end subroutine check_holiday

end module summer_ice_cream_class