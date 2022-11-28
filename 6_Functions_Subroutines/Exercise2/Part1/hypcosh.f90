module hypcosh

    implicit none

    interface my_cosh
        module procedure my_cosh_r
        module procedure my_cosh_z
    end interface

contains
    
    ! real args
    function my_cosh_r(x) result(y)
        real, intent (in)  :: x
        real               :: y

        y = 0.5*(exp(x)+exp(-x))
    end function

    ! complex args
    function my_cosh_z(x) result(y)
        complex, intent (in)  :: x
        complex               :: y

        y = 0.5*(exp(x)+exp(-x))
    end function

end module hypcosh