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
! d. Change the DO loop to a FORALL . Check that your result is the same as before

! If you have access to a software package th at can plot text files, such as Python with Matplotlib ,
! plot your solution to the Laplace eq uation. Bear in mind that such packages generally use the end of line
! marker to determine the end of a row, so you will have to use formatted output.

program ex3

    implicit none

    ! Writing matrix properly to screen
    ! From - https://www.tutorialspoint.com.cach3.com/programming_example/hhj1FL/fortran-reshape-functions.html
    interface
        subroutine write_matrix(a)
            real, dimension(:,:) :: a
        end subroutine write_matrix
    end interface

    integer               :: i, j, rc, file_unit
    integer, parameter    :: N = 100
    real, parameter       :: dx = 0.1  ! ??????????????? unused
    real, dimension(N, N) :: x, x_prev

    x(:,1)   = 100
    x(:,2:N) = 0

    ! call write_matrix(x)

    do while (any(x /= x_prev))
        do j = 2, N-1
            do i = 2, N-1
                x(i,j) = 0.25*(x(i,j-1) + x(i,j+1) + x(i-1,j) + x(i+1,j))
            end do
        end do
        x_prev = x
    end do

    ! call write_matrix(x)

    open (file='ex3_data.csv', iostat=rc, newunit=file_unit)
    if (rc /= 0) stop 'Error: open failed'
    do i = 1, N
        write (file_unit, '(1x, *(g0, :, ", "))') x(i,:)
    end do
    close (file_unit)

end program

subroutine write_matrix(a)
    real, dimension(:,:) :: a
    write(*,*)
    
    do i = lbound(a,1), ubound(a,1)
       write(*,*) (a(i,j), j = lbound(a,2), ubound(a,2))
    end do
end subroutine write_matrix