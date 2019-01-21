# VASP COMPILE



## ARCHRER: UK National Supercomputer (Cray)

1. Add module: Intel compiler suite and fftw lib

   ```bash
   module swap PrgEnv-cray PrgEnv-intel
   module add fftw
   ```

2. makefile.include
   Add `-DVASP2WANNIER90 ` and `../wannier90-2.1.0/libwannier.a`

   ```bash
   #
   # Make options for VASP 5.4.4 using Intel compiler suite on Cray XC30
   #
   # A. R. Turner, EPCC, University of Edinburgh
   #

   # Precompiler options
   CPP_OPTIONS= -DHOST=\"CrayXC-Intel\" \
                -DMPI \
                -DIFC \
                -DCACHE_SIZE=2000 \
                -Davoidalloc \
                -DMPI_BLOCK=8000 \
                -DscaLAPACK \
                -Duse_collective \
                -Duse_bse_te \
                -Duse_shmem \
                -Dtbdyn \
                -DVASP2WANNIER90

   CPP        = fpp -f_com=no -free -w0  $*$(FUFFIX) $*$(SUFFIX) $(CPP_OPTIONS)

   FC         = ftn -mkl=cluster
   FCL        = ftn -mkl=cluster -lstdc++

   FREE       = -free -names lowercase

   FFLAGS     = -assume byterecl -w
   OFLAG      = -O3 -ip -fno-alias -unroll-aggressive -opt-prefetch -use-intel-optimized-headers -no-prec-div
   OFLAG_IN   = $(OFLAG)
   DEBUG      = -O0

   MKL_PATH   = $(MKLROOT)/lib/intel64
   BLAS       =
   LAPACK     =
   BLACS      =
   SCALAPACK  =

   OBJECTS    = fftmpiw.o fftmpi_map.o fft3dlib.o fftw3d.o

   INCS       = -I$(MKLROOT)/include/fftw

   LLIBS      = ${MKL_PATH}/libmkl_blas95_lp64.a ${MKL_PATH}/libmkl_lapack95_lp64.a \
                ${MKL_PATH}/libmkl_scalapack_lp64.a  \
                -Wl,--start-group ${MKL_PATH}/libmkl_intel_lp64.a \
                ${MKL_PATH}/libmkl_sequential.a ${MKL_PATH}/libmkl_core.a \
                ${MKL_PATH}/libmkl_blacs_intelmpi_lp64.a  -Wl,--end-group \
                ../wannier90-2.1.0/libwannier.a

   OBJECTS_O1 += fftw3d.o fftmpi.o fftmpiw.o
   OBJECTS_O2 += fft3dlib.o

   # For what used to be vasp.5.lib
   CPP_LIB    = $(CPP)
   FC_LIB     = $(FC)
   CC_LIB     = cc
   CFLAGS_LIB = -O
   FFLAGS_LIB = -O1
   FREE_LIB   = $(FREE)

   OBJECTS_LIB= linpack_double.o getshmem.o

   # For the parser library
   CXX_PARS   = CC

   LIBS       += parser
   LLIBS      += -Lparser -lparser -lstdc++

   # Normally no need to change this
   SRCDIR     = ../../src
   BINDIR     = ../../bin

   #================================================
   # GPU Stuff

   CPP_GPU    = -DCUDA_GPU -DRPROMU_CPROJ_OVERLAP -DUSE_PINNED_MEMORY -DCUFFT_MIN=28 -UscaLAPACK

   OBJECTS_GPU = fftmpiw.o fftmpi_map.o fft3dlib.o fftw3d_gpu.o fftmpiw_gpu.o

   CC         = icc
   CXX        = icpc
   CFLAGS     = -fPIC -DADD_ -Wall -openmp -DMAGMA_WITH_MKL -DMAGMA_SETAFFINITY -DGPUSHMEM=300 -DHAVE_CUBLAS

   CUDA_ROOT  ?= /usr/local/cuda/
   NVCC       := $(CUDA_ROOT)/bin/nvcc -ccbin=icc
   CUDA_LIB   := -L$(CUDA_ROOT)/lib64 -lnvToolsExt -lcudart -lcuda -lcufft -lcublas

   GENCODE_ARCH    := -gencode=arch=compute_30,code=\"sm_30,compute_30\" \
                      -gencode=arch=compute_35,code=\"sm_35,compute_35\" \
                      -gencode=arch=compute_60,code=\"sm_60,compute_60\"

   MPI_INC    = $(I_MPI_ROOT)/include64/
   ```

3. make

   ```make
   make all
   ```

Referece

- Archer doc: http://www.archer.ac.uk/documentation/software/vasp/
- VASP Wannier90 doc: https://cms.mpi.univie.ac.at/wiki/index.php/LWANNIER90
- ​

​	

## TOMAS: A UK national hpc hub for materials and molecular modelling



## MAC: MacOS High Sierra 10.13.3

## CX1 & CX2





