module my_maths
    implicit none
contains

    subroutine basic_maths(a, func, val)

        real, intent(inout)      :: a
        real, intent(out)     :: val

        interface
            real function func(x)
                real, intent(inout) :: x
            end function func
        end interface

        val = func(a)
    end subroutine basic_maths

end module my_maths

! Error for dummy function arg
! Noted here:
! https://github.com/hansec/fortran-language-server/issues/200