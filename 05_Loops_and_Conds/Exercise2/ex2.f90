! Use the Leibnitz formula to compute 𝜋
! Compute until your result agrees to four decimal digits with the correct
! value. This series converges
! very slowly so this will still take a lot of iterations.

program ex2

    implicit none

    integer         :: k = 0
    real, parameter :: PI = 3.1415
    real            :: my_PI = 0

    do while ( my_PI /= PI )
        if ( mod(k, 1000) == 0 ) then
            print *, 'Iteration (1000s)', k/1000
        end if
        my_PI = my_PI + 4.*( (-1.)**k ) / ( 2.*k + 1. )
        k = k + 1
    end do

    print *, 'True Value =    ', PI
    print *, 'My Value =      ', my_PI
    print *, 'Num Iterations = ', k

end program