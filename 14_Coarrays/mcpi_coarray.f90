! Monte Carlo Calculation of Pi using 1 Billion trials
!
! Compile:
! ifort -o mcpi_coarray -coarray mcpi_coarray.f90
! or
! ifort -o mcpi_coarray -coarray -coarray-num-images=10 mcpi_coarray.f90
! ./mcpi_coarray 
!
! Output:
! Computing Pi using          4 images
! Elapsed time in seconds:    8.148201    
! Trials:                   1000000000
! Pi:                 3.14163310400000

program mcpi_sequential

    use, intrinsic :: iso_fortran_env, only: int64, real64
    implicit none

    real(kind=real64)   :: Pi 
    real(kind=real64)   :: x, y
    real(kind=real64)   :: total[*] ! coarray * images det at runtime

    integer(kind=int64) :: i
    integer(kind=int64) :: num_trials
    integer(kind=int64) :: num_img

    real                :: startT, endT, execTime

    num_trials = 1000000000
    num_img = int(num_images(), int64)

    if ( this_image() == 1 ) then
        ! num_trials must be divisible by num_images()
        if ( mod(num_trials, num_img) /= 0_int64 ) then
            error stop 'num_trials not evenly divisible by number of images!'
        end if
        print *, 'Computing Pi using ', num_img, ' images'
        call cpu_time(startT)
    end if


    do i = 1_int64, num_trials/num_img
        call random_number(x)
        call random_number(y)
        if ( (x**2 + y**2) <= 1.0_real64 ) total = total + 1.0_real64
    end do

    sync all ! sync all image results before calc Pi

    if ( this_image() == 1 ) then
        do i = 2, num_img
            total = total + total[i] ! add total for each image
        end do
        Pi = 4.0_real64 * total / real(num_trials, real64)

        call cpu_time(endT)
        execTime = (endT - startT)
        write (*,*) 'Elapsed time in seconds: ', execTime

        print *, 'Trials:       ', num_trials
        print *, 'Pi:              ', Pi
    end if
    
end program mcpi_sequential

