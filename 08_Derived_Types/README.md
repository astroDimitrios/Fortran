# Notes

**[ex3.f90](./Exercise3/ex3.f90)** - Contains a Linked List. Reads a CSV of unknown length into data type.

## Exercises

### ex1

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

Helpful [Link](https://en.wikipedia.org/wiki/Four-momentum)

! Define a derived type for the energy momentum four vector,  
! which contains the scalar three energy E  
! plus a three dimensional vector 𝑝⃗, which is the ordinary momentum.  
! Make the momentum element allocatable.  

### ex2

! Define a derived type that would describe a species,  
! with the aim of creating a simple database for the  
! use of a code that models an ecosystem.  
!  
! Elements are up to the programmer's discretion but might  
! include entries such as type of species  
! (e.g. plant, animal, bacterium, etc.), genus name, species name,  
! habitat type, observed population, and so forth.  
!  
! Make at least one member of the type be an integer vector  
! to hold characteristics of the species such as  
! habitat type, population, and other descriptors that  
! might be useful to an ecology model.  
! Include a pointer to the type so that a list can be developed.

### ex3

! Use the derived type in the previous Exercise to create a  
! linked list of species for the ecological model.  
! Add the checks that were omitted from the code stub in the text  
! (check for unassigned pointers, nullify all pointers not in use, etc.).

My ***[ex3.f90](./Exercise3/ex3.f90)*** does not really answer this. It takes values from a csv and creates a linked list from them. Then traverses the list and prints the data to the terminal.
