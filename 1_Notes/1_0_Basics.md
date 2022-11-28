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

````fortran
PROGRAM test
END PROGRAM test
````

Strongly typed         
`implicit none`        
Stops i-m used as integers, the compiler doesn't imply the type of a variable

`! THIS IS A COMMENT `

- Starts counting at **1 !!!!!**
- 80 char line length     
- Continuation line `&`
````fortran
write(*,*) &
'Hello'
```` 
- Sep multiple statements with `;`    
- use statements first, then `implicit none`, then declarations  
- Case INsensitive
- Fortran passes variables by reference (pointer to memory locations), can inadvertantly alter variables if not carefull       
- DO NOT have function names which are the same as module or program names

<br></br>
<a name="2"></a>
# Declaring Types

Examples:

````fortran
1
1. (real sing. precision)
1d0         
1.2d-11
(1.0, 1.0) Complex

! String
'Here"s a String.'

! Logical (Boolean)
.true. 
.false.
````

<br></br>
<a name="3"></a>
# Declaring Variables

`INTEGER :: i = 2, j`

Fixed value (unchangeable)
`INTEGER , PARAMETER :: i = 2`

`COMPLEX :: d = (1.0, 2.0)`

Characters of max len 
`CHARACTER(LEN=16) :: a`

`LOGICAL :: l, flag = .false.`

Array of 100 1s
`REAL, DIMENSION(100) :: ra = (/100*1.0)/`

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
````fortran
INTEGER, PARAMETER :: sp = SELECTED_REAL_KIND(6, 37)
integer, parameter :: dp = selected_real_kind(15,307)
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
real(sp)      :: x = 1.
````

Using above these give:

`epsilon(x)` - 1.19209290E-07, effectively negligible no in x number model     
`huge(x)` - 3.40282347E+38, largest number    
`tiny(x)` - 1.17549435E-38, smallest number            

<a name="51"></a>
## TIPS

- AVOID - Converting from higher to lower precision type
- DO - Assign high precision constants
- AVOID overflow, check with `huge` and `tiny` (underflow) etc
    ````fortran
    if (abs(k) <= huge(i)) then
        i = k
    else
        error stop 'Overflow'
    end if
    ````
- DO - use `nint(x)` for real-to-integer conversion (nearest integer instead of round towards 0)