! Write a program that declares two real and one integer arrays, each of size ( 100,100).
!   a.  Initialize one real array to all zeroes and the other to all threes.
!       Initialize the integer array to all six.
!       Add the integer array to the array whose elements take the value of three and store into the third array.
!       Remember to cast appropriately.
!   b.  Change your program to add an integer parameter initialized to 100.
!       Change the declaration of the arrays so that their size is determined by this parameter.

PROGRAM ex1

    implicit none

    integer, parameter           :: N = 100
    integer, dimension(N, N)     :: A
    real, dimension(100, 100)    :: B, C, D

    A = 6
    B = 0.
    C = 3.

    D = real(A) + C

    !Write (*,*) D
 
END PROGRAM ex1