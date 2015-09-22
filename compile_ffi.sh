#PBS -q GPUQ
#PBS -l nodes=srvslsgpu003:ppn=4:seriesGPUk
#PBS -N compile-ffi
#PBS -o Q.compile-ffi.log
#PBS -e Q.compile-ffi.err
#PBS -V

source $HOME/scripts/base.sh

module load compilers/gcc492
module load mpi/openmpi-1.8.8
module load cuda/Cuda-6.5

cd ${SOURCE_PREFIX}/libffi-3.2.1

# See
# http://www.linuxfromscratch.org/blfs/view/svn/general/libffi.html
sed -e '/^includesdir/ s/$(libdir).*$/$(includedir)/' \
    -i include/Makefile.in

sed -e '/^includedir/ s/=.*$/=@includedir@/' \
    -i libffi.pc.in

#    -e '/^toolexeclibdir/ s/=.*$/=@libdir@/' \
#    -e '/^Libs:/ s/.*$/Libs: -L@libdir@ -lffi/' \


./configure --prefix=${INSTALL_PREFIX} \
	--disable-static

make clean
make
make install
