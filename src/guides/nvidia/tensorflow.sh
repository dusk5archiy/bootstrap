#!/bin/bash

# --- Guide for building Tensorflow from source

mkdir -p ~/external
cd ~/external

git clone https://github.com/tensorflow/tensorflow.git --depth 1
cd "./tensorflow"

./configure

# Cuda Version: 13.1.1
# Cudnn Version: 9.19.1
# Compute capability: 12.0

bazel build \
  --jobs=10 \
  --experimental_remote_cache_async \
  --remote_download_outputs=minimal \
  --discard_analysis_cache \
  --notrack_incremental_state \
  --strip=always \
  --repo_env=USE_PYWRAP_RULES=1 \
  --repo_env=WHEEL_NAME=tensorflow \
  -c opt \
  --config=cuda --config=cuda_wheel \
  --config=nogcp \
  --linkopt="-B/usr/bin" \
  --linkopt="-Wl,--no-keep-memory" \
  --copt="-g0" \
  --linkopt="-fuse-ld=lld" \
  --local_resources=memory=8192 \
  //tensorflow/tools/pip_package:wheel

# Source the virtual environment and install Tensorflow

pip install ~/external/tensorflow/bazel-bin/tensorflow/tools/pip_package/wheel_house/tensorflow-2.22.0.dev0+selfbuilt-cp314-cp314-linux_x86_64.whl
