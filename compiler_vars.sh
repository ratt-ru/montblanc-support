OMPI_CC=$(which gcc)
OMPI_CXX=$(which g++)
OMPI_FC=$(which gfortran)

echo "OpenMPI C Compiler ${OMPI_CC}"
echo "OpenMPI C++ Compiler ${OMPI_CXX}"
echo "OpenMPI Fortran Compiler ${OMPI_FC}"

# Determine where the MPI compilers are!
MPICC=$(which mpicc)
MPICPP=$(which mpic++)
MPIFORT=$(which mpif90)
echo "Using mpicc at ${MPICC}"
echo "Using mpicpp at ${MPICPP}"
echo "Using mpif90 at ${MPIFORT}"
