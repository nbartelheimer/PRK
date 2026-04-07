#!/bin/bash
#PJM -L "node=4x3"                  # 2 nodes
#PJM -L "rscgrp=small"            # Specify resource group
#PJM -L "elapse=01:00:00"         # Job run time limit value
#PJM -L "freq=2000"
#PJM --mpi "max-proc-per-node=1"  # Upper limit of number of MPI process created at 1 node
#PJM --mpi "shape=4x3"
#PJM -g ra000020 		  # group name
#PJM -x PJM_LLIO_GFSCACHE=/vol0004:/vol0006 # volume names that job uses
#PJM -s

export PLE_MPI_STD_EMPTYFILE=off # Do not create a file if there is no output to stdout/stderr.

. /vol0004/apps/oss/spack/share/spack/setup-env.sh
spack load /fxt4hcv

THREADS=32
ITER=100
DSIZE=16384

mpiexec -mca plm_ple_memory_allocation_policy localalloc ./stencil_vanilla $THREADS $ITER $DSIZE
mpiexec -mca plm_ple_memory_allocation_policy localalloc ./stencil_persistent $THREADS $ITER $DSIZE
mpiexec -mca plm_ple_memory_allocation_policy localalloc ./stencil_fjmpi_persistent $THREADS $ITER $DSIZE


