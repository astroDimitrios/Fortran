# Notes

**[ex1](./Exercise1/ex1.f90)**
````
! print every third element
print *, x(1:N:3)
````

# Exercises

## ex1

Modified from original task.     
Original task solution in ***[ex1_2.f03](./Exercise1/ex1_2.f90)***     

! 1. Write a program that declares a real array of some particular size (N),       
!    using a parameter statement.     
! 2. (Initialize the array to zero.)     
!    Initialize the array with values from 1 to N.    
! 3. Read in an integer variable from a file.     
! 4. Test that the value is no greater than the (upper bound) max value of the array.      
!    If it is, exit with an error message. If it is not, loop from 1 to the     
!    input value, setting the I th array element to the cosine of the loop variable      
!    (remember to cast appropriately).      
! 5. Print out every 3rd element of the array so constructed.      

## ex2

! Use the Leibnitz formula to compute 𝜋      
! Compute until your result agrees to four decimal digits with the correct     
! value. This series converges      
! very slowly so this will still take a lot of iterations.      

## ex3

! (Advanced.) Write a program that solves Laplace's Equation ∇2=0 using a relaxation method. (If      
! you are not fa miliar with relaxation methods, consult any element ary te xt on numerical methods.)      
! a. Declare a two dimensional NxN array, where N is some reasonably large value (at least     
!    100 x100). Declare a real variable dx=0.1 . Set column 1 to 100 and all other values to 0.     
!    Use array and subarray operations for this purpose. Add a DO loop over I and J such that     
!    A(I,J) = 0.25*(A(I,J 1) + A(I,J+1) + A(I 1,J) + A(I+1,J))     
! b. Be sure to pay attention to the loop bounds (that is, do not try to access an element of the array     
!    that is outside of its declared size).     
! c. Add an outer loop that performs the inner loop repeatedly. Test whether for all elements of A,      
!    the value at the end of the loop is the same as (to the limits of floating point precision) the value     
!    at the beginning of the loop. If this is true, exit from the loop. ( Hint: you can introduce    
!    another array.) Print the result to a file in row major order.     
! d. Change the DO loop to a FORALL . Check that your result is the same as before.     

! If you have access to a software package th at can plot text files, such as Python with Matplotlib ,       
! plot your solution to the Laplace eq uation. Bear in mind that such packages generally use the end of line     
! marker to determine the end of a row, so you will have to use formatted output.     