!----------------------------
! (c) GNU, GPL-3.0-or-later
!----------------------------
!> @file
!> @author  Dimitrios Theodorakis
!> @version 1.0
!> 
!> @brief   Constants Module
!> 
!> @details Default int and real kinds, pi and earth radius constants

module constants_mod

    use, intrinsic :: iso_fortran_env, only: int32, int64
    implicit none

    !> @name Hardware specific and default real setup
    !> @{

    ! hardware specific 32 bit real
    integer,       parameter    :: r_32      = selected_real_kind(6, 37)
    ! hardware specific 64 bit real
    integer,       parameter    :: r_64      = selected_real_kind(15, 307)

    integer,       parameter    :: r_def     = r_64  !< default real for the application
    integer,       parameter    :: r_native  = r_32  !< native kind for real
    integer,       parameter    :: dp_native = r_64  !< native kind for double precision

    !> @}

    !> @defgroup const Constants
    !> @{
    !> @name Numerical constants
    !> @{
    real(kind=r_def), parameter :: pi  = 3.141592654_r_def         !< pi value
    !> @}

    !> @name Physical constants
    !> @{
    real(kind=r_def), parameter :: earth_radius = 6371229.0_r_def  !< Earth radius, m
    !> @}
    !> @}

    !> @name Integer kind setup
    !> @{
    integer,       parameter    :: i_32      = int32
    integer,       parameter    :: i_64      = int64
    !> @}
    
end module  constants_mod