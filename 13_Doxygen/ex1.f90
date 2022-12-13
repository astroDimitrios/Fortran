program hypcosh

    implicit none

    complex :: xx, yy

    xx = ( 3, 4 )
    yy = my_cosh(xx)

    print *, 'y =', yy

contains

    !> @brief   Computes the hyperbolic cosine of a complex variable.
    !> @details My own implementation of the hyperbolic cosine
    !>          function using cosh(z) = 0.5*(e**z + e**-z).
    !>
    !> @return  Returns hyp cosine as a complex variable.
    !> @param[in] x Complex variable
    !>
    !> @todo    Need to ensure numerical accuracy.

    function my_cosh(x) result(y)
        complex, intent (in)  :: x
        complex               :: y !< Complex output

        y = 0.5 * ( exp(x) + exp(-x) )
    end function my_cosh

end program hypcosh