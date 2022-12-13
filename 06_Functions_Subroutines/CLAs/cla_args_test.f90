! Test can take unknown number of command line arguments (CLA)
! Make first a real
!
! Compile:
! gfortran -o cla_args_test cla_args_test.f90
! ./cla_args_test 45.6789

program cla_args_test  
    implicit none

    integer :: i
    integer :: num_args
    integer :: alloc_status, read_err

    real :: r_num

    character(len=50), allocatable :: args(:)

    num_args = command_argument_count()

    ! check if CLA/s passed
    if ( num_args == 0 ) then
        error stop "No CLA given"
    end if

    allocate( args(num_args), stat = alloc_status )

    ! check if allocation was successful
    if ( alloc_status > 0 ) then
        error stop "Allocation error"
    end if

    ! store CLA/s in args array
    do i = 1, num_args
        call get_command_argument(number = i, value = args(i))
    end do

    ! convert character CLA to real arg
    read (args(1), '(f15.7)', iostat=read_err) r_num
    if ( read_err /= 0 ) error stop 'Convert CLA to real fail'

    write (*,*) r_num

end program cla_args_test