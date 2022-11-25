! Write a program that declares three arrays, multiplies two of them and stores the result into the third.
! The arrays may be of any appropriate size and initialized in any manner.

PROGRAM ex2

    implicit none

    ! Writing matrix properly to screen
    ! From - https://www.tutorialspoint.com.cach3.com/programming_example/hhj1FL/fortran-reshape-functions.html
    interface
        subroutine write_matrix(a)
            real, dimension(:,:) :: a
        end subroutine write_matrix
    end interface

    integer i
    real, dimension(3, 3) :: A
    real, dimension(3, 4) :: B
    real, dimension(:, :), allocatable :: C

    A = reshape([(i, i=1, 9)], shape(A), order = (/2, 1/))
    B = reshape([(i+1, i=1, size(B))], shape(B))

    C = matmul(A, B)

    call write_matrix(C)

END PROGRAM ex2

subroutine write_matrix(a)
    real, dimension(:,:) :: a
    write(*,*)
    
    do i = lbound(a,1), ubound(a,1)
       write(*,*) (a(i,j), j = lbound(a,2), ubound(a,2))
    end do
end subroutine write_matrix