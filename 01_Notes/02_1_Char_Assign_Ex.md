# Character Assignment Ex

Known length  
`character(len=5) :: a = 'Space'`

Length automatically calcualted
`character(*), parameter :: b = 'the final frontier!'`

Allocate length on assign  
`character(len=:), allocatable :: c`

Trim the extra whitespace

````fortran
character(len=20) :: space = 'Space'
trim(space)
````
