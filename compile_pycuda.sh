#PBS -q GPUQ
#PBS -l nodes=srvslsgpu003:ppn=4:seriesGPUk
#PBS -N compile-pycuda
#PBS -o Q.compile-pycuda.log
#PBS -e Q.compile-pycuda.err
#PBS -V

source $HOME/scripts/base.sh

module load compilers/gcc492
module load mpi/openmpi-1.8.8
module load cuda/Cuda-6.5

cd ${SOURCE_PREFIX}/pycuda
rm -rf build
rm siteconf.py
#python configure.py --cuda-root=${CUDAHOME}
python setup.py clean
python setup.py build
python setup.py install
