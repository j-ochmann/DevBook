cmake_minimum_required(VERSION 3.10)
project(TangleProject C)

set(CMAKE_C_STANDARD 11)

# Možnost volby implementace při konfiguraci: cmake -DUSE_MD4C=ON ..
option(USE_MD4C "Pouzit robustni MD4C parser" OFF)

if(USE_MD4C)
    message(STATUS "Buduji s vyuzitim MD4C")
    # Predpoklada se, ze md4c.c a md4c.h jsou v aktualnim adresari
    add_executable(tangle main.c tangle_md4c.c md4c.c)
    target_compile_definitions(tangle PRIVATE USE_MD4C)
else()
    message(STATUS "Buduji jednoduchou verzi (fgets)")
    add_executable(tangle main.c tangle_simple.c)
endif()
