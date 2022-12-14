!----------------------------
! (c) GNU, GPL-3.0-or-later
!----------------------------
!> @file
!> @author  Dimitrios Theodorakis
!> @version 1.0
!> 
!> @section DESCRIPTION
!> 
!> Program implementing my own **hyperbolic cosine** function
!>
!> @note    This was from an activity in Scientific Programming
!>          in Fortran 2003 by Katherine Holcomb

program hypcosh

    use constants_mod, only: r_native
    implicit none

    complex :: xx, yy

    xx = ( 3, 4 )
    yy = my_cosh(xx)

    print *, 'y =', yy

contains

    !> @brief   Computes the hyperbolic cosine of a complex variable.
    !> @author  Dimitrios Theodorakis
    !> @details My own implementation of the hyperbolic cosine
    !>          function using cosh(z) = 0.5*(e**z + e**-z).
    !>
    !> @return  Returns hyp cosine as a complex variable.
    !> @param[in] x (in) Complex variable
    !>
    !> @note    FORTRAN <3
    !> @todo    Need to ensure numerical accuracy.
    !> @warning Just use the intrinsic function!

    function my_cosh(x) result(y)
        complex, intent (in)  :: x
        complex               :: y !< Complex output

        y = 0.5_r_native * ( exp(x) + exp(-x) )
    end function my_cosh

end program hypcosh