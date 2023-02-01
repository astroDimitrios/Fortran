! Compile:
! OpenMP - commands specific to VDI env
! env_gcc
! gfortran $LDFLAGS $FFLAGS -fopenmp -o run_mandelbrot mandelbrot.f90 -lnetcdff -lnetcdf
! -DOMP_NESTED=True
!
! OMP_NUM_THREADS=10 ./run_mandelbrot
!
! module purge
! python plot.py

program mandelbrot

    use, intrinsic :: omp_lib
    use            :: netcdf
    use, intrinsic :: iso_fortran_env, only: int32, int64, real32, real64
    implicit none

    logical            :: l_val           
    integer, parameter :: l_def   = kind(l_val)
    integer, parameter :: str_def = 40

    integer(kind=int32)            :: matrix_len
    real(kind=real64)              :: dx, dy
    real(kind=real32)              :: xmin, xmax, ymin, ymax
    integer(kind=int32)            :: iterations
    real(kind=real32)              :: threshold
    logical(kind=l_def)            :: smooth
    integer(kind=int32)            :: i, j

    real(kind=real32), allocatable :: members(:,:)

    character(str_def), parameter :: nml_path = './mandelbrot/config_mandelbrot.nml'
    character(str_def)            :: output_file_path, matrix_len_str
    integer(kind=int32)           :: rc, file_unit

    ! for NetCDF
    character(str_def)            :: data_name

    integer(kind=int64)     :: start_t, end_t, count_rate
    real(kind=real64)       :: exec_time

    ! namelist declaration
    namelist /mandelbrot_conf/ matrix_len, iterations, threshold, smooth, xmin, xmax, ymin, ymax

    call system_clock( start_t, count_rate )

    inquire ( file=nml_path, iostat=rc )
    if ( rc /= 0 ) then
        error stop 'Error: Config file does not exist.'
    end if
    open (action='read', file=nml_path, iostat=rc, newunit=file_unit)
    read (nml=mandelbrot_conf, iostat=rc, unit=file_unit)
    if ( rc /= 0 ) error stop 'Error: Invalid Namelist format'
    close (file_unit)

    ! assume that we will always have a square
    dx = ( xmax - xmin ) / ( real(matrix_len, real32) - 1.0 )
    dy = ( ymax - ymin ) / ( real(matrix_len, real32) - 1.0 )

    allocate( members( matrix_len, matrix_len ) )

    !$omp parallel do collapse(2) schedule(dynamic,5) default(none) &
    !$omp             shared(matrix_len, members, iterations, threshold,  &
    !$omp                    smooth, xmin, dx, ymax, dy)            &
    !$omp             private(i, j)
    do j = 1, matrix_len
        do i = 1, matrix_len
            members(i,j) = is_member_mandelbrot( cmplx( xmin+dx*(j-1), ymax-dy*(i-1) ), &
                                                 iterations, threshold, smooth )
        end do
    end do
    !$omp end parallel do

    call system_clock( end_t, count_rate )
    exec_time = real( end_t - start_t ) / real( count_rate )
    write (*,*) 'Elapsed time in seconds: ', exec_time
    start_t = end_t

    ! write the matrix to a NetCDF file
    write (matrix_len_str, '(I10)') matrix_len
    output_file_path = './mandelbrot/data/'//'mandelbrot_'// &
                       trim(adjustl(matrix_len_str))//'.nc'
    write (*,*) 'Start write to file: ', output_file_path
    data_name = 'mandelbrot_'//trim(adjustl(matrix_len_str))
    call matrix_to_netcdf(members, data_name, output_file_path, matrix_len, rc, file_unit)

    print *, 'Written Output'
    call system_clock( end_t, count_rate )
    exec_time = real( end_t - start_t ) / real( count_rate )
    write (*,*) 'Elapsed time writing file in seconds: ', exec_time

contains

    pure function is_member_mandelbrot(c, n, threshold, smooth) result(escape_count)
        implicit none

        complex, intent(in) :: c
        integer, intent(in) :: n
        real, intent(in)    :: threshold
        logical, intent(in) :: smooth
        real                :: escape_count
        
        complex :: z
        integer :: iter

        z = (0.0, 0.0)

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

    end function is_member_mandelbrot

    real pure function log2(x)
        implicit none
        real, intent(in) :: x

        log2 = log(x) / log(2.0)

    end function log2

    subroutine matrix_to_netcdf(matrix, matrix_name, path, rows, err, unit)
        implicit none

        real(kind=real32), intent(in)      :: matrix(:,:)
        character(*), intent(in)           :: matrix_name
        character(*), intent(in)           :: path
        integer(kind=int32), intent(in)    :: rows
        integer(kind=int32), intent(inout) :: err, unit

        integer(kind=int32) :: ncid              ! nc file id
        integer(kind=int32) :: status
        integer(kind=int32) :: x_dimid, y_dimid  ! x and y dimensions id
        integer(kind=int32) :: varid             ! variable id

        ! create the file in NetCDF4 format with HDF5
        status = nf90_create( path, NF90_NETCDF4, ncid )
        call handle_netcdf_err(status)

        ! create 2 dimensions for our 2D matrix
        status = nf90_def_dim( ncid, 'x', size(matrix, 1), x_dimid )
        status = nf90_def_dim( ncid, 'y', size(matrix, 2), y_dimid )
        call handle_netcdf_err(status)

        ! define the type (32 bit float)
        status = nf90_def_var( ncid, matrix_name, NF90_FLOAT, [ x_dimid, y_dimid ], varid )
        call handle_netcdf_err(status)

        ! come out of define mode
        status = nf90_enddef(ncid)
        call handle_netcdf_err(status)

        ! put the matrix in the variable
        status = nf90_put_var( ncid, varid, matrix )
        call handle_netcdf_err(status)

        ! close the file
        status = nf90_close(ncid)
        call handle_netcdf_err(status)

    end subroutine matrix_to_netcdf

    subroutine handle_netcdf_err(status)
        implicit none
        integer(kind=int32), intent(in) :: status

        if ( status /= NF90_NOERR ) then
            print *, trim(nf90_strerror(status))
            error stop
        end if

    end subroutine handle_netcdf_err
    
end program mandelbrot
