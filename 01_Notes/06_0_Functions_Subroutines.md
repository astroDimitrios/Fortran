# Functions and Subroutines

## Contents

1. [Basic Functions](#1)
    1. [Function result()](#11)
2. [Subroutines](#2)
3. [intent()](#3)
4. [Explicit Interface](#4)
5. [Argument Options](#5)
    1. [Optional Args](#51)
    2. [Keyword Args](#52)
    3. [Passing Args as Values](#53)
    4. [Functions as Args](#54)
6. [Recursive Functions](#6)
7. [SAVE ing variables !WARNING](#7)
8. [Pure Functions](#8)
    1. [Elemental Functions](#81)

<a name="1"></a>
# Functions

Declare type to be returned. This can also be done on first line of function.       
Return value is name of the function.

````fortran
real function myfunc(x)
    real, intent(in) :: x
    
    myfunc = x**2
end function myfunc
````

<a name="11"></a>
## Function result()

Can also use function `result()` so that the declaration and type of the result are declared separately and don't have to be same as function name:

````fortran
function poly_3( x, p ) result(res)
    real, intent(in) :: x, p
    real :: res
    ...
    res = ...
end function poly_3 
````

MUST use for recursive functions.     
Also useful when the function has a long name.

<a name="2"></a>
# Subroutines

````fortran
call subroutine square(x)
call subroutine square(xx, p=pp)
````
````fortran
subroutine square( x, p )
    integer, intent (in)        :: x
    real, optional, intent (in) :: p

    if ( present(p) ) then 
        print *, 'No'
    end if

    square = x**2
end subroutine square
````

<a name="3"></a>
# intent ()

`in` do NOT modify    
`inout` argument MUST be passed as a variable when the function is called    
`out` must be a variable, it's undefined when function starts

<div style="color: black; background-color:rgba(37, 150, 190, 1); text-align:left; vertical-align: middle; padding: .3em; margin: .5em;">
    <strong>DO:</strong>
    Declare an arguments intent. 
  </div>

<br></br>
<a name="4"></a>
# Explicit Interface

**DO** create explicit interfaces (slightly different if procedures are contained in modules)

````fortran
interface
    subroutine square( x, p )
        integer, intent (in)        :: x
        real, optional, intent (in) :: p
    end subroutine square
end interface
````

Call in main program     
The full subroutine after `end program`    
The interface in main code after `implicit none`     

Compiler does extra checks.

If subroutines and functions are declared after a `contains` statement in the main program (before `end program`) an explicit interface is not needed.

<br></br>
<a name="5"></a>
# Argument Options

<a name="51"></a>
## Optional Fucntion Args

`real, intent (in), optional :: p`    
Check if passed using `present(p)`:      
````fortran
if ( present(p) ) then
    ...
else
    ...
end if
````

<br></br>
<a name="52"></a>
## Keyword Function Args

Eg inside an interface you have:     
`subroutine axis( x0, y0, l, min, max, i )`

Then axis can be invoked as:

- Positional args     
  `call axis( 0.0, 0.0, 100.0, 0.1, 1.0, 10 )`
- Keyword args    
  `call axis( 0.0, 0.0, max=1.0, min=0.1, l=100.0, i=10 )`

No positional args after keyword. Notice keyword args can be specified in any order. Use for readability.

<br></br>
<a name="53"></a>
## Passing Args as Values

Pass an argument as a value instead of a variable. Modifications made to local copy NOT to original variable. See example in ***[lrz_course/value.f90](../lrz_course/value.f90)***.

```fortran
function f(x)
integer, value :: x
```

> If the VALUE attribute is specified, the PARAMETER, EXTERNAL, POINTER, ALLOCATABLE, DIMENSION, INTENT(INOUT), or INTENT(OUT) attributes cannot be specified.
>
>[Lahey Computer Systems Inc.](http://www.lahey.com/docs/lfpro79help/F95ARValueStmt.htm)

**NOTE**: Can be faster than passing variables by reference (normal way). See [here](https://stackoverflow.com/questions/65311855/fortran-recursion-speed-pass-by-reference-vs-pass-by-value) for more.

<br></br>
<a name="54"></a>
## Passing Functions as Arguments

Usefull [Stackoverflow link](https://stackoverflow.com/questions/32809769/how-to-pass-subroutine-names-as-arguments-in-fortran).

Example in ***[lrz_course/run_my_maths.90](../lrz_course/run_my_maths.f90)*** which uses a subroutine in ***[my_maths.90](../lrz_course/my_maths.f90)*** that accepts a function as an argumnet. Function is provided by module ***[my_powers.f90](../lrz_course/my_powers.f90)***.

To test use:

```
gfortran -c my_maths.f90 my_powers.f90
gfortran -c run_my_maths.f90
gfortran -o run_my_maths run_my_maths.o my_maths.o my_powers.o
run_my_maths
```
Output:
```
25.0000000    
125.000000
```

<a name="6"></a>
# Recursive Function

Use `recursive` attribute:

`recursive function fib(i) result(f)`

MUST use `result()`.

> In Fortran 2018, the specs changed again. Here procedures without an explicit recursive attribute behave as if recursive is specified. F2018 provides a new attribute non_recursive, which can be used to mark a procedure that may not be called recursively.
>
> [craftofcoding](https://craftofcoding.wordpress.com/2021/03/15/recursion-fortran-finally-gets-it/)

<br></br>
<a name="7"></a>
# SAVE variables !WARNING

Saves a variable between calls of a function or subroutine to be used in the next call. Example in ***[lrz_course/save.f90](../lrz_course/save.f90)***.

DO NOT initialise and declare a variable at the same time in function or subroutine. This will IMPLICITLY save the variable between function calls. For more see [cs.rpi.edu](http://www.cs.rpi.edu/~szymansk/OOF90/bugs.html#4).

<br></br>
<a name="8"></a>
# PURE functions

Cannot change state of the program.

````fortran
pure function double(x)
  real, intent(in) :: x

  double = 2 * x
end function double
````
[Snippet Source](https://www.cita.utoronto.ca/~merz/intel_f10b/main_for/mergedProjects/lref_for/source_files/rfpure.htm)

>  They must be side effect free, this means:
>- no external I/O or ALLOCATE,
>- don't change global program state (global data),
>- have PURE attribute,
>- intrinsic / ELEMENTAL functions are pure,
>- allowed in FORALL and pure procedures,
>
>...
>
>- FUNCTION dummy arguments must possess the INTENT(IN) attribute, SUBROUTINE dummys not restricted,
>- local objects cannot be SAVE d,
>- dummy arguments cannot be aligned to global objects,
>- no PAUSE or STOP statement,
>- other procedure invocations must be PURE. 
>
>To make things simple, PURE functions must behave like mathematical functions in the sense that their arguments cannot be changes (must have INTENT(IN)). 
>
>[Adam Marshal Liverpool Uni](https://www4.cs.fau.de/Lehre/WS97/V_PPS/fortran/HTMLNotesnode232.html)

<br></br>
<a name="81"></a>
# Elemental functions

A function that operates element wise on an array. Must be PURE. Requires an output type to be declared but no dimension is required declaring the array sizes.

```fortran
elemental function add_2(x)
    real, intent (in) :: x
    real              :: add_2

    add_2 = x + 2
end function add_2
```