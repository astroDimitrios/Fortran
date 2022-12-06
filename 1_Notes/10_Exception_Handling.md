# Exception Handling

## Contents

1. [IEEE Standard](#1)
2. [IEEE Arithmetic](#2)
3. [IEEE Exceptions](#3)
    1. [Ex: Divide by Zero](#31)
    2. [Ex: Overflow](#32)

<a name="1"></a>
# IEEE Standard

IEEE Standard for dealing with floating point exceptions.

Load via 3 main modules:

- `ieee_exceptions`
- `ieee_arithmetic` - will also load `ieee_excpetions`
- `ieee_features` - requests IEEE features see [here](https://www.nag.com/nagware/np/r70_doc/ieee_features.html)

Use as:

```fortran
! intrinsic to load standard module not one we wrote
use, intrinsic :: ieee_features, only: ieee_underflow_flag
```

**Needs gfortran5 or ifort to compile with IEEE exceptions.** 

<br></br>
<a name="2"></a>
# IEEE Arithmetic

Test if variables can support certain values and other inquiry functions:

```fortran
ieee_is_finite(x) ! determine if a value is finite (not Inf)
ieee_is_nan(x)    ! determine if a value is IEEE NaN
```

From [fortranwiki.org](https://fortranwiki.org/fortran/show/ieee_arithmetic).

**Example:** Setting value to IEEE Inf if it is supported in [my_shape_stats.f90](../9_Modules/Exercise2/my_shape_stats.f90).

<br></br>
<a name="3"></a>
# IEEE Exceptions

Excpetion flags for detecting division by zero and other floating point exceptions.     
If a flag is raised the program can be halted (stopped).

See [here](https://www.nag.com/nagware/np/r70_doc/ieee_exceptions.html) for more.

<br></br>
<a name="31"></a>
## Example: Division by Zero

As in [ex2](../6_Functions_Subroutines/Exercise2/Part2/ex2_2.f90)

```fortran
subroutine check_divide_zero( x, y )
    use :: ieee_exceptions, only: ieee_set_flag, &
                                  ieee_get_flag, &
                                  ieee_divide_by_zero

    implicit none

        real, intent (in)  :: x, y
        real               :: check
        logical            :: flag

        flag = .false.

        call ieee_set_flag(ieee_divide_by_zero, .false.)
        check = x / y
        call ieee_get_flag(ieee_divide_by_zero, flag)

        ! Could stop the program
        ! if (flag) error stop 'Warning!  Division by zero detected'
        ! or continue
        if (flag) write (*,*) 'Warning!  Division by zero detected'

end subroutine check_divide_zero
```

This does NOT stop the program if a division by zero is detected (although there is commented code that would).

Note that `exit` is non-standard whereas `stop` (termination of program), and `error stop` are.

rosettacode full [divide by zero check](https://rosettacode.org/wiki/Detect_division_by_zero#Fortran)

<br></br>
<a name="32"></a>
## Example: Overflow

From the Holcombe pdf.

```fortran
program test_ieee

    use ieee_exceptions
    ! ieee_overflow and ieee_divide_by_zero are in ieee_exceptions
    implicit none

    type(ieee_flag_type), parameter :: overflow = ieee_overflow
    logical :: flag

    real    :: x, y

    call ieee_set_halting_mode( overflow, .false. )
    ! In a real code this would come from someplace other than explicit setting
    ! Whether to stop the code if the flag is raised

    x = 1.e12
    y = exp(x)
    
    ! call get_flag sets flag to true
    call ieee_get_flag( overflow, flag )
    if ( flag ) then
        print *, 'Overflow, setting to maximum'
        call ieee_set_flag( overflow, .false. ) ! reset flag to false
        y = huge(x)
        print *, 'Largest value ', y
    else
        print *, 'Computed e^x ', y
    endif

end program test_ieee
```