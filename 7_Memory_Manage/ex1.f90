! Rewrite your Poisson solver to use allocatable arrays
! whose size is determined by an input parameter at runtime.

program ex34

    implicit none

    ! Writing matrix properly to screen
    ! From - https://www.tutorialspoint.com.cach3.com/programming_example/hhj1FL/fortran-reshape-functions.html
    interface
        subroutine poisson(x, rho)
            implicit none
            integer                 :: i, j
            real, intent(in)        :: rho
            real, intent (inout)    :: x(:,:)
            real                    :: x_prev(size(x,1), size(x,2))
        end subroutine poisson
        subroutine write_matrix(a)
            real, dimension(:,:) :: a
        end subroutine write_matrix
    end interface

    integer               :: k, rc, file_unit
    integer               :: N, M
    real, parameter       :: p = 5.0
    real, allocatable     :: z(:,:)

    print *, 'Enter value, N = '
    read *, N

    print *, 'Enter value, M = '
    read *, M

    allocate(z(N,M))
    z(1,:)   = 100
    z(2:M,:) = 0

    call poisson(z, p)
    ! call write_matrix(z)

    open (file='ex3_data.csv', iostat=rc, newunit=file_unit)
    if ( rc /= 0 ) stop 'Error: open failed'
    do k = 1, N
        write (file_unit, '(1x, *(g0, :, ", "))') z(k,:)
    end do
    close (file_unit)

end program

subroutine poisson(x, rho)

    implicit none

    integer                 :: i, j
    real, intent(in)        :: rho
    real, intent (inout)    :: x(:,:)
    real                    :: x_prev(size(x,1), size(x,2))

    do while ( any(x /= x_prev) )

        x_prev = x

        do j = 2, size(x,2)-1
            do i = 2, size(x,1)-1
               x(i,j) = 0.25*(x_prev(i,j-1) + x_prev(i,j+1)&
               + x_prev(i-1,j) + x_prev(i+1,j))&
               +4.0*ATAN(1.0)*rho
            end do
        end do
    end do

end subroutine

subroutine write_matrix(a)
    real, dimension(:,:) :: a
    write (*,*)
    
    do i = lbound(a,1), ubound(a,1)
       write (*,*) (a(i,j), j = lbound(a,2), ubound(a,2))
    end do
end subroutine write_matrix