#!/usr/bin/env bash

set -o errexit
set -o verbose
set -o pipefail
set -o nounset
set -o errtrace

__file=developer-scripts/travis/test-script.cmake.sh

# Error tracing
# requires `set -o errtrace`
__caf_err_report() {
    error_code=${?}
    echo "Error (code=${error_code}) in ${__file} in function ${1} on line ${2}." >&2
    false
    return ${error_code}
}
# Always provide an error backtrace
trap '__caf_err_report "${FUNCNAME:-.}" ${LINENO}' ERR

echo "Performing Travis-CI script phase for the OpenCoarrays direct cmake build..."

for version in ${GCC}; do
    mkdir "cmake-build-gcc${GCC}"
    export BLD_DIR="cmake-build-gcc${GCC}"
    export FC=gfortran-${version}
    export CC=gcc-${version}
    ${FC} --version
    ${CC} --version
    mpif90 --version && mpif90 -show
    mpicc --version && mpicc -show

    # shellcheck disable=SC2153
    for BUILD_TYPE in ${BUILD_TYPES}; do
	# shellcheck disable=SC2015
	[[ -d "${BLD_DIR}" ]] && rm -rf "${BLD_DIR:?}"/* || true
	(
	    cd "${BLD_DIR}"
	    cmake -Wdev \
		  -DCMAKE_INSTALL_PREFIX:PATH="${HOME}/OpenCoarrays" \
		  -DCMAKE_BUILD_TYPE:STRING="${BUILD_TYPE}" \
		  -DMPI_CXX_SKIP_MPICXX:BOOL=ON \
		  -DMPI_ASSUME_NO_BUILTIN_MPI:BOOL=ON \
		  -DMPI_SKIP_GUESSING:BOOL=ON ..
	)
    done
done
echo "Done."
