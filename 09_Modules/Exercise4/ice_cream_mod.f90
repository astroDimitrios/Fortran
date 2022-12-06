! Write a module in which a type is defined consisting of 
! two reals and an array of undetermined size.
! Define the + operator for this type.
! Write a main program that uses the module,
! creates two of this type, and add them.

module ice_cream_mod

    implicit none
    private

    public ice_cream
    public operator (+)

    interface operator (+)
        module procedure add_ice_cream
    end interface

    type ice_cream
        integer                        :: no_balls = 1
        real                           :: fat_content   ! g
        real                           :: water_content ! g
        character(len=15), allocatable :: flavours(:)
    end type ice_cream

contains

    function add_ice_cream(ball_1, ball_2) result(new_ice)
        implicit none
        type(ice_cream), intent(in)  :: ball_1
        type(ice_cream), intent(in)  :: ball_2
        type(ice_cream)              :: new_ice

        new_ice%no_balls = ball_1%no_balls + ball_2%no_balls
        new_ice%fat_content = ball_1%fat_content + ball_2%fat_content
        new_ice%water_content = ball_1%water_content + ball_2%water_content
        new_ice%flavours = [ball_1%flavours, ball_2%flavours]
    end function

end module