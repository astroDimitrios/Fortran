# Memory Management

## Contents

1. [Allocatable Arrays](#1)
    1. [Assumed Shape and Automatic Arrays](#11)
2. [Pointers](#2)

<a name="1"></a>
# Allocatable Arrays

Size of array determined at runtime.    
Must declare rank of array.

1. Allows routines to run with different size arrays
2. Allows the array to be removed from memory when not in use

```fortran
! Allocatable Arrays
real, dimension(:,:), allocatable :: a
real, allocatable :: b(:,:) ! preferred
```

Allocate, test for allocation, and deallocate:

```fortran
integer :: n = 10, m = 10

! allocate(a(n,m))
allocate( a(n,m), b(n,m) )

if (.not. allocated(a)) then
    allocate( a(n,m) )
end if

! deallocate(a)
deallocate( a, b )
```

<a name="11"></a>
## Assumed Shape and Automatic Array

Useful in subroutines where the size of the array is not known:

```fortran
subroutine poisson(x)
    ! Assumes shape of x
    real, intent (inout) :: x(:,:)
    ! Automatic array + assumed shape
    real                 :: x_prev( size(x, 1), size(x, 2) )
```

Can also pass the shape parameters to the function/subroutine.

Code snippet [example](../7_Memory_Manage/alloc_arrays.f90).

<br></br>
<a name="2"></a>
# Pointers

Points to a target:

```fortran
real, pointer :: p, q
real, target  :: x, y

! avoid undefined pointers
real, pointer :: a(:,:) => null()

x = 10.0
y = 5.0

! Assign pointer to target
p => x
q => y

print *, 'p = ', p
print *, 'q = ', q

p = q ! same as x = y
print *, 'p = ', p
```

Test if associated:

```fortran
if ( .not. associated(p) ) p => x
! to a specific variable
if ( .not. associated(p, x) ) p => x
```

Can be allocated:

```fortran
integer :: n = 10, m = 10
real, pointer :: a(:,:) => null()

allocate( a(n,m) )
deallocate(a)
```

Disassociate pointer from target:

```fortran
nullify(p)
```

Associate and disassociate on same level ie. both in same subroutine.    
`nullify()` does not deallocate if also allocated.

Code snippet [example](../7_Memory_Manage/pointers.f90).