# Command Line Arguments

## Contents

1. [Basics](#1)
2. [Example](#2)

<a name="1"></a>
# Basics

Command line arguments are passed as:

`...$ program arg_1`

To obtain the number of arguments passed to the program:

```fortran
integer :: arg_count
arg_count = command_argument_count()
```

All arguments are passed as characters. The string you choose to hold it must be long enough. To get the argument:

```fortran
chracter(len=30) :: arg

call get_command_argument( number = 1, value = arg )
```

<br></br>
<a name="2"></a>
# Example

Unknown number of args until runtime:

```fortran
program cla_args_test  
    implicit none

    integer :: i
    integer :: num_args
    integer :: alloc_status, read_err

    character(len=50), allocatable :: args(:)

    num_args = command_argument_count()

    ! check if CLA/s passed
    if ( num_args == 0 ) then
        error stop "No CLA given"
    end if

    allocate( args(num_args), stat = alloc_status )

    ! check if allocation was successful
    if ( alloc_status > 0 ) then
        error stop "Allocation error"
    end if

    ! store CLA/s in args array
    do i = 1, num_args
        call get_command_argument(number = i, value = args(i))
    end do

end program cla_args_test
```

Full code in [cla_args_test.f90](../06_Functions_Subroutines/CLAs/cla_args_test.f90).

You can cast to a real like this:

```fortran
real :: r_num

! convert character CLA to real arg
read (args(1), '(f15.7)', iostat=read_err) r_num
if ( read_err /= 0 ) error stop 'Convert CLA to real fail'

write (*,*) r_num
```

Adapted from [Introduction to Programming using Fortran 95/2003/2008](http://www.egr.unlv.edu/~ed/fortran.html) by Ed Jorgensen.