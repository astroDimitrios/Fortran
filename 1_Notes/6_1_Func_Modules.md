# Function Modules

**DO** put subroutine in module program unit (or internal subprogram)

## Contents

1. [Internal Functions and Subroutines](#1)
2. [External Modules](#2)
    1. [Compiling Notes](#21)
3. [Archive Files](#3)

<a name="1"></a>
# Internal Functions and Subroutines

````fortran
subroutine process_x(...)
    real :: a = 10, z
    z = slide( 2, 3 ) ! invoke in host 
    ...
contains
    ! internal function
    real function slide( x, y )
        ...
        slide = a ! accessed by host association
    end function slide
    ! internal subroutine
    subroutine fake(...)
        ...
        slide( 3, 4 ) ! accessed by host association
    end subroutine fake
end subroutine process_x
````

Internal procedures can only be called from within the host, denoted by the `contains` statement. An interface is automatically created. If the internal procedure is only a few statements then it is inlined by the compiler which avoids procedure call overhead.

<br></br>
<a name="2"></a>
# External Modules

````fortran
module mod_solvers
    implicit none
contains
    subroutine solve_quadratic ( a, b, c )
        <code>
    end subroutine solve_quadratic
! more subroutines below
end module mod_solvers
````

then in main program:

````fortran
use mod_solvers, only solve_quadratic
implicit none
````
you can now call the function.

<a name="21"></a>
## Compiling

````
gfortran -c -o mod_solvers.o mod_solvers.f90
gfortran -c -o my_main.o my_main.f90
````
`-c` flag compiles but doesn't link files. Do main program and module separately. Then:

````
gfortran -o main.exe my_main.o mod_solvers.o
````
## Different directory for Module Files

Use `-I` flag
````
gfortran -I../modfiles -c prog.f90
```` 
<br></br>
<a name="3"></a>
# Multiple modules in an Archive File

Can store in archive file if they aren't changing often:

`ar cr my_lib.a obj1.o obj2.o obj3.o`

Creates a `.a` archive file with the 3 obj module files inside.

````
gfortran -o main.exe my_main.o my_lib.a
````