mkdir build
cd build

:: -fdefault-integer-8 is not supported on msvc. Should consider moving to clang/msys2
set FCFLAGS=-fdefault-integer-8 %FCFLAGS%
set FFLAGS=-fdefault-integer-8 %FFLAGS%
set CMAKE_CXX_FLAGS=-fvisibility=hidden %CMAKE_CXX_FLAGS%

cmake -G "Ninja" .. ^
    -Wno-dev ^
    -D CMAKE_BUILD_TYPE=%BUILD_TYPE% ^
    -D PYTHON_ROOT_DIR="%PREFIX%" ^
    -D PYTHON_EXECUTABLE:FILEPATH="%PYTHON%" ^
    -D CONFIGURATION_ROOT_DIR="%SRC_DIR%/deps/config" ^
    -D SALOME_CMAKE_DEBUG=ON ^
    -D SALOME_USE_MPI=OFF ^
    -D MED_INT_IS_LONG=ON ^
    -D MEDCOUPLING_BUILD_TESTS=OFF ^
    -D MEDCOUPLING_BUILD_DOC=OFF ^
    -D MEDCOUPLING_USE_64BIT_IDS=ON ^
    -D MEDCOUPLING_USE_MPI=OFF ^
    -D MEDCOUPLING_MEDLOADER_USE_XDR=OFF ^
    -D MEDCOUPLING_INSTALL_PYTHON=%SP_DIR% ^
    -D XDR_INCLUDE_DIRS="" ^
    -D MEDCOUPLING_PARTITIONER_PARMETIS=OFF ^
    -D MEDCOUPLING_PARTITIONER_METIS=OFF ^
    -D MEDCOUPLING_PARTITIONER_SCOTCH=OFF ^
    -D MEDCOUPLING_PARTITIONER_PTSCOTCH=OFF ^
    -D HDF5_ROOT_DIR="%LIBRARY_PREFIX%" ^
    -D SWIG_ROOT_DIR="%LIBRARY_PREFIX%" ^
    -D MEDFILE_ROOT_DIR="%LIBRARY_PREFIX%" ^
    %CMAKE_ARGS%

if errorlevel 1 exit 1
ninja
if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1
