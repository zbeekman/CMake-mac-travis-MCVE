cmake_minimum_required(VERSION 3.12)

project(foo LANGUAGES C CXX)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR})

# find_package( MPI )
# if ( (NOT MPI_C_FOUND) OR (NOT MPI_Fortran_FOUND) OR (NOT MPIEXEC))
#   # Get default install location of MPICH from install.sh
#   message(WARNING "Could not find all MPI components!")
#   message(STATUS "

# MPIEXEC           = ${MPIEXEC}
# MPI_C_COMPILER    = ${MPI_C_COMPILER}
# MPI_CXX_COMPILER  = ${MPI_CXX_COMPILER}

# MPI_C_WORKS        = ${MPI_C_WORKS}
# MPI_CXX_WORKS      = ${MPI_CXX_WORKS}
# MPI_C_FOUND        = ${MPI_C_FOUND}
# MPI_CXX_FOUND      = ${MPI_CXX_FOUND}

# MPI_RESULT_C_test_mpi_normal   = ${MPI_RESULT_C_test_mpi_normal}
# MPI_RESULT_CXX_test_mpi_normal = ${MPI_RESULT_CXX_test_mpi_normal}
# MPI_RESULT_C_test_mpi_MPICXX   = ${MPI_RESULT_C_test_mpi_MPICXX}
# MPI_RESULT_CXX_test_mpi_MPICXX = ${MPI_RESULT_CXX_test_mpi_MPICXX}
# ")
# endif()


if(EXISTS "/usr/local/opt/mpich/bin/mpicc")
  set(MPI_ASSUME_NO_BUILTIN_MPI TRUE)
  set(MPI_C_COMPILER "/usr/local/opt/mpich/bin/mpicc")
  set(MPI_CXX_COMPILER "/usr/local/opt/mpich/bin/mpic++")
  find_package( MPIDebug )
  if ( (NOT MPI_C_FOUND) OR (NOT MPI_Fortran_FOUND) OR (NOT MPIEXEC))
    # Get default install location of MPICH from install.sh
    message(WARNING "Could not find all MPI components!")
    message(STATUS "

MPIEXEC           = ${MPIEXEC}
MPI_C_COMPILER    = ${MPI_C_COMPILER}
MPI_CXX_COMPILER  = ${MPI_CXX_COMPILER}

MPI_C_WORKS        = ${MPI_C_WORKS}
MPI_CXX_WORKS      = ${MPI_CXX_WORKS}
MPI_C_FOUND        = ${MPI_C_FOUND}
MPI_CXX_FOUND      = ${MPI_CXX_FOUND}

MPI_RESULT_C_test_mpi_normal   = ${MPI_RESULT_C_test_mpi_normal}
MPI_RESULT_CXX_test_mpi_normal = ${MPI_RESULT_CXX_test_mpi_normal}
MPI_RESULT_C_test_mpi_MPICXX   = ${MPI_RESULT_C_test_mpi_MPICXX}
MPI_RESULT_CXX_test_mpi_MPICXX = ${MPI_RESULT_CXX_test_mpi_MPICXX}
")
  endif()
endif()

if(EXISTS "/usr/local/opt/open-mpi/bin/mpicc")
  set(MPI_ASSUME_NO_BUILTIN_MPI TRUE)
  set(MPI_C_COMPILER "/usr/local/opt/open-mpi/bin/mpicc")
  set(MPI_CXX_COMPILER "/usr/local/opt/open-mpi/bin/mpic++")
  find_package( MPIDebug )
  if ( (NOT MPI_C_FOUND) OR (NOT MPI_Fortran_FOUND) OR (NOT MPIEXEC))
    # Get default install location of MPICH from install.sh
    message(WARNING "Could not find all MPI components!")
    message(STATUS "

MPIEXEC           = ${MPIEXEC}
MPI_C_COMPILER    = ${MPI_C_COMPILER}
MPI_CXX_COMPILER  = ${MPI_CXX_COMPILER}

MPI_C_WORKS        = ${MPI_C_WORKS}
MPI_CXX_WORKS      = ${MPI_CXX_WORKS}
MPI_C_FOUND        = ${MPI_C_FOUND}
MPI_CXX_FOUND      = ${MPI_CXX_FOUND}

MPI_RESULT_C_test_mpi_normal   = ${MPI_RESULT_C_test_mpi_normal}
MPI_RESULT_CXX_test_mpi_normal = ${MPI_RESULT_CXX_test_mpi_normal}
MPI_RESULT_C_test_mpi_MPICXX   = ${MPI_RESULT_C_test_mpi_MPICXX}
MPI_RESULT_CXX_test_mpi_MPICXX = ${MPI_RESULT_CXX_test_mpi_MPICXX}
")
  endif()
endif()
