! Write a program that finds the sum of a rank 3 array with the argument dim set to 2.

PROGRAM ex3

    implicit none

    integer i
    real, dimension(3, 3) :: A

    A = reshape([(i, i=1, 9)], shape(A), order = (/2, 1/))

    Write(*,*) sum(A, 1) ! columnwise sum
    Write(*,*) sum(A, 2) ! rowise sum
    !Write(*,*) sum(A, 3) ! zwise sum

END PROGRAM ex3