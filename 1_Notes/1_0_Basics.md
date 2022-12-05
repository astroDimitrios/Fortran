# Fortran


## Contents

1. [Introduction](#1)
2. [Declaring Types](#2)
3. [Declaring Variables](#3)
4. [Block Construct](#4)
5. [Precision](#5)
    1. [Precision Tips](#51)

<a name="1"></a>
# Introduction

Strongly typed. Basic program:

````fortran
program test
end program test
````
<div style="color: black; background-color:rgba(73, 190, 37, 1); text-align:left; vertical-align: middle; padding: .3em; margin: .5em;">
    <strong>DO:</strong>
    Have filenames which are the same as the program/module name.
    
    eg. test.f90 to contain the code above
</div>

- use statements come first, then `implicit none`, then declarations of variables.
- `implicit none`        
Stops i-m used as integers, the compiler doesn't imply the type of a variable.
  <div style="color: black; background-color:rgba(37, 150, 190, 1); text-align:left; vertical-align: middle; padding: .3em; margin: .5em;">
    <strong>DO:</strong>
    Use implicit none in all functions, subroutines, modules, and programs. 
  </div>
  <div style="color: black; background-color:rgba(255, 76, 48, 1); text-align:left; vertical-align: middle; padding: .3em; margin: .5em;">
    <strong>DO NOT:</strong>
  Have function names which are the same as module or program names.
  </div>
- `! Comment `
- Index starts at **1 !**
- 80 character line length.     
- Continuation line `&`
````fortran
write (*,*) &
'Hello'
````   
- Case ***insensitive***, use lower case
- Fortran passes variables ***by reference*** (pointer to memory locations), you can inadvertantly alter variables if not carefull.       

<br></br>
<a name="2"></a>
# Declaring Types

Examples:

````fortran
1
1.0 ! real, STYLE: NOT 1.
1d0         
1.2d-11
( 1.0, 1.0 ) ! complex

! String
'Here"s a String.'

! Logical (Boolean)
.true. 
.false.
````

<br></br>
<a name="3"></a>
# Declaring Variables

`integer :: i = 2, j`

Fixed value (unchangeable)    
`integer, parameter :: i = 2`

`complex :: d = ( 1.0, 2.0 )`

Characters of max len    
`character(len=16) :: a`

`logical :: flag = .false.`

Array of 100 1s    
`real :: ra(100) = [ 100 * 1.0 ]`

- Variables must start with letter
- Letters, numbers and _ only

<br></br>
<a name="4"></a>
# Block Construct

Provides local scope to declare variables in, can access vars in parent scope. 

````fortran
integer i
inner: block
  integer j ! A local integer
  integer i ! Another i, not good practice
end block inner
````

Finalises local variables at end of block.
Can use `exit <name>` within a block.

<br></br>
<a name="5"></a>
# Precision

***Default precision*** for real is usually ***single***.

- Avoid using compiler flags to set default precision, use kinds.
- Avoid mixing types in arithmetic.
- Set dp constants with `3.14d0` not just `3.14 ! single precision`.

**GOOD Practice:** See [constants_mod.f90](../9_Modules/Exercise3/constants_mod.f90)

````fortran
integer, parameter :: sp = selected_real_kind( 6, 37 )
integer, parameter :: dp = selected_real_kind( 15, 307 )
real(dp) :: a
````

Or (Fortran 2008)

````fortran
use, intrinsic :: iso_fortran_env
integer, parameter :: sp = REAL32
integer, parameter :: dp = REAL64
integer, parameter :: qp = REAL128
````
From [fortranwiki.org](<https://fortranwiki.org/fortran/show/Real+precision>)

Care with floats:

````fortran
use, intrinsic :: iso_fortran_env
implicit none

integer, parameter :: sp = REAL32
real(sp)      :: x = 1.0
real          :: y
y = 1.0_sp
````

Using above these give:

`epsilon(x)` - 1.19209290E-07, effectively negligible no in x number model     
`huge(x)` - 3.40282347E+38, largest number    
`tiny(x)` - 1.17549435E-38, smallest number         

```fortran
real(x, sp) ! converts to the kind sp (single precision)
real(x, dp) ! converts to the kind dp (double precision)
```

<a name="51"></a>
## TIPS

- AVOID - Converting from higher to lower precision type
- DO - Assign high precision constants
- AVOID - Overflow etc, check with `huge` and `tiny` (underflow) etc
    ````fortran
    if ( abs(k) <= huge(i) ) then
        i = k
    else
        error stop 'Overflow'
    end if
    ````
- DO - Use `nint(x)` for real-to-integer conversion (nearest integer instead of round towards 0)
- DO - Ensure all real values have the correct kind declared
- WARNING - Always check your assigning variables otherwise:
    ```fortran
    real :: y
    print *, y
    ! gfortran prints 4.56472975E-41
    ! ifort prints 0
    ```
  Compiler dependent behaviour!!!! Some will just access whatever is in memory at that location.