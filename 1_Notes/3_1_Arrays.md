# Arrays

Declaration    
`integer, dimension(100, 100) :: A`

COLUMN FIRST

Construction

`V = [ 1, 2, 3 ]`

Implied DO loop    
`IV = [( i, i = 1, 9)]`

Column first order    
`B = reshape( IV, (/3, 3/))`    
Row first order     
`B = reshape( IV, (/3, 3/), order = (/2, 1/))`