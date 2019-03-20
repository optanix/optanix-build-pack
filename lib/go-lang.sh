#!/usr/bin/env bash

run_build() {
  local build_dir=${1}
  local cache_dir=${2}
  local env_dir=${3}
  local build_root=${4}

  if [ -d $build_dir/pkg-src ]; then
    puts_step "Moving pkg-src"
  	copy_and_rm_dir "${build_dir}/pkg-src/" $build_root
  fi

  copy_and_rm_dir "bin/" ${build_root}/usr/local/bin/
  
}


release() {
  for goBinary in $(find bin -maxdepth 1 -name "*" -type f); do
    echo "default_process_types:"
    echo "  web: $goBinary"
    break;
  done
}
