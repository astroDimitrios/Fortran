! Change your program that solves Laplace's equation into
! a program with at least one subroutine.
! Pass the initial conditions to the subroutine.

program ex3

    implicit none

    interface
        subroutine laplace(x)
            implicit none
            integer :: i, j
            real    :: x(:, :)
            real    :: x_prev(size(x,1), size(x,2))
        end subroutine laplace
    end interface

    integer               :: k, rc, file_unit
    integer, parameter    :: N = 100, M = 100
    real, dimension(N, M) :: z

    z(1,:)   = 100
    z(2:M,:) = 0

    call laplace(z)

    open (file='ex3_data.csv', iostat=rc, newunit=file_unit)
    if (rc /= 0) stop 'Error: open failed'
    do k = 1, N
        write (file_unit, '(1x, *(g0, :, ", "))') z(k,:)
    end do
    close (file_unit)

end program

subroutine laplace(x)

    implicit none

    integer :: i, j
    real    :: x(:, :)
    real    :: x_prev(size(x,1), size(x,2))

    do while (any(x /= x_prev))

        do j = 2, size(x,2)-1
            do i = 2, size(x,1)-1
               x(i,j) = 0.25*(x(i,j-1) + x(i,j+1) + x(i-1,j) + x(i+1,j))
            end do
        end do

        x_prev = x
    end do

end subroutine