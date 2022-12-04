! Write a program that declares three arrays, multiplies two of them and stores the result into the third.
! The arrays may be of any appropriate size and initialized in any manner.

program ex2

    implicit none

    ! Writing matrix properly to screen
    ! From - https://www.tutorialspoint.com.cach3.com/programming_example/hhj1FL/fortran-reshape-functions.html
    interface
        subroutine write_matrix(x)
            real, dimension(:,:) :: x
        end subroutine write_matrix
    end interface

    integer i
    real, dimension(3, 3)             :: A
    real, dimension(3, 4)             :: B
    real, dimension(:,:), allocatable :: C

    A = reshape( [(i, i=1, 9)], shape(A), order = (/2, 1/) )
    B = reshape( [(i+1, i=1, size(B))], shape(B) )

    C = matmul( A, B )

    call write_matrix(C)

end program ex2

subroutine write_matrix(x)
    real, dimension(:,:) :: x
    write (*,*)
    
    do i = lbound(x,1), ubound(x,1)
       write (*,*) ( x(i,j), j = lbound(x,2), ubound(x,2) )
    end do
end subroutine write_matrix