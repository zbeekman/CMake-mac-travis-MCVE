cmake_minimum_required(VERSION 3.12)
project(foo LANGUAGES C CXX)
find_package( MPI )
if ( (NOT MPI_C_FOUND) OR (NOT MPI_Fortran_FOUND) OR (NOT MPIEXEC))
  # Get default install location of MPICH from install.sh
  message(WARNING "Could not find all MPI components!")
  message(FATAL_ERROR "

MPI_C_WORKS        = ${MPI_C_WORKS}
MPI_CXX_WORKS      = ${MPI_CXX_WORKS}
MPI_C_FOUND        = ${MPI_C_FOUND}
MPI_CXX_FOUND      = ${MPI_CXX_FOUND}

MPI_RESULT_C_test_mpi_normal = ${MPI_RESULT_C_test_mpi_normal}
MPI_RESULT_CXX_test_mpi_normal ${MPI_RESULT_CXX_test_mpi_normal}
MPI_RESULT_C_test_mpi_MPICXX = ${MPI_RESULT_C_test_mpi_MPICXX}
MPI_RESULT_CXX_test_mpi_MPICXX ${MPI_RESULT_CXX_test_mpi_MPICXX}

MPI_Fortran_FOUND  = ${MPI_Fortran_FOUND}
MPIEXEC = ${MPIEXEC}
")
endif()
