program pdt_test

    implicit none

    ! nD momentum vector of type kind
    type :: xD_momentum( k, p )
        integer, kind :: k
        integer, len  :: p = 1 ! default len of array
        real(kind=k)  :: momentum(p)
    end type xD_momentum

    type, extends(xD_momentum) :: ball
        real(kind=k) :: mass ! kg
    end type ball

    integer, parameter :: sp = selected_real_kind( 6, 37 )
    integer, parameter :: dp = selected_real_kind( 15, 307 )

    type(xD_momentum( sp ))        :: particle_sp_1D  ! uses default p = 1 
    type(xD_momentum( dp, p = 2 )) :: particle_dp_2D

    ! deferred p value using allocatable
    ! may ONLY be used with allocatables and pointers
    type(xD_momentum( dp, : )), allocatable :: particle_dp_3D

    type(ball( dp, 3 )) :: ball_1
    ball_1%mass = 1.2_dp

    call assumed_len_param(particle_dp_2D)
    call create_3D_momentum(particle_dp_3D)

contains

    ! assumed length parameter
    ! kind may NOT be assumed
    subroutine assumed_len_param(m)
        type(xD_momentum( dp, * )) :: m
        print *, m%p
    end subroutine assumed_len_param

    subroutine create_3D_momentum(m)
        type(xD_momentum( dp, : )), allocatable, intent(out) :: m
        allocate(xD_momentum( dp, 3 ) :: m)
    end subroutine create_3D_momentum
    
end program pdt_test