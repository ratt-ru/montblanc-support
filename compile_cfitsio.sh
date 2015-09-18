#PBS -q GPUQ
#PBS -l nodes=srvslsgpu003:ppn=4:seriesGPUk
#PBS -N compile-cfitsio
#PBS -o Q.compile-cfitsio.log
#PBS -e Q.compile-cfitsio.err
#PBS -V

source $HOME/scripts/base.sh

module load compilers/gcc492
module load cuda/Cuda-6.5

cd ${SOURCE_PREFIX}/cfitsio
./configure --prefix=${INSTALL_PREFIX}
make -j 4 clean
make -j 4
make -j 4 install
