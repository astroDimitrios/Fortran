! Adapted from: https://stackoverflow.com/questions/38848530/passing-arguments-by-value-in-fortran-95
! WITHOUT the value attribute the arguments are passed as variables
! which are modified by the function.
! WITH the value attribute the arguments are passed as values
! these don't alter the host programs variables

program value

    implicit none  

    integer :: a, b, c, d
  
    a = 1
    b = 2
    c = 3
  
    print *, a, b, c
    d = f(a, b, c)
    print *, d
  
    print *, a, b, c
  
contains
    function f(x, y, z) result(r)
        integer        :: x, y, z
        ! integer, value :: x, y, z
        integer        :: r
  
        r = x + y + z
        x = 0
        y = 0
        z = 0  
    end function f
end program value