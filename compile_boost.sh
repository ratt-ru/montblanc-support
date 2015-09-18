#PBS -q GPUQ
#PBS -l nodes=srvslsgpu003:ppn=4:seriesGPUk
#PBS -N compile-boost
#PBS -o Q.compile-boost.log
#PBS -e Q.compile-boost.err
#PBS -V

source $HOME/scripts/base.sh

module load compilers/gcc492

cd $SOURCE_PREFIX/boost_1_57_0
./bootstrap.sh
./b2 --clean-all
./b2 install --prefix=$INSTALL_PREFIX
