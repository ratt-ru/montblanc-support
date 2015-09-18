#PBS -q GPUQ
#PBS -l nodes=srvslsgpu003:ppn=4:seriesGPUk
#PBS -N compile-montblanc
#PBS -o Q.test-mb.log
#PBS -e Q.test-mb.err
#PBS -V

source $HOME/scripts/base.sh

module load compilers/gcc492
module load mpi/openmpi-1.8.8
module load cuda/Cuda-6.5

export CUDA_DEVICE=0
#cd ${SOURCE_PREFIX}/montblanc/montblanc/tests
date
python --version
python -c 'import montblanc; montblanc.test()'
date
