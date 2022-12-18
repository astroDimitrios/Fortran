# Modules

- [Modules](#modules)
  - [Internal Functions and Subroutines](#internal-functions-and-subroutines)
  - [External Modules](#external-modules)
    - [Compiling](#compiling)
    - [Different directory for Module Files](#different-directory-for-module-files)
    - [Private and Public Data](#private-and-public-data)
    - [Use Options](#use-options)
  - [Multiple modules in an Archive File](#multiple-modules-in-an-archive-file)

**DO:** Put subroutines and functions in modules

## Internal Functions and Subroutines

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

## External Modules

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
use mod_solvers, only: solve_quadratic
implicit none
````

you can now call the function.

**DO:** Only load functions etc. that you need and not the whole module.

Global variables come before the `contains` statement.  
One use is defining global kinds in a module.  
All functions and subroutines MUST come after the `contains` statement.  
You MUST name the subroutine to end.  
Procedures in a module have implicit interfaces - don't need to write explicit ones.

### Compiling

````shell
gfortran -c mod_solvers.f90
gfortran -c my_main.f90
````

`-c` flag compiles but doesn't link files. Do main program and module separately. Then:

````shell
gfortran -o main my_main.o mod_solvers.o
````

### Different directory for Module Files

Use `-I` flag

````shell
gfortran -I../modfiles -c prog.f90
````

### Private and Public Data

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

### Use Options

```fortran
use module
! use ONLY the procedures you need
use module, only: my_func

! to rename and avoid namespace collision
use module, only: this_func => my_func
```

## Multiple modules in an Archive File

Can store in archive file if they aren't changing often:

`ar -cru my_lib.a obj1.o obj2.o obj3.o`

Creates a `.a` archive file with the 3 obj module files inside. From lrz course:

> c creates library archive if necessary , r replaces existing members of same name, u only does so if argument object is newer

````shell
gfortran -o main my_main.o my_lib.a
````
