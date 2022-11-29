program allocatable_arrays   

    implicit none

    ! Allocatable Arrays
    real, dimension(:, :), allocatable :: A
    real, allocatable :: B(:, :)

    integer :: M = 10, N = 10

    ! allocate(A(M, N))
    allocate(A(M, N), B(M, N))

    if (.not. allocated(A)) then
        allocate(A(M, N))
    end if

    ! deallocate(A)
    deallocate(A, B)

    ! in subroutine don't need to know dimens just rank
    ! Assumed Shape Array
    real :: C(:, :)

    ! Automatic Array
    ! subroutine poisson(x)
    !     real, intent (inout) :: x(:, :)
    !     real                 :: x_prev(size(x,1), size(x,2))

end program