# Parameterised Derived Types

F2003

- [Parameterised Derived Types](#parameterised-derived-types)
  - [Basics](#basics)
  - [Assumed and Deffered Lengths](#assumed-and-deffered-lengths)
  - [Extending PD Types](#extending-pd-types)

## Basics

Example code in [pdt_test.f90](../12_lrz_course/PDT/pdt_test.f90).  
PDTs are created by passing parameters to the type declaration:

```fortran
! nD momentum vector of type kind
type :: xD_momentum( k, p )
    integer, kind :: k
    integer, len  :: p = 1 ! default len of array
    real(kind=k)  :: momentum(p)
end type xD_momentum
```

An instance can then be initialised as such:

```fortran
integer, parameter :: sp = selected_real_kind( 6, 37 )
integer, parameter :: dp = selected_real_kind( 15, 307 )

type(xD_momentum( sp ))        :: particle_sp_1D  ! uses default p = 1 
type(xD_momentum( dp, p = 2 )) :: particle_dp_2D
```

## Assumed and Deffered Lengths

Kinds can not be assumed or deffered. To allow a function to call the correct version of a subroutine for the kind use an interface as in [Procedure Overloading](./06_2_Overloading.md).

```fortran
    ! deferred p value using allocatable
    ! may ONLY be used with allocatables and pointers
    type(xD_momentum( dp, : )), allocatable :: particle_dp_3D

    call assumed_len_param(particle_dp_2D)
    call create_3D_momentum(particle_dp_3D)

contains

    ! assumed length parameter
    ! kind may NOT be assumed
    subroutine assumed_len_param(m)
        type(xD_momentum( dp, * )) :: m
        print *, m%p
    end subroutine assumed_len_param

    subroutine create_3D_momentum(m)
        type(xD_momentum( dp, : )), allocatable, intent(out) :: m
        allocate(xD_momentum( dp, 3 ) :: m)
    end subroutine create_3D_momentum
```

## Extending PD Types

```fortran
type, extends(xD_momentum) :: ball
    real(kind=k) :: mass ! kg
end type ball

! initialised using base class parameters
type(ball( dp, 3 )) :: ball_1
ball_1%mass = 1.2_dp
```

Further reading:

- OOP Part 3: [pgroup.com](https://www.pgroup.com/blogs/posts/f03-oop-part3.htm)
- Fortran PDTs: [qmul.ac.uk](https://blog.hpc.qmul.ac.uk/fortran-parameterized-derived-types-1.html)
