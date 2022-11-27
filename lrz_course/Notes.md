Continuation line `&`
````
write(*,*) &
'Hello'
````

Variables must start with letter
Letters, numbers and _ only


### Strongly Typed
`implicit none`   
so that the compiler doesn't imply the type of a variable

# Block Construct

Provides local scope to declare variables in, can access vars in parent scope. 

````
integer i
inner: block
  integer j ! A local integer
  integer i ! Another i, not good practice
end block inner
````

Finalises local variables at end of block.
Can use `exit <name>` within a block.

# Functions etc - SAVE

Saves a variable between calls of a function or subroutine to be used in the next call. Example in ***lrz_course/save.f90***.

DO NOT initialise and declare a variable at the same time in function or subroutine. This will IMPLICITLY save the variable between function calls. (http://www.cs.rpi.edu/~szymansk/OOF90/bugs.html#4)

# Functions and Sub

- DO put subroutine in module program unit, (or internal subprogram)

## Function module

````
module mod_solvers
    implicit none
contains
    subroutine solve_quadratic (a, b, c)
        <code>
    end subroutine solve_quadratic
! more subroutines below
end module mod_solvers
````

then in main program:

````
use mod_solvers
implicit none
````
you can now call the function.

### Compiling

````
gfortran -c -o mod_solvers.o mod_solvers.f90
gfortran -c -o my_main.o my_main.f90
````
`-c` flag compiles but doesn't link files. Do main program and module separately. Then:

````
gfortran -o main.exe my_main.o mod_solvers.o
````
### Different directory for Module files

Use `-I` flag
````
gfortran -I../modfiles -c prog.f90
```` 

### Multiple modules in an archive file

Can store in archive file if they aren't changing often:

`ar cr my_lib.a obj1.o obj2.o obj3.o`

Creates a `.a` archive file with the 3 obj module files inside.

````
gfortran -o main.exe my_main.o my_lib.a
````

# Function intents

`in` do NOT modify    
`inout` argument MUST be passed as a variable when the function is called    
`out` must be a variable, it's undefined when function starts

# Function result()

Can also use function `result()` so that the declaration and type of the result are declared separately and don't have to be same as function name:

````
function poly_3(x, p) result(res)
    real, intent(in) :: x, p
    real :: res
    ...
    res = ...
end function poly_3 
````

MUST use for recursive functions.     
Also useful when the function has a long name.

# Optional Fucntion Args

`real, intent (in), optional :: p`    
Check if passed using `present(p)`:      
````
if (present(p)) then
    ...
else
    ...
end if
````

# Keyword Function Args

Eg inside an interface you have:     
`SUBROUTINE axis(x0,y0,l,min,max,i)`

Then axis can be invoked as:

- Positional args     
  `CALL AXIS(0.0,0.0,100.0,0.1,1.0,10)`
- Keyword args    
  `CALL AXIS(0.0,0.0,Max=1.0,Min=0.1,L=100.0,I=10)`

No positional args after keyword. Notice keyword args can be specified in any order. Use for readability.

# Passing Args as Values

Pass an argument as a value instead of a variable. Modifications made to local copy NOT to original variable. See example in ***lrz_course/value.f90***.

> If the VALUE attribute is specified, the PARAMETER, EXTERNAL, POINTER, ALLOCATABLE, DIMENSION, INTENT(INOUT), or INTENT(OUT) attributes cannot be specified.
>
>[Lahey Computer Systems Inc.](http://www.lahey.com/docs/lfpro79help/F95ARValueStmt.htm)

**NOTE**: Can be faster than passing variables by reference (normal way). See stackoverflow [here](https://stackoverflow.com/questions/65311855/fortran-recursion-speed-pass-by-reference-vs-pass-by-value).

# Passing functions as arguments

[Stackoverflow Link](https://stackoverflow.com/questions/32809769/how-to-pass-subroutine-names-as-arguments-in-fortran)

Example in ***lrz_course/run_my_maths.90*** which uses a subroutine in ***my_maths.90*** that accepts a function as an argumnet. Function is provided by module ***my_powers.f90***.

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

# Recursive Function

Use `recursive` attribute:

`recursive function fib(i) result(f)`

MUST use `result()`.

> In Fortran 2018, the specs changed again. Here procedures without an explicit recursive attribute behave as if recursive is specified. F2018 provides a new attribute non_recursive, which can be used to mark a procedure that may not be called recursively.
>
> [craftofcoding](https://craftofcoding.wordpress.com/2021/03/15/recursion-fortran-finally-gets-it/)

# Internal funcs and subs

````
subroutine process_x(...)
    real :: a = 10, z
    z = slide(2,3) ! invoke in host 
    ...
contains
    ! internal function
    real function slide(x, y)
        ...
        slide = a ! accessed by host association
    end function slide
    ! internal subroutine
    subroutine fake(...)
        ...
        slide(3, 4) ! accessed by host association
    end subroutine fake
end subroutine process_x
````

Internal procedures can only be called from within the host. An interface is automatically created. If the internal procedure is only a few statemnets then it is inlined by the compiler which avoids procedure call overhead.

# PURE function

Cannot change state of the program.

````
PURE FUNCTION DOUBLE(X)
  REAL, INTENT(IN) :: X
  DOUBLE = 2 * X
END FUNCTION DOUBLE
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