! Write a program that finds the sum of a rank 3 array with the argument dim set to 2.

program ex3

    implicit none

    integer i
    real, dimension(3, 3) :: A

    A = reshape( [(i, i=1, 9)], shape(A), order = (/2, 1/) )

    write (*,*) sum(A, 1) ! columnwise sum
    write (*,*) sum(A, 2) ! rowise sum
    !write (*,*) sum(A, 3) ! zwise sum

end program ex3