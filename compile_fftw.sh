#PBS -q GPUQ
#PBS -l nodes=srvslsgpu003:ppn=4:seriesGPUk
#PBS -N compile-fftw
#PBS -o Q.compile-fftw.log
#PBS -e Q.compile-fftw.err
#PBS -V

source $HOME/scripts/base.sh

module load compilers/gcc492
module load cuda/Cuda-6.5

cd ${SOURCE_PREFIX}/fftw-3.3.4
./configure --prefix=${INSTALL_PREFIX}
make clean
make
make install
