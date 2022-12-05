# Modules

**DO** put subroutines and functions in modules
## Contents

1. [Internal Functions and Subroutines](#1)
2. [External Modules](#2)
    1. [Compiling Notes](#21)
    2. [Public and Private Data](#22)
    3. [Use options](#23)
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

<div style="color: black; background-color:rgba(37, 150, 190, 1); text-align:left; vertical-align: middle; padding: .3em; margin: .5em;">
    <strong>DO:</strong>
    Only load functions etc. that you need and not the whole module.
  </div>

Global variables come before the `contains` statement.     
One use is defining global kinds in a module.     
All functions and subroutines MUST come after the `contains` statement.     
You MUST name the subroutine to end.      
Procedures in a module have implicit interfaces - don't need to write explicit ones.

<br></br>
<a name="21"></a>
## Compiling

````
gfortran -c mod_solvers.f90
gfortran -c my_main.f90
````
`-c` flag compiles but doesn't link files. Do main program and module separately. Then:

````
gfortran -o main my_main.o mod_solvers.o
````
## Different directory for Module Files

Use `-I` flag
````
gfortran -I../modfiles -c prog.f90
```` 

<br></br>
<a name="22"></a>
## Private and Public Data

Data permissions can be set to `public` or `private`:

```fortran
real, public :: x

integer      :: y
private      :: y
```

Set the module default:

```fortran
private
```

Modules that define classes should have the `private` default.

<br></br>
<a name="23"></a>
## Use Options

```fortran
use module
! use ONLY the procedures you need
use module, only my_func

! to rename and avoid namespace collision
use module, only this_func => my_func
```

<br></br>
<a name="3"></a>
# Multiple modules in an Archive File

Can store in archive file if they aren't changing often:

`ar cr my_lib.a obj1.o obj2.o obj3.o`

Creates a `.a` archive file with the 3 obj module files inside.

````
gfortran -o main.exe my_main.o my_lib.a
````