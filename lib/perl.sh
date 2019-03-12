#!/usr/bin/env bash

run_build() {
  local build_dir=${1}
  local cache_dir=${2}
  local env_dir=${3}
  local build_root=${4}

  if [ -d $build_dir/src ]; then

    puts_step "Moving src/lib"
    copy_and_rm_dir "${build_dir}/src/lib" "${build_root}/usr/local/lib/perl5"

    puts_step "Moving src/bin"
    copy_and_rm_dir "${build_dir}/src/bin" "${build_root}/usr/local/bin"

    puts_step "Moving src/cgi-bin"
    copy_and_rm_dir "${build_dir}/src/cgi-bin" "${build_root}/var/www/cgi-bin"
  fi
}

release() {
  :
}
