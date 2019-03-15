#!/usr/bin/env bash

run_build() {
  local build_dir=${1}
  local cache_dir=${2}
  local env_dir=${3}
  local build_root=${4}

  cache_copy "target/*.jar" $cache_dir $build_dir
}

release() {
  for jarFile in $(find target -maxdepth 1 -name "*spring-boot.jar" -type f); do
    echo "default_process_types:"
    echo "  web: java -jar $jarFile"
    break;
  done
}
