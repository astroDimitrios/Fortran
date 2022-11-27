module my_maths
    implicit none
contains

    subroutine basic_maths(a, fun, val)
        real, intent(in)  :: a
        real, intent(out) :: val

        interface
            real function fun(x)
                real :: x
            end function fun
        end interface

        val = fun(a)
    end subroutine basic_maths

end module my_maths