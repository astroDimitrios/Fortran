! Timing from: https://craftofcoding.wordpress.com/2017/03/31/timing-a-fortran-function/
!
! TIME: 1.15549993E-02 s
! ~ 5 times faster
! rows are x, y, and z components
! columns are each planet

program mem_layout_AoS
    implicit none

    ! Writing matrix properly to screen
    ! From - https://www.tutorialspoint.com.cach3.com/programming_example/hhj1FL/fortran-reshape-functions.html
    interface
        subroutine write_matrix(x)
            real, dimension(:,:) :: x
        end subroutine write_matrix
    end interface

    type :: planet_AoS( k, N )
        integer, kind :: k
        integer, len  :: N
        real          :: mass(N)
        real          :: pos(3,N)
        real          :: vel(3,N)
    end type planet_AoS

    integer, parameter :: sp = selected_real_kind( 6, 37 )

    integer            :: i
    real               :: startT, endT, execTime

    integer, parameter          :: N = 1000000
    type(planet_AoS( sp, N ))   :: planets_AoS

    real :: planets_m(3,N)

    planets_AoS%mass = 15.4
    do i = 1, N
        planets_AoS%pos(:,i) = [6.2, 3.4, 7.2]
        planets_AoS%vel(:,i) = [1.2, 4.5, 19.6]
    end do

    ! print *, planets_AoS%mass
    ! call write_matrix(planets_AoS%pos)
    ! call write_matrix(planets_AoS%vel)

    call cpu_time(startT)

    call planet_momentum( planets_AoS, planets_m )

    call cpu_time(endT)
    execTime = (endT - startT)
    write (*,*) 'Elapsed time in seconds: ', execTime

    ! call write_matrix(planets_m)

contains

    subroutine planet_momentum( p, m )
        type(planet_AoS( sp, * )), intent(in) :: p
        real, intent(inout)                   :: m(size(p%vel,1), size(p%vel,2))
        integer :: j
        
        do concurrent ( j = 1:size(p%mass) )
            m(1:3,j) = p%mass(j) * p%vel(1:3,j)
        end do
    end subroutine planet_momentum
    
end program mem_layout_AoS

subroutine write_matrix(x)
    real, dimension(:,:) :: x
    write (*,*)
    
    do i = lbound(x,1), ubound(x,1)
       write (*,*) ( x(i,j), j = lbound(x,2), ubound(x,2) )
    end do
end subroutine write_matrix