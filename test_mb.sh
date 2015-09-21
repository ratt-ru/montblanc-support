#PBS -q GPUQ
#PBS -l nodes=srvslsgpu003:ppn=4:seriesGPUk
#PBS -N test-montblanc
#PBS -o Q.test-mb.log
#PBS -e Q.test-mb.err
#PBS -V


module load compilers/gcc484
module load mpi/openmpi-1.8.8
module load cuda/Cuda-6.5

source $HOME/scripts/base.sh

export CUDA_DEVICE=0
#cd ${SOURCE_PREFIX}/montblanc/montblanc/tests
date
python --version
python -c 'import montblanc; montblanc.test()'
date
