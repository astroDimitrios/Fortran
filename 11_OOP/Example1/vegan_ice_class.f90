module vegan_ice_class

    use ice_cream_class, only: ice_cream
    implicit none
    private

    public vegan_ice

    type, extends(ice_cream) :: vegan_ice
        private
        logical :: is_vegan = .true.
    contains
        procedure :: print => print_me
    end type vegan_ice

    interface vegan_ice
        module procedure init_vegan_ice
    end interface vegan_ice

contains

    type(vegan_ice) function init_vegan_ice()
        init_vegan_ice%balls = 1
    end function init_vegan_ice

    ! overload the ice_cream class print_me subroutine
    subroutine print_me(self)
        class(vegan_ice), intent(in) :: self

        print *, "EAT SORBET IF YOU'RE VEGAN"
    end subroutine print_me

end module vegan_ice_class