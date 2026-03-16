# Version minimale de CMake
cmake_minimum_required(VERSION 3.19)

# Nom du projet
project(TP10)

# Standard C++ utilise
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Tous les fichiers source du dossier src
file(GLOB_RECURSE SOURCES "src/*.cpp")

#lien avec google test

include(FetchContent)

FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG v1.17.0
    DOWNLOAD_EXTRACT8TIMESTAMP TRUE
)

set(BUILD_GMOCK OFF CACHE BOOL "" FORCE)

set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

FetchContent_MakeAvailable(googletest)

enable_testing()

# Creation de l'executable principal
add_executable(output_exec
    ${SOURCES}
)

# Ajout des repertoires d'en-tete necessaires a la cible main
# - include/ : les fichiers .hpp
target_include_directories(output_exec PUBLIC
    include
)

# Liaison avec la bibliotheque trouvee
target_link_libraries(output_exec ${CURSES_LIBRARIES})

