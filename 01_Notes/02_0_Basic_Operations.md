# Basic Operations

- [Basic Operations](#basic-operations)
  - [Maths](#maths)
  - [Character](#character)
  - [Logic](#logic)
  - [Relations](#relations)
  - [Constants](#constants)

## Maths

`+ - * /`  

**NOTE:** Dividing an array elementwise by a real is more expensive than multiplying than the inverse of the real which is computed beforehand.

## Character

`//` Concatenation

Slicing
`word(i:j)`  
**Including j!!!! (Starting index at 1 default)**

## Logic

````fortran
.not.
.and.
.or.
.eqv.
.neqv.
````

In order of precedence (eqv and neqv same).

## Relations

````fortran
== ! .EQ.
/= ! .NE.
<  ! .LT.
>  ! .GT.
<= ! .LE.
>= ! .GE.
````

## Constants

> e          ! Not available. Can be calculated exp(1.0)  
> pi         ! Not available. Can be calculated 4.0*atan(1.0)

or in the double precision form:

> exp(1D0)  
>
> [rosettacode.org](https://rosettacode.org/wiki/Real_constants_and_functions#Fortran)

OR store in a constants module as shown [here](../09_Modules/Exercise3/constants_mod.f90).
