#!/usr/bin/env bash

run_build() {
  local build_dir=${1}
  local cache_dir=${2}
  local env_dir=${3}
  local build_root=${4}

  if [ -d $build_dir/pkg-src ]; then
    copy_and_rm_dir "${build_dir}/pkg-src/" $build_root
  elif [ -d $1/src/bin ]; then
    copy_and_rm_dir "${build_dir}/src/" $build_dir
  fi
}

release() {
	:
}
