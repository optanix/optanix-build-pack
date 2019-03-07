#!/usr/bin/env bash

export BUILDPACK_STDLIB_URL="https://lang-common.s3.amazonaws.com/buildpack-stdlib/v7/stdlib.sh"

get_app_system_value() {
  local file=${1?"No file specified"}
  local key=${2?"No key specified"}

  # escape for regex
  local escaped_key=$(echo $key | sed "s/\./\\\./g")

  [ -f $file ] && \
    grep -E ^$escaped_key[[:space:]=]+ $file | \
    sed -E -e "s/$escaped_key([\ \t]*=[\ \t]*|[\ \t]+)([A-Za-z0-9\.-]*).*/\2/g"
}

cache_copy() {
  rel_dir=$1
  from_dir=$2
  to_dir=$3
  rm -rf "${to_dir:?}/${rel_dir:?}"
  if [ -d $from_dir/$rel_dir ]; then
    mkdir -p $to_dir/$rel_dir
    cp -pr $from_dir/$rel_dir/. $to_dir/$rel_dir
  fi
}

copy_and_rm_dir() {
  from_dir=$1
  to_dir=$2

  if [ -d $from_dir ]; then
    puts_step "Copying $from_dir to $to_dir"
    mkdir -p $to_dir
    rsync -av $from_dir $to_dir
    puts_step "Removing $from_dir"
    rm -rf $from_dir
  fi
}
