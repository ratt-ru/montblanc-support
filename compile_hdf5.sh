#PBS -q GPUQ
#PBS -l nodes=srvslsgpu003:ppn=4:seriesGPUk
#PBS -N compile-hdf5
#PBS -o Q.compile-hdf5.log
#PBS -e Q.compile-hdf5.err
#PBS -V

source $HOME/scripts/base.sh

module load compilers/gcc492
module load mpi/openmpi-1.8.8
module load cuda/Cuda-6.5

source $HOME/scripts/compiler_vars.sh

export CC=${MPICC}
cd ${SOURCE_PREFIX}/hdf5-1.8.15-patch1
./configure --enable-parallel --prefix=${INSTALL_PREFIX}
make clean
make
make install
