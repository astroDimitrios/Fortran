# Arrays

**COLUMN FIRST**

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