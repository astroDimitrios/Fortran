program allocatable_arrays   

    implicit none

    ! Allocatable Arrays
    real, dimension(:,:), allocatable :: a
    real, allocatable :: b(:,:)

    integer :: M = 10, N = 10

    ! allocate(a(M,N))
    allocate(a(M,N), b(M,N))

    if ( .not. allocated(a) ) then
        allocate(a(M,N))
    end if

    ! deallocate(a)
    deallocate(a, b)

    ! in subroutine don't need to know dimens just rank
    ! Assumed Shape Array
    ! real :: c(:,:)

    ! Automatic Array
    ! subroutine poisson(x)
    !     real, intent (inout) :: x(:,:)
    !     real                 :: x_prev(size(x,1), size(x,2))

end program