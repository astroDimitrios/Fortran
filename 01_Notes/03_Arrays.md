# Arrays

1. [Basics](#1)
2. [Intrinsic Functions](#2)

<a name="1"></a>
# Basics

**COLUMN FIRST** ordering    
Excellent article on [memory layout](https://eli.thegreenplace.net/2015/memory-layout-of-multi-dimensional-arrays).


There is more on arrays in the [07 Memory Management](./07_Memory_Management.md) section.

## Declaration    

```fortran
integer, dimension(100, 100) :: a   
! Preferred:     
integer :: a(100, 100)
```

## Construction

`v = [ 1, 2, 3 ]`

Implied DO loop    
`iv = [( i, i = 1, 9 )]`

Column first order    
`b = reshape( iv, [3, 3] )`    
Row first order     
`b = reshape( iv, [3, 3], order = [2, 1] )`

<br></br>
<a name="2"></a>
## Intrinsic Functions

```fortran
lbound(array [, dim])   ! l bound along all or 1 dimension
ubound(array [, dim])   ! u bound "

shape(array)            ! array with shape

size(array [, dim])     ! scalar size of array
```

```fortran
! all below can take optional dimension
all(mask)
any(mask)
count(mask)   ! number of true from mask

! all below can take optional mask
maxval(array) ! max val
minval(array) ! min val
product(array)
sum(array)
```

```fortran
! all take dim, mask, back
! if back = .true. last location returned
maxloc(array)
minloc(array)
findloc(array, value)
```

### Pack and Unpack

Pack converts array to rank 1 array.

> pack (array, mask [, vector] )
> unpack (vector, mask, field)

```fortran
integer :: c(3,3) = reshape([0,3,2,4,3,2,5,1,2], shape(c))
integer :: cc(9)  = -1
write(*,'(3i3)') c      ! writes 0 3 2
                        !        4 3 2
                        !        5 1 2
write(*,*) pack(c, mask=(c > 2))
                        ! writes 3 4 3 5
write(*,*) pack(c, mask=(c > 2), vector=cc)
                        ! writes 3 4 3 5 -1 -1 -1 -1 -1
write(*,*) pack(c, .true.) 
                        ! writes 0 3 2 4 3 2 5 1 2
```
```fortran
integer, dimension(9) :: c = [0,3,2,4,3,2,5,1,2]
logical :: d(2,2)
integer :: e(2,2)
d = reshape([.false., .true., .true., .false.], shape(d))
e = unpack(c, mask = d, field = -1)
write(*,'(2i3)') e ! writes -1  0
                   !         3 -1
```

Taken from [lahey.com](http://www.lahey.com/docs/lfpro79help/F95ARPACKFn.htm).