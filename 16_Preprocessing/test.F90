! Tested on gfortran and ifort
program test
    implicit none

! https://www.intel.com/content/www/us/en/develop/documentation/fortran-compiler-oneapi-dev-guide-and-reference/top/optimization-and-programming/fpp-preprocessing/fpp-preprocessor-directives.html
! not file because that will overwrite the keyword
#define this_file __FILE__
    print *, this_file

! no of next line
#define line __LINE__
    print *, line
! simple get date of compile, print it
#define date __DATE__
    print *, date

#define time __TIME__
    print *, time

#define timestamp __TIMESTAMP__
    print *, timestamp

! get OS
! To specify gfortran os directive:
! gfortran -D__linux__ test.F90 
! ifort has it built in
! https://cyber.dabamos.de/programming/modernfortran/preprocessor.html
#if defined (__linux__)
    print *, 'Linux'
#elif defined (__FreeBSD__)
    print *, 'FreeBSD'
#else
    print *, 'Unkown OS'
#endif

! default do something in dp
! gfortran -D RDEF_PRECISION=32 -D __linux__  test.F90 
#if (RDEF_PRECISION == 32)
    print *, 'sp 32'
#else
    print *, 'dp 64'
#endif
    
end program test