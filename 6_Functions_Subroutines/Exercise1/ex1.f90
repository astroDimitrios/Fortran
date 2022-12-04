! Write a function that evaluates the hyperbolic cosine of a complex variable z.
! Use the formula cosh(z) = 0.5*(e**z + e**-z)
! Do not worry about numerical accuracy.
! Do not use the name cosh for your function, since that is the name
! of an intrinsic function.

program hypcosh

    implicit none

    complex :: xx, yy

    xx = ( 3, 4 )
    yy = my_cosh(xx)

    print *, 'y =', yy

contains

    function my_cosh(x) result(y)
        complex, intent (in)  :: x
        complex               :: y

        y = 0.5 * ( exp(x) + exp(-x) )
    end function my_cosh

end program hypcosh