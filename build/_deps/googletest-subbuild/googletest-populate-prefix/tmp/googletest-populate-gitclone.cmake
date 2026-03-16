# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

if(EXISTS "/home/charl/Documents/SMP/TP10/smp-tp10-thomascharlestp10/build/_deps" AND EXISTS "googletest-src" AND
  "/home/charl/Documents/SMP/TP10/smp-tp10-thomascharlestp10/build/_deps" IS_NEWER_THAN "googletest-src")
  message(STATUS
    "Avoiding repeated git clone, stamp file is up to date: "
    "'/home/charl/Documents/SMP/TP10/smp-tp10-thomascharlestp10/build/_deps'"
  )
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/home/charl/Documents/SMP/TP10/smp-tp10-thomascharlestp10/build/_deps/googletest-src"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/home/charl/Documents/SMP/TP10/smp-tp10-thomascharlestp10/build/_deps/googletest-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git"
            clone --no-checkout --depth 1 --no-single-branch --origin "DOWNLOAD_EXTRACT8TIMESTAMP" -c http.sslVerify=true "https://github.com/google/googletest.git" ""
    WORKING_DIRECTORY "advice.detachedHead=false"
    RESULT_VARIABLE error_code
  )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once: ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/google/googletest.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git"
          checkout "v1.17.0" --
  WORKING_DIRECTORY "advice.detachedHead=false/"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'v1.17.0'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/bin/git" -c;http.sslVerify=true
            submodule update origin --init TRUE
    WORKING_DIRECTORY "advice.detachedHead=false/"
    RESULT_VARIABLE error_code
  )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: 'advice.detachedHead=false/'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy "googletest-src" "/home/charl/Documents/SMP/TP10/smp-tp10-thomascharlestp10/build/_deps"
  RESULT_VARIABLE error_code
)
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/home/charl/Documents/SMP/TP10/smp-tp10-thomascharlestp10/build/_deps'")
endif()
