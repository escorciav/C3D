source activate-compile.sh

# v1.0
cd C3D-v1.0
if make -j32 ; then
  echo "C3D-v1.0 built"
else
  echo "Failed to build C3D-v1.0. Please check the logs above."
  exit 1
fi

cd ..

# v1.1
cd C3D-v1.1
if [ ! -f build/bin/caffe ]; then
  [[ -d build_cmake ]] || mkdir build_cmake
  cd build_cmake
  cmake ..                                      \
    -DCMAKE_PREFIX_PATH=$CONDA_PREFIX           \
    -DCMAKE_BUILD_TYPE="Release"                \
    -DCMAKE_SKIP_RPATH=1                        \
    -DCMAKE_INSTALL_PREFIX=../build             \
    -DCMAKE_VERBOSE_MAKEFILE=ON                 \
    -DBUILD_docs=OFF                            \
    -DBLAS=open                                 \
    -DUSE_LEVELDB=OFF                           \
    -DUSE_LMDB=OFF                              \
    -DUSE_NCCL=ON                               \
    -DCUDA_TOOLKIT_ROOT_DIR=$CUDA_ROOT          \
    -DCUDA_USE_STATIC_CUDA_RUNTIME=OFF

  if make -j32 install ; then
    echo "C3D-v1.1 built."
  else
    echo "Failed to build C3D-v1.1. Please check the logs above."
    exit 1
  fi
fi
