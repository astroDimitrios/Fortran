! Compile:
! gfortran -o run_julia julia.f90
! or OpenMP
! gfortran -fopenmp -o run_julia julia.f90
! -DOMP_NESTED=True
! OMP_NUM_THREADS=10 ./julia

program julia

    use, intrinsic :: omp_lib
    use, intrinsic :: iso_fortran_env, only: int32, int64, real32, real64
    implicit none

    logical            :: l_val           
    integer, parameter :: l_def   = kind(l_val)
    integer, parameter :: str_def = 40

    complex(kind=real32)           :: c
    integer(kind=int32)            :: size
    integer(kind=int32)            :: iterations
    real(kind=real32)              :: threshold
    logical(kind=l_def)            :: smooth
    real(kind=real64)              :: dx, dy
    real(kind=real32)              :: xmin, xmax, ymin, ymax

    integer(kind=int32)            :: i, j

    real(kind=real32), allocatable :: members(:,:)

    character(str_def), parameter :: file_path = './julia/config_julia.nml'
    character(str_def)            :: output_file_path, size_str, c_real, c_im
    integer(kind=int32)           :: rc, file_unit

    integer(kind=int64)     :: start_t, end_t, count_rate
    real(kind=real64)       :: exec_time

    ! namelist declaration
    namelist /julia_conf/ c, size, iterations, threshold, smooth, xmin, xmax, ymin, ymax

    call system_clock( start_t, count_rate )

    inquire ( file=file_path, iostat=rc )
    if ( rc /= 0 ) then
        error stop 'Error: Config file does not exist.'
    end if
    open (action='read', file=file_path, iostat=rc, newunit=file_unit)
    read (nml=julia_conf, iostat=rc, unit=file_unit)
    if ( rc /= 0 ) error stop 'Error: Invalid Namelist format'
    close (file_unit)

    ! assume that we will always have a square
    dx = ( xmax - xmin ) / ( real(size, real32) - 1.0 )
    dy = ( ymax - ymin ) / ( real(size, real32) - 1.0 )

    allocate( members( size, size ) )

    !$omp parallel do collapse(2) schedule(dynamic,5) default(none)   &
    !$omp             shared(size, c, members, iterations, threshold, &
    !$omp                    smooth, xmin, dx, ymax, dy)              &
    !$omp             private(i, j)
    do j = 1, size
        do i = 1, size
            members(i,j) = julia_set( cmplx( xmin+dx*(j-1), ymax-dy*(i-1) ), &
                                      c, iterations, threshold , smooth      )
        end do
    end do
    !$omp end parallel do

    call system_clock( end_t, count_rate )
    exec_time = real( end_t - start_t ) / real( count_rate )
    write (*,*) 'Elapsed time in seconds: ', exec_time
    start_t = end_t

    ! write the matrix to a csv
    write (c_real, '(F6.3)') c%re
    write (c_im, '(F6.3)') c%im
    write (size_str, '(I10)') size
    output_file_path = './julia/data/'//'julia_'//trim(adjustl(c_real)) &
                       //'_'//trim(adjustl(c_im))//'_'//                &
                       trim(adjustl(size_str))//'.csv'
    write (*,*) 'Start write to file: ', output_file_path
    call matrix_to_csv(members, output_file_path, size, rc, file_unit)

    print *, 'Written Output'
    call system_clock( end_t, count_rate )
    exec_time = real( end_t - start_t ) / real( count_rate )
    write (*,*) 'Elapsed time writing file in seconds: ', exec_time

contains

    pure function julia_set(z_test, c, n, threshold, smooth) result(escape_count)
        implicit none
        complex, intent(in) :: z_test
        complex, intent(in) :: c
        integer, intent(in) :: n
        real, intent(in)    :: threshold
        logical, intent(in) :: smooth
        real                :: escape_count
        
        integer(kind=int32)  :: iter
        complex(kind=real32) :: z

        z = z_test

        do iter = 1, n
            z = z**2 + c

            if ( abs(z) > threshold ) then

                if ( smooth ) then
                    z = (z**2 + c)**2 + c
                    escape_count = iter - log2(log2(abs(z)))
                else
                    escape_count = iter
                end if

                return
            end if

        end do

        escape_count = n

    end function julia_set

    real pure function log2(x)
        implicit none
        real, intent(in) :: x

        log2 = log(x) / log(2.0)

    end function log2

    subroutine matrix_to_csv(matrix, path, rows, err, unit)
        implicit none
        real(kind=real32)                  :: matrix(:,:)
        character(*), intent(in)           :: path
        integer(kind=int32), intent(in)    :: rows
        integer(kind=int32), intent(inout) :: err, unit

        11 format (1x, F15.7, *(",", F15.7))

        open(action='write', file=path, iostat=err, newunit=unit)
        if ( rc /= 0 ) stop
        do i = 1, rows
            write (unit, fmt=11) ( matrix(i,j), j = 1, rows )
        end do
        close(unit)

    end subroutine matrix_to_csv
    
end program julia
