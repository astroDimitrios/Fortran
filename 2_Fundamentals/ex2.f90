! Write a program that adds a real number to an integer.
! Follow correct style and be sure to cast one of the numbers appropriately.

program ex2

    implicit none

    integer :: a = 5
    real    :: b = 4.0, c

    c = real(a) + b ! Try to cast from low --> high pres
    
    write (*,*) c

end program ex2