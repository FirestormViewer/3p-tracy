#!/usr/bin/env bash

cd "$(dirname "$0")"

# turn on verbose debugging output for parabuild logs.
exec 4>&1; export BASH_XTRACEFD=4; set -x
# make errors fatal
set -e
# complain about unreferenced env variables
set -u

TRACY_VERSION="0.7.6"
stage="$(pwd)/stage"
echo "${TRACY_VERSION}" > "${stage}/VERSION.txt"

mkdir -p "${stage}/include/tracy"
cp -R tracy/common "${stage}/include/tracy"
cp -R tracy/client "${stage}/include/tracy"
cp -R tracy/libbacktrace "${stage}/include/tracy"
cp tracy/Tracy.hpp "${stage}/include/tracy"
cp tracy/TracyC.h "${stage}/include/tracy"

mkdir -p "${stage}/LICENSES"
cp tracy/LICENSE "${stage}/LICENSES/Tracy.txt"
