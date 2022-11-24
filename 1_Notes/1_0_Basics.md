# Fortran


````
PROGRAM test
END PROGRAM test
````

`IMPLICIT NONE`
Stops i-m used as integers

`STOP`
Stop execution

`! THIS IS A COMMENT `

80 char line length
Overflow use `&`    
Sep multiple statements with `;`    
ALL declarations before anything else    
Case INsensitive

## Declaring Types

Examples:

````
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

## Declaring Variables

`INTEGER :: i = 2, j`

Fixed value (unchangeable)
`INTEGER , PARAMETER :: i = 2`

`COMPLEX :: d = (1.0, 2.0)`

Characters of max len 
`CHARACTER(LEN=16) :: a`

`LOGICAL :: l, flag = .false.`

Array of 100 1s
`REAL, DIMENSION(100) :: ra = (/100*1.0)/`

## Precision
````
INTEGER, PARAMETER :: sp = SELECTED_REAL_KIND(6, 37)
integer, parameter :: dp = selected_real_kind(15,307)
real(dp) :: a
````

Or (Fortran 2008)

````
use, intrinsic :: iso_fortran_env
integer, parameter :: sp = REAL32
integer, parameter :: dp = REAL64
integer, parameter :: qp = REAL128
````
From <https://fortranwiki.org/fortran/show/Real+precision> 