cmake_minimum_required(VERSION 3.4)
cmake_policy(VERSION 3.4...3.12)
project(foo LANGUAGES C)
find_package( MPI
  COMPONENTS C)
if ( (NOT MPI_C_FOUND) OR (NOT MPIEXEC))
  # Get default install location of MPICH from install.sh
  message(WARNING "Could not find all MPI components!")
  message(FATAL_ERROR "
MPI_C_FOUND        = ${MPI_C_FOUND}
MPI_CXX_FOUND      = ${MPI_CXX_FOUND}
MPI_Fortran_FOUND  = ${MPI_Fortran_FOUND}
MPIEXEC = ${MPIEXEC}
")
endif()
