FC = gfortran
FFLAGS = -Wall -Wextra -g -fbounds-check -fimplicit-none
ALL_objs := types.o printmat.o gaussian_elimination_fullpivot.o linalg.o

all: main.o $(ALL_objs) gemhilbert.o  genhilbert_mat.o
	$(FC) -g -o gauss main.o $(ALL_objs)
	$(FC) -g -o hilber_mat hilber_mat.o $(ALL_objs)
	$(FC) -g -o genhilbert genhilbert_mat.o $(ALL_objs)

types.o: types.f90
	$(FC) $(FFLAGS) -c types.f90


printmat.o: types.o printmat.f90
	$(FC) $(FFLAGS) -c printmat.f90


gaussian_elimination_fullpivot.o: types.o printmat.o gaussian_elimination_fullpivot.f90
	$(FC) $(FFLAGS) -c gaussian_elimination_fullpivot.f90


linalg.o: types.o printmat.o gaussian_elimination_fullpivot.o linalg.f90
	$(FC) $(FFLAGS) -c linalg.f90


main.o: $(ALL_objs) main.f90
	$(FC) $(FFLAGS) -c main.f90


gemhilbert.o: $(ALL_objs) hilber_mat.f90
	$(FC) $(FFLAGS) -c hilber_mat.f90

genhilbert_mat.o: $(ALL_objs) genhilbert_mat.f90
	$(FC) $(FFLAGS) -c genhilbert_mat.f90



clean:
	rm -rf *.o *.mod
tar:
	tar -czf gauss-`date -I`.tgz *.f90 makefile
