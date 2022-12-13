# Input and Output

## Contents

1. [Basics](#1)
2. [Example Write](#2)
3. [Internal I/O](#3)
4. [Formatting](#4)


Writing Files - ***[4_Input_and_Output/ex1.f90](../04_Input_and_Output/ex1.f90)***      
Reading Files - ***[4_Input_and_Output/ex2.f90](../04_Input_and_Output/ex2.f90)***     
Reading Namelists - ***[4_Input_and_Output/ex2.f90](../04_Input_and_Output/ex2.f90)***

**DO:** Always define the action when opening files using `open()`

<a name="1"></a>
# Basics

`print *, A`   
Or    
`write (*,*) A`

First `*` indicates num identifier of file. The `*` will print to standard out (terminal for instance). THe Second `*` in `write` is the format declaration.

## Basic Terminal Read

````fortran
print *, 'Enter a value:'
read *, A
````

## Using Intrinisc Fortran Module

```fortran
use, intrinsic :: iso_fortran_env
write(output_unit, ...)
read(input_unit, ...)
```
From lrz course.

<br></br>
<a name="2"></a>
# Example: Write

F2008 - Use a file unit variable to keep track of the file. Each file must have a unique file unit.

```fortran
integer :: rc
integer :: file_unit

! note error checking, rc is + if error
open (action='write', file='ex1_data.dat', iostat=rc, newunit=file_unit)
if (rc /= 0) stop 'Error: open failed' 
write (file_unit, *) 'Yay'
close (file_unit)
```

The `*` in write specifies the default format. See below for more formatting.

<br></br>
<a name="3"></a>
# Internal I/O

Allows casting from int, real to char to control output:

```fortran
character(len=15) :: str_height
real              :: height = 4.76

! cast float to string
write (str_height, '(ES15.7)') height
! remove whitespace and align left
write (*, '(a)') adjustl( trim(str_height) )
```

Can also be used to create format dynamically at runtime.

<br></br>
<a name="4"></a>
# Print Formatting

`print '( 5x, I5/5x, I4 )', A, B`    
Skip 5 spaces, print integer    
New line

````fortran
print 10, i, a
10 format ( I5, 5F15.5 )

read ( 22, fmt=100 ) c1, c2
100 format (A)
````

The format can be repeated:
`'(2(I5, 1x))'`

# Number Formatting

`nTw.d`

`n` - Number of times to repeat pattern (assumed 1)    
`T` - type (I, F, A (char), L, G etc)    
`w` - whitespace including spaces and decimal point     
`d` - number of decimal places

`Ew.den`     
where `en` is the number of digits in exponent    
not needed for 3 or less

`ES` for standard scientific notation