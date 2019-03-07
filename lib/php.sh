#!/usr/bin/env bash

run_build() {
  local build_dir=${1}
  local cache_dir=${2}
  local env_dir=${3}
  local build_root=${4}

  cache_copy "bin" $cache_dir $build_dir
}

release() {

}
