#PBS -q GPUQ
#PBS -l nodes=srvslsgpu003:ppn=4:seriesGPUk
#PBS -N install-python-pkg
#PBS -o Q.install-python-pkg.log
#PBS -e Q.install-python-pkg.err
#PBS -V

source $HOME/scripts/base.sh

module load compilers/gcc492
module load mpi/openmpi-1.8.8
module load cuda/Cuda-6.5

cd ${SOURCE_PREFIX}
# Download the get-pip.py script
wget -c https://bootstrap.pypa.io/get-pip.py
# Download an SSL certificate
# http://stackoverflow.com/a/26062583
wget -c http://curl.haxx.se/ca/cacert.pem
CERT_OPTIONS="--cert $SRC/cacert.pem"
PYVERSION=$(python --version)
echo "Python version is ${PYVERSION}"
# --install
python ${SOUCE_PREFIX}/get-pip.py install --install-option="--install-scripts=${INSTALL_PREFIX}/bin" ${CERT_OPTIONS}
# Upgrade pip
python -m pip install -U --install-option="--install-scripts=${INSTALL_PREFIX}/bin" ${CERT_OPTIONS} pip 
# install numpy
python -m pip install -U numpy ${CERT_OPTIONS}
