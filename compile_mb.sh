#PBS -q GPUQ
#PBS -l nodes=srvslsgpu003:ppn=4:seriesGPUk
#PBS -N compile-montblanc
#PBS -o Q.compile-mb.log
#PBS -e Q.compile-mb.err
#PBS -V

source $HOME/scripts/base.sh

module load compilers/gcc492
module load mpi/openmpi-1.8.8
module load cuda/Cuda-6.5

cd ${SOURCE_PREFIX}/montblanc
git submodule update --init
python setup.py install
