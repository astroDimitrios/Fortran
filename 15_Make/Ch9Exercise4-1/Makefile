###############################################################################
# License: CC-BY-SA-NC
# Author:
###############################################################################
# Ice Cream Makefile
###############################################################################

FC = gfortran
FFLAGS = -O3 -std=f2008

PROJECT_NAME = ice_cream

.PHONY: default
default: ice_cream clean

ice_cream: ice_cream.o ice_cream_mod.o
	gfortran -o $(PROJECT_NAME) ice_cream.o ice_cream_mod.o

ice_cream.o: ice_cream_mod.o
	gfortran -c ice_cream.f90

ice_cream_mod.o: ice_cream_mod.f90
	gfortran -c ice_cream_mod.f90 

.PHONY: clean
clean:
	@rm -f *.mod *.o
