cmake_minimum_required(VERSION 3.4)
cmake_policy(VERSION 3.4...3.12)
project(foo LANGUAGES C CXX Fortran)

# Get all propreties that cmake supports
execute_process(COMMAND cmake --help-property-list OUTPUT_VARIABLE CMAKE_PROPERTY_LIST)

# Convert command output into a CMake list
STRING(REGEX REPLACE ";" "\\\\;" CMAKE_PROPERTY_LIST "${CMAKE_PROPERTY_LIST}")
STRING(REGEX REPLACE "\n" ";" CMAKE_PROPERTY_LIST "${CMAKE_PROPERTY_LIST}")

function(print_properties)
    message ("CMAKE_PROPERTY_LIST = ${CMAKE_PROPERTY_LIST}")
endfunction(print_properties)

function(print_target_properties tgt)
    if(NOT TARGET ${tgt})
      message("There is no target named '${tgt}'")
      return()
    endif()

    foreach (prop ${CMAKE_PROPERTY_LIST})
        string(REPLACE "<CONFIG>" "${CMAKE_BUILD_TYPE}" prop ${prop})
    # Fix https://stackoverflow.com/questions/32197663/how-can-i-remove-the-the-location-property-may-not-be-read-from-target-error-i
    if(prop STREQUAL "LOCATION" OR prop MATCHES "^LOCATION_" OR prop MATCHES "_LOCATION$")
        continue()
    endif()
        # message ("Checking ${prop}")
        get_property(propval TARGET ${tgt} PROPERTY ${prop} SET)
        if (propval)
            get_target_property(propval ${tgt} ${prop})
            message ("${tgt} ${prop} = ${propval}")
        endif()
    endforeach(prop)
endfunction(print_target_properties)


find_package( MPI
  COMPONENTS C CXX Fortran)

print_target_properties(MPI::MPI_Fortran)
print_target_properties(MPI::MPI_C)
print_target_properties(MPI::MPI_CXX)

if ( (NOT MPI_C_FOUND) OR (NOT MPI_Fortran_FOUND) OR (NOT MPIEXEC))
  # Get default install location of MPICH from install.sh
  message(WARNING "Could not find all MPI components!")
  message(FATAL_ERROR "
MPI_C_FOUND        = ${MPI_C_FOUND}
MPI_CXX_FOUND      = ${MPI_CXX_FOUND}
MPI_Fortran_FOUND  = ${MPI_Fortran_FOUND}
MPIEXEC = ${MPIEXEC}
")
endif()
