Please see: http://doc.packager.io/documentation/buildpacks/ for details on buildpacks.


To specify which build pack to use, you can place a file in the root dir named `.build_type`
```
################################
# This file allows you to override the type detection used by pkgr.
# If you know what type of build you want to use:
# set OVERRIDE_BUILD_TYPE to true
# define a type from the availabe build-types below
# BUILD_TYPE=java-jar
# Available build-types
# generic
# go-lang
# java-jar
# java-multi-jar
# perl
# php
################################
BUILD_TYPE=java-jar
OVERRIDE_BUILD_TYPE=true
```
