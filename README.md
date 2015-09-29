# HPC cluster install scripts for montblanc and dependencies 

The scripts in this repository are configured to work
with the following package versions:

- [cmake 3.3.2][cmake]
- [Boost 1.57][boost]
- [Python 2.7.10][python]
- [FFTW 3.3.4][fftw]
- [HDF5 1.8.15-patch1][hdf5]
- [cfitsio V3.370][cfitsio]
- [wcslib 5.9][wcslib]
- [libffi 3.2.1][libffi]
- [casacore 2.0.3][casacore2]
- [python-casacore 2.0.0][python-casacore]
- [PyCUDA 2015.1.3][pycuda]
- [montblanc][montblanc]

It should be possible to configure the use
of other versions by editing individual scripts.

# Configuration

In general, the scripts assume that they are installed
in the `$HOME/script` directory.

The `base.sh` and `compiler_vars.sh` scripts are used
to configure environment variables in the
various compile_\*.sh scripts.

Two variables that you may wish to configure are:

```bash
INSTALL_PREFIX=$HOME/usr
SOURCE_PREFIX=$HOME/src
```

`INSTALL_PREFIX` is the location where this
software stack will be installed, while
`SOURCE_PREFIX` is the location of the directory
containing the unarchived copies of the various
software packages.

[cmake]:http://www.cmake.org/download/
[boost]:http://sourceforge.net/projects/boost/files/boost/1.57.0/
[python]:https://www.python.org/downloads/
[fftw]:http://www.fftw.org/download.html
[hdf5]:https://www.hdfgroup.org/HDF5/release/obtainsrc.html
[cfitsio]:http://heasarc.gsfc.nasa.gov/fitsio/fitsio.html
[wcslib]:http://www.atnf.csiro.au/people/mcalabre/WCS/
[libffi]:http://www.linuxfromscratch.org/blfs/view/svn/general/libffi.html
[casacore2]:https://github.com/casacore/casacore/releases
[python-casacore]:https://github.com/casacore/python-casacore/releases
[pycuda]:https://github.com/inducer/pycuda/releases
[montblanc]:https://github.com/ska-sa/montblanc
