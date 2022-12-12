! Timing from: https://craftofcoding.wordpress.com/2017/03/31/timing-a-fortran-function/
!
! TIME: 5.96859977E-02 s
! with conc and pure - 5.94660044E-02 s?
! ~ 5 times slower

program mem_layout_SoA
    implicit none

    type :: planet_SoA
        real :: mass = 15.4
        real :: pos(3) = [6.2, 3.4, 7.2]
        real :: vel(3) = [1.2, 4.5, 19.6]
    end type planet_SoA

    integer            :: i
    real               :: startT, endT, execTime

    integer, parameter :: N = 1000000
    type(planet_SoA)   :: planets_SoA(N)

    real :: planets_m(N, 3)

    call cpu_time(startT)

    do concurrent ( i = 1:N )
        call planet_momentum( planets_SoA(i), planets_m(i,1:3) )
    end do

    call cpu_time(endT)
    execTime = (endT - startT)
    write (*,*) 'Elapsed time in seconds: ', execTime

    ! do i = 1, N 
    !     print *, planets_m(i,1:3)
    ! end do

contains

    pure subroutine planet_momentum( p, m )
        type(planet_SoA), intent(in) :: p
        real, intent(inout)          :: m( size(p%vel) )
        m = p%mass * p%vel
    end subroutine planet_momentum
    
end program mem_layout_SoA