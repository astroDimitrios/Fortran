module ice_cream_class

    implicit none
    private

    public ice_cream

    type ice_cream
        integer                        :: balls
        character(len=20)              :: flavour
        character(len=20), allocatable :: extras(:)
    contains
        private
        procedure, public :: add_balls
        procedure, public :: print => print_me
        procedure         :: add_ice_creams
        procedure         :: equate_ice_creams
        generic, public   :: operator(+) => add_ice_creams
        generic, public   :: assignment(=) => equate_ice_creams
        final             :: destructor
    end type ice_cream

    interface ice_cream
        module procedure constructor
    end interface ice_cream

contains

    function constructor() result(this_ice_cream)
        type(ice_cream) :: this_ice_cream

        this_ice_cream%balls = 1
    end function constructor

    subroutine add_balls(self, n)
        class(ice_cream), intent(inout) :: self
        integer, intent(in) :: n

        self%balls = self%balls + n
    end subroutine add_balls

    subroutine print_me(self)
        class(ice_cream), intent(in) :: self

        ! write # balls to char to left adjust when printed
        character(len=8)             :: i_char
        write (i_char, '(i8)') self%balls

        print *, 'Your Ice Cream:'
        print *, 'Scoops   = ', adjustl( i_char )
        print *, 'Flavours = ', self%flavour
        if ( allocated(self%extras) ) then
            print *, 'Extras   = ', self%extras
        end if
    end subroutine print_me

    type(ice_cream) function add_ice_creams( ice1, ice2 )
        class(ice_cream), intent(in) :: ice1, ice2
        integer                      :: num_balls, num_extras = 0
        integer                      :: num_extras_1 = 0, num_extras_2 = 0
        character(len=20)            :: comb_flavour

        num_balls = ice1%balls + ice2%balls
        ! combine flavours unless the same
        if ( ice1%flavour == ice2%flavour ) then
            comb_flavour = ice1%flavour
        else
            comb_flavour = trim(ice1%flavour) // ' & ' // trim(ice2%flavour)
        end if
        
        add_ice_creams = ice_cream(balls=num_balls, flavour=comb_flavour)

        ! see if extras were added
        if ( allocated(ice1%extras) ) then
            num_extras_1 = size(ice1%extras)
        end if
        if ( allocated(ice2%extras) ) then
            num_extras_2 = size(ice2%extras)
        end if

        ! allocate new extras
        num_extras = num_extras_1 + num_extras_2
        if ( num_extras > 0 ) then
            allocate( add_ice_creams%extras(num_extras) )
            if ( (num_extras_1 > 0) .and. (num_extras_2 > 0) ) then
                add_ice_creams%extras = [ ice1%extras, ice2%extras ]
            else if ( (num_extras_1 > 0) ) then
                add_ice_creams%extras = [ ice1%extras ]
            else if ( (num_extras_2 > 0) ) then
                add_ice_creams%extras = [ ice2%extras ]
            end if
        end if

    end function add_ice_creams

    subroutine equate_ice_creams( lhs_ice, rhs_ice )
        class(ice_cream), intent(in) :: rhs_ice
        class(ice_cream), intent(out) :: lhs_ice
        integer                      :: num_extras

        lhs_ice%balls = rhs_ice%balls
        lhs_ice%flavour = rhs_ice%flavour
        if ( allocated(rhs_ice%extras) ) then
            num_extras = size(rhs_ice%extras)
            allocate( lhs_ice%extras(num_extras) )
            lhs_ice%extras = rhs_ice%extras
        end if

    end subroutine equate_ice_creams

    subroutine destructor(self)
        type(ice_cream) :: self
        if ( allocated(self%extras) ) then 
            deallocate(self%extras)
        end if
    end subroutine destructor

end module ice_cream_class