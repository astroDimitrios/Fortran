# Derived Types

## Contents

1. [Derived Types](#1)
2. [Extending Types](#2)

<a name="1"></a>
# Derived Types

Define:

```fortran
! F2003 to use allocatables in derived types
! char(len(=*)) not allowed
TYPE grid
    INTEGER :: nx, ny, nz ! element
    REAL, ALLOCATABLE, DIMENSION(:) :: x, y, z
END TYPE grid
```

Construct:

```fortran
! construct
TYPE(grid) :: xyz_grid
! array of grid types
TYPE(grid), dimension(3) :: grids
```

Access Elements/Allocate:

```fortran
integer :: N

! access element
xyz_grid%nx = N

allocate(xyz_grid%x(N), xyz_grid%y(N), xyz_grid%z(N))
```

Code snippet [example](../8_Derived_Types/derived_types.f90).

## Example + Defaults

```fortran
type four_momentum
    real :: E = 0
    real, allocatable, dimension(:) :: p
end type four_momentum

type(four_momentum) :: particle

! particle = four_momentum()   ! all default
particle   = four_momentum(E=0)  ! set E but not p
particle%p = [0, 0, 0]         ! set p later
```
Note all default won't work above due to the allocatable `p` array. Code snippet from ex1 [here](../8_Derived_Types/Exercise1/ex1.f90).

<br></br>
<a name="2"></a>
# Extending Types

```fortran
type species
    character(len=20) :: genus_name
       character(len=20) :: species_name
end type species

type, extends(species) :: bird
    character(len=20) :: bird_name
end type bird
```

Code snippet [example](../8_Derived_Types/type_ext.f90).