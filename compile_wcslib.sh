#PBS -q GPUQ
#PBS -l nodes=srvslsgpu003:ppn=4:seriesGPUk
#PBS -N compile-wcslib
#PBS -o Q.compile-wcslib.log
#PBS -e Q.compile-wcslib.err
#PBS -V

source $HOME/scripts/base.sh

module load compilers/gcc492
module load cuda/Cuda-6.5

cd ${SOURCE_PREFIX}/wcslib-5.9
./configure --prefix=${INSTALL_PREFIX} --with-cfitsioinc=${INSTALL_PREFIX}/include --with-cfitsiolib=${INSTALL_PREFIX}/lib
make clean
make
make install
