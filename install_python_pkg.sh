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

PYTHON_VERSION=$(python --version)
echo "python version is ${PYTHON_VERSION}"

cd ${SOURCE_PREFIX}
# Download the get-pip.py script
wget -c https://bootstrap.pypa.io/get-pip.py
# Download an SSL certificate
# http://stackoverflow.com/a/26062583
wget -c http://curl.haxx.se/ca/cacert.pem
CERT_OPTIONS="--cert ${SOURCE_PREFIX}/cacert.pem"
# Install download pip version
python ${SOURCE_PREFIX}/get-pip.py ${CERT_OPTIONS} -vvv
PIP_VERSION=$(python -m pip --version)
echo "pip version ${PIP_VERSION}"
# Upgrade pip
python -m pip install -U pip ${CERT_OPTIONS}
# install virtualenv
python -m pip install -U virtualenv ${CERT_OPTIONS}
# install numpy
python -m pip install -U numpy ${CERT_OPTIONS}
