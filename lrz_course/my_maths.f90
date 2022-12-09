module my_maths
    implicit none

    ! better since no need to copy this code many times
    abstract interface 
        real function func_int(x)
            real, intent(inout) :: x
        end function func_int
    end interface

contains

    subroutine basic_maths(a, func, val)

        real, intent(inout)   :: a
        procedure(func_int)       :: func
        real, intent(out)     :: val

        ! can use interface below or
        ! abstract interface with procedure declaration

        ! interface
        !     real function func(x)
        !         real, intent(inout) :: x
        !     end function func
        ! end interface

        val = func(a)
    end subroutine basic_maths

end module my_maths

! Error for dummy function arg
! Noted here:
! https://github.com/hansec/fortran-language-server/issues/200