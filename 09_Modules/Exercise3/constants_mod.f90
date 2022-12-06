module constants_mod
    implicit none

    ! hardware specific 32 bit real
    integer,       parameter    :: r_32      = selected_real_kind(6, 37)
    ! hardware specific 64 bit real
    integer,       parameter    :: r_64      = selected_real_kind(15, 307)

    integer,       parameter    :: r_def     = r_64  ! default real for the application
    integer,       parameter    :: r_native  = r_32  ! native kind for real
    integer,       parameter    :: dp_native = r_64  ! native kind for double precision

    ! Numerical constants
    real(kind=r_def), parameter :: pi  = 3.141592654_r_def    ! pi value

    ! Physical constants
    real(kind=r_def)            :: earth_radius = 6371229.0_r_def
    
end module  constants_mod