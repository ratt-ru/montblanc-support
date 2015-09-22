#PBS -q GPUQ
#PBS -l nodes=srvslsgpu003:ppn=4:seriesGPUk
#PBS -N test-montblanc
#PBS -o Q.test-mb.log
#PBS -e Q.test-mb.err
#PBS -V

source $HOME/scripts/base.sh

module load compilers/gcc484
module load mpi/openmpi-1.8.8
module load cuda/Cuda-6.5

# Active the virtual environment
source $VENV_PREFIX/mb/bin/activate

export CUDA_DEVICE=0
date
python -c 'import montblanc; montblanc.test()'
date
