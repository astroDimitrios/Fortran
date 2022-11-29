program pointers

    implicit none

    real, pointer :: p, q
    real, target  :: x, y

    integer :: N = 10, M = 10

    ! avoid undefined pointers
    real, pointer :: A(:, :) => NULL()

    x = 10.; y = 5.
    ! Can also be allocated()
    allocate(A(N, M))

    p => x
    q => y

    print *, 'p = ', p
    print *, 'q = ', q

    p = q

    print *, 'p = ', p

    if (.not. associated(p)) p => x
    if (.not. associated(p, x)) p => x

    nullify(p)

    deallocate(A)

end program