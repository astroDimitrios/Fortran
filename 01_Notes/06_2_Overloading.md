# Overloading

- [Overloading](#overloading)
  - [Procedure Overloading](#procedure-overloading)
  - [Operator Overloading](#operator-overloading)

## Procedure Overloading

```fortran
module my_f

interface f
    module procedure f_i  ! int version
    module procedure f_r  ! real version
end interface f

contains
    ... func definitions for f_i etc.
end module my_f
```

The function `f` can be used with integers or real values. The compiler will chose which to use when compiling. Full example on [wikibooks](https://en.wikibooks.org/wiki/Fortran/language_extensions).

Also consult the wikibook for overloading operators etc.

**FULL Example:** [hypcosh func](../06_Functions_Subroutines/Exercise2/Part1/hypcosh.f90)  
**ANOTHER Example:** [mean func](../09_Modules/Exercise3/my_stats.f90)

## Operator Overloading

```fortran
module my_asterik

    implicit none
    private
    public operator (*)

    interface operator (*)
        module procedure my_overload_procedure
    end interface

contains
    function my_overload_procedure(...)
        ...
    end function
end module
```

```fortran
program main

    use my_asterik
    implicit none

    ... use * as normal here

end program
```

Full example on [wikibooks](https://en.wikibooks.org/wiki/Fortran/language_extensions).
