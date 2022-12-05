! Relativistic mechanics makes use of four vectors that are generalizations
! of vectors to four dimensional spacetime.
! They consist of a quantity that is a vector in three dimensional space
! (e.g. momentum) and a fourth quantity that is a scalar (e.g. energy).
! One way of handling four vectors in a program might be to
! make the lower bound zero; this would correspond to the
! ``scalar'' element.
! However, the zeroth element might have different properties from
! elements one through three; thus it might be desirable to
! create a derived type.
!
! Define a derived type for the energy momentum four vector,
! which contains the scalar three energy E
! plus a three dimensional vector 𝑝⃗, which is the ordinary momentum.
! Make the momentum element allocatable.

program ex1
    implicit none

    type four_momentum
        real              :: E = 0
        real, allocatable :: p(:)
    end type four_momentum

    type(four_momentum) :: particle, particle2

    particle%E = 4.3E-12
    allocate( particle%p(3) )
    particle%p = [0.21, 0.54, 0.15]

    ! particle2 = four_momentum()   ! all default
    particle2 = four_momentum(E=0)  ! set E but not p
    particle2%p = [0, 0, 0]         ! set p later

    print *, particle%E, particle%p
    print *, particle2%E, particle2%p
    
end program ex1