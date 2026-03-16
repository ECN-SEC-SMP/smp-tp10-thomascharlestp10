# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/charl/Documents/SMP/TP10/smp-tp10-thomascharlestp10/build/_deps/googletest-src"
  "/home/charl/Documents/SMP/TP10/smp-tp10-thomascharlestp10/build/_deps/googletest-build"
  "/home/charl/Documents/SMP/TP10/smp-tp10-thomascharlestp10/build/_deps/googletest-subbuild/googletest-populate-prefix"
  "/home/charl/Documents/SMP/TP10/smp-tp10-thomascharlestp10/build/_deps/googletest-subbuild/googletest-populate-prefix/tmp"
  "/home/charl/Documents/SMP/TP10/smp-tp10-thomascharlestp10/build/_deps/googletest-subbuild/googletest-populate-prefix/src/googletest-populate-stamp"
  "/home/charl/Documents/SMP/TP10/smp-tp10-thomascharlestp10/build/_deps/googletest-subbuild/googletest-populate-prefix/src"
  "/home/charl/Documents/SMP/TP10/smp-tp10-thomascharlestp10/build/_deps/googletest-subbuild/googletest-populate-prefix/src/googletest-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/charl/Documents/SMP/TP10/smp-tp10-thomascharlestp10/build/_deps/googletest-subbuild/googletest-populate-prefix/src/googletest-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/charl/Documents/SMP/TP10/smp-tp10-thomascharlestp10/build/_deps/googletest-subbuild/googletest-populate-prefix/src/googletest-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
